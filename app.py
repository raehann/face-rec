from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify, Response
import mysql.connector
import cv2
from PIL import Image
import numpy as np
import os
import io
import time
import xlwt
from werkzeug.security import check_password_hash, generate_password_hash
from datetime import date
from datetime import datetime
from openpyxl import Workbook
import pymysql

app = Flask(__name__, template_folder='templates', static_folder='static')

cnt = 0
pause_cnt = 0
justscanned = False

app.secret_key = 'facerec'

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="",
    database="facerec"
)
mycursor = mydb.cursor(dictionary=True)

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Generate dataset >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
def generate_dataset(nbr):
    face_classifier = cv2.CascadeClassifier("resources/haarcascade_frontalface_default.xml")

    def face_cropped(img):
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_classifier.detectMultiScale(gray, 1.3, 5)

        if len(faces) == 0:
            return None
        for (x, y, w, h) in faces:
            cropped_face = img[y:y + h, x:x + w]
        return cropped_face

    cap = cv2.VideoCapture(0)

    mycursor.execute("SELECT IFNULL(MAX(id), 0) AS last_id FROM face_dataset")
    row = mycursor.fetchone()

    # Periksa apakah row tidak None dan ambil last_id
    lastid = row['last_id'] if row else 0  # Menggunakan nama kolom jika menggunakan DictCursor

    img_id = lastid
    max_imgid = img_id + 200
    count_img = 0

    while True:
        ret, img = cap.read()
        if face_cropped(img) is not None:
            count_img += 1
            img_id += 1
            face = cv2.resize(face_cropped(img), (200, 200))
            face = cv2.cvtColor(face, cv2.COLOR_BGR2GRAY)

            file_name_path = "dataset/" + nbr + "." + str(img_id) + ".jpg"
            file_name_path2 = nbr + "." + str(img_id) + ".jpg"
            cv2.imwrite(file_name_path, face)
            cv2.putText(face, str(count_img), (50, 50), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 255, 0), 2)

            mycursor.execute("""INSERT INTO `face_dataset` (`id`, `user_profile_id`, `img_path`) VALUES
                                (%s, %s, %s)""", (img_id, nbr, file_name_path2))
            mydb.commit()

            frame = cv2.imencode('.jpg', face)[1].tobytes()
            yield (b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

            if cv2.waitKey(1) == 13 or int(img_id) == int(max_imgid):
                break

    cap.release()
    cv2.destroyAllWindows()


def face_recognition():
    global current_user_info, justscanned

    # Variabel global untuk menyimpan status terakhir
    current_user_info = None
    last_detected_id = None
    detection_time = None
    justscanned = False  # Inisialisasi dengan nilai default False

    progress = 0  # Inisialisasi progress bar
    detecting_face = False  # Status apakah wajah sedang terdeteksi

    def draw_boundary(img, classifier, scaleFactor, minNeighbors, color, clf):
        global current_user_info  # Gunakan variabel global
        nonlocal last_detected_id, detection_time, progress, detecting_face

        gray_image = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        features = classifier.detectMultiScale(gray_image, scaleFactor, minNeighbors)

        if len(features) > 0:  # Jika wajah terdeteksi
            detecting_face = True
            for (x, y, w, h) in features:
                cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)

                face_region = gray_image[y:y + h, x:x + w]
                if face_region.size == 0:
                    continue

                id, pred = clf.predict(face_region)
                confidence = int(200 * (1 - pred / 300))

                if confidence > 90:
                    # Nama muncul di layar jika confidence tinggi
                    mycursor.execute("SELECT user_profile_id FROM face_dataset WHERE id = %s", (id,))
                    face_data = mycursor.fetchone()

                    if face_data:
                        user_profile_id = face_data['user_profile_id']
                        mycursor.execute("SELECT * FROM user_profiles WHERE id = %s", (user_profile_id,))
                        user_data = mycursor.fetchone()

                        if user_data:
                            cv2.putText(img, user_data['name'], (x, y - 10),
                                        cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2, cv2.LINE_AA)

                            if progress == 100:  # Biodata hanya diambil jika progress 100%
                                if last_detected_id != id or not justscanned:
                                    try:
                                        mycursor.execute(
                                            "INSERT INTO scan_history (user_profile_id, scan_date, scan_time) VALUES (%s, CURDATE(), NOW())",
                                            (user_profile_id,))
                                        mydb.commit()
                                        last_detected_id = id
                                        detection_time = time.time()
                                        current_user_info = user_data  # Simpan info pengguna untuk antarmuka
                                        justscanned = True
                                        print(f"User {user_data['name']} berhasil diproses.")
                                    except mysql.connector.Error as err:
                                        print(f"Error: {err}")

                                    # Reset progress setelah pemrosesan berhasil
                                    progress = 0
                                    detecting_face = False
                                    break
                            else:
                                justscanned = False
                else:
                    cv2.putText(img, 'Tidak Dikenali', (x, y - 5),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2, cv2.LINE_AA)
        else:  # Jika wajah tidak terdeteksi
            detecting_face = False
            progress = 0  # Reset progress bar

        return img

    def recognize(img, clf, faceCascade):
        return draw_boundary(img, faceCascade, 1.1, 10, (255, 255, 0), clf)

    faceCascade = cv2.CascadeClassifier("resources/haarcascade_frontalface_default.xml")
    clf = cv2.face.LBPHFaceRecognizer_create()
    clf.read("classifier.xml")

    wCam, hCam = 400, 400
    cap = cv2.VideoCapture(0)
    cap.set(3, wCam)
    cap.set(4, hCam)

    while True:
        ret, img = cap.read()

        # Jika wajah terdeteksi, tingkatkan progress bar
        if detecting_face:
            progress += 2  # Tingkatkan progress (atur kecepatannya di sini)
            if progress > 100:
                progress = 100
        else:
            progress = 0  # Reset progress jika tidak ada wajah

        # Overlay progress bar dan persentase di video feed
        cv2.rectangle(img, (10, 10), (10 + progress * 2, 30), (0, 255, 0), -1)
        cv2.putText(img, f'{progress}%', (15, 25),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 1, cv2.LINE_AA)

        img = recognize(img, clf, faceCascade)
        frame = cv2.imencode('.jpg', img)[1].tobytes()

        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')

        key = cv2.waitKey(1)
        if key == 27:
            break


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/masuk', methods=('GET', 'POST'))
def masuk():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        # cek data username
        cursor = mydb.cursor()
        cursor.execute('SELECT * FROM users WHERE username=%s', (username,))
        akun = cursor.fetchone()
        if akun is None:
            flash('Login Gagal, Cek Username Anda', 'danger')
        elif not (akun[3], password):
            flash('Login gagal, Cek Password Anda', 'danger')
        else:
            session['loggedin'] = True
            session['username'] = akun[1]
            session['role'] = akun[4]
            if session['role'] == 'admin':
             return redirect('/admin')
            else:
             return redirect('/index')

    return render_template('masuk.html')

@app.route('/keluar')
def keluar():
    session.pop('loggedin', None)
    session.pop('username', None)
    session.pop('role', None)
    return redirect(url_for('index'))

@app.route('/pindai')
def pindai():
    """Halaman untuk pemindaian wajah dan menampilkan biodata pengguna."""
    mycursor.execute("""
        SELECT up.nim, up.name, up.address, up.phone_number, up.email
        FROM scan_history sh
        JOIN user_profiles up ON sh.user_profile_id = up.id
        WHERE sh.scan_date = CURDATE()
        ORDER BY sh.scan_time DESC
        LIMIT 1
    """)
    user_data = mycursor.fetchall()

    # Debugging: Periksa hasil query
    print("User Data:", user_data)  # Tambahkan ini untuk melihat hasil query

    return render_template('pindai.html', user_data=user_data)


@app.route('/get_last_user_data', methods=['GET'])
def get_last_user_data():
    """API untuk mengambil data pengguna terakhir yang di-scan."""
    mycursor.execute("""
        SELECT up.nim, up.name, up.address, up.phone_number, up.email
        FROM scan_history sh
        JOIN user_profiles up ON sh.user_profile_id = up.id
        WHERE sh.scan_date = CURDATE()
        ORDER BY sh.scan_time DESC
        LIMIT 1
    """)
    user_data = mycursor.fetchone()

    if user_data:
        return jsonify(success=True, user={
            'nim': user_data['nim'],
            'name': user_data['name'],
            'address': user_data['address'],
            'phone_number': user_data['phone_number'],
            'email': user_data['email']
        })
    return jsonify(success=False)


# # Variabel global untuk menyimpan informasi pengguna yang dipindai
# current_user_info = {}
#
# @app.route('/get_user_info', methods=['GET'])
# def get_user_info():
#     return jsonify(current_user_info)

@app.route('/get_user_info/<int:user_id>', methods=['GET'])
def get_user_info(user_id):
    """Mengambil informasi pengguna berdasarkan ID."""
    mycursor.execute("""
        SELECT up.nim, up.name, up.address, up.phone_number, up.email
        FROM user_profiles up
        WHERE up.id = %s
    """, (user_id,))
    user_data = mycursor.fetchall()

    # Mengembalikan data dalam format JSON
    if user_data:
        return jsonify(user_data)
    else:
        return jsonify([])  # Kembalikan list kosong jika tidak ada data

@app.route('/admin')
def admin():
    if 'loggedin' not in session:
        return redirect(url_for('masuk'))
    elif session['role'] != 'admin':
        return redirect(url_for('masuk'))

    # Fetch scan history data with join on user_profiles
    query = """
    SELECT 
        sh.id AS scan_id, 
        DATE_FORMAT(sh.scan_date, '%d-%m-%Y') AS scan_date,  -- Menggunakan scan_date
        TIME(sh.scan_time) AS scan_time,  -- Menggunakan scan_time
        up.nim, 
        up.name, 
        up.address, 
        up.phone_number AS phone, 
        up.email
    FROM scan_history sh
    INNER JOIN user_profiles up ON sh.user_profile_id = up.id ORDER BY sh.scan_date DESC, sh.scan_time DESC
    """
    mycursor.execute(query)
    scan_history_records = mycursor.fetchall()

    # Process data
    scan_history = []
    for record in scan_history_records:
        # Tidak perlu memisahkan tanggal dan waktu
        tanggal = record['scan_date']  # Menggunakan scan_date langsung
        jam = record['scan_time']  # Menggunakan scan_time langsung
        scan_history.append({
            'Tanggal': tanggal,
            'Jam': jam,
            'NIM': record['nim'],
            'Nama': record['name'],
            'Alamat': record['address'],
            'No HP': record['phone'],
            'Email': record['email']
        })

    return render_template('admin.html', scan_history=scan_history)


@app.route('/registrasi', methods=['GET', 'POST'])
def registrasi():
    if 'loggedin' not in session:
        return redirect(url_for('masuk'))

    if request.method == 'POST':
        nim = request.form['nim']
        name = request.form['name']
        address = request.form['address']
        phone_number = request.form['phone_number']
        email = request.form['email']
        created_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        # Simpan data ke dalam tabel user_profiles
        query = """
            INSERT INTO user_profiles (nim, name, address, phone_number, email, active, created_at)
            VALUES (%s, %s, %s, %s, %s, 0, %s)
        """
        values = (nim, name, address, phone_number, email, created_at)
        mycursor.execute(query, values)
        mydb.commit()

        # Ambil ID pengguna yang baru saja diregistrasi
        user_profile_id = mycursor.lastrowid

        # Update status active menjadi 1
        mycursor.execute("UPDATE user_profiles SET active = 1 WHERE id = %s", (user_profile_id,))
        mydb.commit()

        # Redirect ke halaman pindai wajah dengan parameter user_profile_id
        return redirect(url_for('pindai_regis', user_profile_id=user_profile_id))

    # Jika GET request, beri nilai default user_profile_id agar template tidak error
    return render_template('registrasi.html', user_profile_id=None)

@app.route('/pindai-regis')
def pindai_regis():
    user_profile_id = request.args.get('user_profile_id')  # Ambil user_profile_id dari parameter query
    return render_template('pindai-regis.html', user_profile_id=user_profile_id)

@app.route('/vidfeed_dataset/<int:nbr>')
def vidfeed_dataset(nbr):
    # Jalankan fungsi generate_dataset dengan parameter ID pengguna
    return Response(generate_dataset(str(nbr)), mimetype='multipart/x-mixed-replace; boundary=frame')

# @app.route('/train_classifier/<int:nbr>', methods=['GET'])
# def train_classifier(nbr):
#     dataset_dir = "dataset/"
#
#     path = [os.path.join(dataset_dir, f) for f in os.listdir(dataset_dir) if f.startswith(str(nbr) + ".")]
#     faces = []
#     ids = []
#
#     for image in path:
#         img = Image.open(image).convert('L')
#         image_np = np.array(img, 'uint8')
#         id = int(os.path.split(image)[1].split(".")[1])
#
#         faces.append(image_np)
#         ids.append(id)
#
#     ids = np.array(ids)
#
#     # Latih classifier dan simpan model
#     clf = cv2.face.LBPHFaceRecognizer_create()
#     clf.train(faces, ids)
#     clf.write("classifier.xml")
#
#     # Redirect ke halaman admin setelah selesai training
#     return redirect(url_for('admin'))

@app.route('/train_classifier/<int:nbr>', methods=['GET'])
def train_classifier(nbr):
    dataset_dir = "dataset/"

    path = [os.path.join(dataset_dir, f) for f in os.listdir(dataset_dir) if f.startswith(str(nbr) + ".")]
    faces = []
    ids = []

    for image in path:
        img = Image.open(image).convert('L')
        image_np = np.array(img, 'uint8')
        id = int(os.path.split(image)[1].split(".")[1])

        faces.append(image_np)
        ids.append(id)

    ids = np.array(ids)

    # Cek apakah file classifier.xml sudah ada
    clf = cv2.face.LBPHFaceRecognizer_create()
    if os.path.exists("classifier.xml"):
        clf.read("classifier.xml")  # Memuat model lama

    # Update model lama dengan data baru
    clf.update(faces, ids)  # Tambahkan data baru tanpa menghapus yang lama
    clf.write("classifier.xml")  # Simpan model ke file

    return redirect(url_for('admin'))


@app.route('/video_feed')
def video_feed():
    # Video streaming route. Put this in the src attribute of an img tag
    return Response(face_recognition(), mimetype='multipart/x-mixed-replace; boundary=frame')


if __name__ == "__main__":
    app.run(host='127.0.0.1', port=5000, debug=True)
