-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 02:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facerec`
--

-- --------------------------------------------------------

--
-- Table structure for table `face_dataset`
--

CREATE TABLE `face_dataset` (
  `id` int(11) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  `img_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `face_dataset`
--

INSERT INTO `face_dataset` (`id`, `user_profile_id`, `img_path`) VALUES
(1, 24, '24.1.jpg'),
(2, 24, '24.2.jpg'),
(3, 24, '24.3.jpg'),
(4, 24, '24.4.jpg'),
(5, 24, '24.5.jpg'),
(6, 24, '24.6.jpg'),
(7, 24, '24.7.jpg'),
(8, 24, '24.8.jpg'),
(9, 24, '24.9.jpg'),
(10, 24, '24.10.jpg'),
(11, 24, '24.11.jpg'),
(12, 24, '24.12.jpg'),
(13, 24, '24.13.jpg'),
(14, 24, '24.14.jpg'),
(15, 24, '24.15.jpg'),
(16, 24, '24.16.jpg'),
(17, 24, '24.17.jpg'),
(18, 24, '24.18.jpg'),
(19, 24, '24.19.jpg'),
(20, 24, '24.20.jpg'),
(21, 24, '24.21.jpg'),
(22, 24, '24.22.jpg'),
(23, 24, '24.23.jpg'),
(24, 24, '24.24.jpg'),
(25, 24, '24.25.jpg'),
(26, 24, '24.26.jpg'),
(27, 24, '24.27.jpg'),
(28, 24, '24.28.jpg'),
(29, 24, '24.29.jpg'),
(30, 24, '24.30.jpg'),
(31, 24, '24.31.jpg'),
(32, 24, '24.32.jpg'),
(33, 24, '24.33.jpg'),
(34, 24, '24.34.jpg'),
(35, 24, '24.35.jpg'),
(36, 24, '24.36.jpg'),
(37, 24, '24.37.jpg'),
(38, 24, '24.38.jpg'),
(39, 24, '24.39.jpg'),
(40, 24, '24.40.jpg'),
(41, 24, '24.41.jpg'),
(42, 24, '24.42.jpg'),
(43, 24, '24.43.jpg'),
(44, 24, '24.44.jpg'),
(45, 24, '24.45.jpg'),
(46, 24, '24.46.jpg'),
(47, 24, '24.47.jpg'),
(48, 24, '24.48.jpg'),
(49, 24, '24.49.jpg'),
(50, 24, '24.50.jpg'),
(51, 24, '24.51.jpg'),
(52, 24, '24.52.jpg'),
(53, 24, '24.53.jpg'),
(54, 24, '24.54.jpg'),
(55, 24, '24.55.jpg'),
(56, 24, '24.56.jpg'),
(57, 24, '24.57.jpg'),
(58, 24, '24.58.jpg'),
(59, 24, '24.59.jpg'),
(60, 24, '24.60.jpg'),
(61, 24, '24.61.jpg'),
(62, 24, '24.62.jpg'),
(63, 24, '24.63.jpg'),
(64, 24, '24.64.jpg'),
(65, 24, '24.65.jpg'),
(66, 24, '24.66.jpg'),
(67, 24, '24.67.jpg'),
(68, 24, '24.68.jpg'),
(69, 24, '24.69.jpg'),
(70, 24, '24.70.jpg'),
(71, 24, '24.71.jpg'),
(72, 24, '24.72.jpg'),
(73, 24, '24.73.jpg'),
(74, 24, '24.74.jpg'),
(75, 24, '24.75.jpg'),
(76, 24, '24.76.jpg'),
(77, 24, '24.77.jpg'),
(78, 24, '24.78.jpg'),
(79, 24, '24.79.jpg'),
(80, 24, '24.80.jpg'),
(81, 24, '24.81.jpg'),
(82, 24, '24.82.jpg'),
(83, 24, '24.83.jpg'),
(84, 24, '24.84.jpg'),
(85, 24, '24.85.jpg'),
(86, 24, '24.86.jpg'),
(87, 24, '24.87.jpg'),
(88, 24, '24.88.jpg'),
(89, 24, '24.89.jpg'),
(90, 24, '24.90.jpg'),
(91, 24, '24.91.jpg'),
(92, 24, '24.92.jpg'),
(93, 24, '24.93.jpg'),
(94, 24, '24.94.jpg'),
(95, 24, '24.95.jpg'),
(96, 24, '24.96.jpg'),
(97, 24, '24.97.jpg'),
(98, 24, '24.98.jpg'),
(99, 24, '24.99.jpg'),
(100, 24, '24.100.jpg'),
(101, 24, '24.101.jpg'),
(102, 24, '24.102.jpg'),
(103, 24, '24.103.jpg'),
(104, 24, '24.104.jpg'),
(105, 24, '24.105.jpg'),
(106, 24, '24.106.jpg'),
(107, 24, '24.107.jpg'),
(108, 24, '24.108.jpg'),
(109, 24, '24.109.jpg'),
(110, 24, '24.110.jpg'),
(111, 24, '24.111.jpg'),
(112, 24, '24.112.jpg'),
(113, 24, '24.113.jpg'),
(114, 24, '24.114.jpg'),
(115, 24, '24.115.jpg'),
(116, 24, '24.116.jpg'),
(117, 24, '24.117.jpg'),
(118, 24, '24.118.jpg'),
(119, 24, '24.119.jpg'),
(120, 24, '24.120.jpg'),
(121, 24, '24.121.jpg'),
(122, 24, '24.122.jpg'),
(123, 24, '24.123.jpg'),
(124, 24, '24.124.jpg'),
(125, 24, '24.125.jpg'),
(126, 24, '24.126.jpg'),
(127, 24, '24.127.jpg'),
(128, 24, '24.128.jpg'),
(129, 24, '24.129.jpg'),
(130, 24, '24.130.jpg'),
(131, 24, '24.131.jpg'),
(132, 24, '24.132.jpg'),
(133, 24, '24.133.jpg'),
(134, 24, '24.134.jpg'),
(135, 24, '24.135.jpg'),
(136, 24, '24.136.jpg'),
(137, 24, '24.137.jpg'),
(138, 24, '24.138.jpg'),
(139, 24, '24.139.jpg'),
(140, 24, '24.140.jpg'),
(141, 24, '24.141.jpg'),
(142, 24, '24.142.jpg'),
(143, 24, '24.143.jpg'),
(144, 24, '24.144.jpg'),
(145, 24, '24.145.jpg'),
(146, 24, '24.146.jpg'),
(147, 24, '24.147.jpg'),
(148, 24, '24.148.jpg'),
(149, 24, '24.149.jpg'),
(150, 24, '24.150.jpg'),
(151, 24, '24.151.jpg'),
(152, 24, '24.152.jpg'),
(153, 24, '24.153.jpg'),
(154, 24, '24.154.jpg'),
(155, 24, '24.155.jpg'),
(156, 24, '24.156.jpg'),
(157, 24, '24.157.jpg'),
(158, 24, '24.158.jpg'),
(159, 24, '24.159.jpg'),
(160, 24, '24.160.jpg'),
(161, 24, '24.161.jpg'),
(162, 24, '24.162.jpg'),
(163, 24, '24.163.jpg'),
(164, 24, '24.164.jpg'),
(165, 24, '24.165.jpg'),
(166, 24, '24.166.jpg'),
(167, 24, '24.167.jpg'),
(168, 24, '24.168.jpg'),
(169, 24, '24.169.jpg'),
(170, 24, '24.170.jpg'),
(171, 24, '24.171.jpg'),
(172, 24, '24.172.jpg'),
(173, 24, '24.173.jpg'),
(174, 24, '24.174.jpg'),
(175, 24, '24.175.jpg'),
(176, 24, '24.176.jpg'),
(177, 24, '24.177.jpg'),
(178, 24, '24.178.jpg'),
(179, 24, '24.179.jpg'),
(180, 24, '24.180.jpg'),
(181, 24, '24.181.jpg'),
(182, 24, '24.182.jpg'),
(183, 24, '24.183.jpg'),
(184, 24, '24.184.jpg'),
(185, 24, '24.185.jpg'),
(186, 24, '24.186.jpg'),
(187, 24, '24.187.jpg'),
(188, 24, '24.188.jpg'),
(189, 24, '24.189.jpg'),
(190, 24, '24.190.jpg'),
(191, 24, '24.191.jpg'),
(192, 24, '24.192.jpg'),
(193, 24, '24.193.jpg'),
(194, 24, '24.194.jpg'),
(195, 24, '24.195.jpg'),
(196, 24, '24.196.jpg'),
(197, 24, '24.197.jpg'),
(198, 24, '24.198.jpg'),
(199, 24, '24.199.jpg'),
(200, 24, '24.200.jpg'),
(201, 25, '25.201.jpg'),
(202, 25, '25.202.jpg'),
(203, 25, '25.203.jpg'),
(204, 25, '25.204.jpg'),
(205, 25, '25.205.jpg'),
(206, 25, '25.206.jpg'),
(207, 25, '25.207.jpg'),
(208, 25, '25.208.jpg'),
(209, 25, '25.209.jpg'),
(210, 25, '25.210.jpg'),
(211, 25, '25.211.jpg'),
(212, 25, '25.212.jpg'),
(213, 25, '25.213.jpg'),
(214, 25, '25.214.jpg'),
(215, 25, '25.215.jpg'),
(216, 25, '25.216.jpg'),
(217, 25, '25.217.jpg'),
(218, 25, '25.218.jpg'),
(219, 25, '25.219.jpg'),
(220, 25, '25.220.jpg'),
(221, 25, '25.221.jpg'),
(222, 25, '25.222.jpg'),
(223, 25, '25.223.jpg'),
(224, 25, '25.224.jpg'),
(225, 25, '25.225.jpg'),
(226, 25, '25.226.jpg'),
(227, 25, '25.227.jpg'),
(228, 25, '25.228.jpg'),
(229, 25, '25.229.jpg'),
(230, 25, '25.230.jpg'),
(231, 25, '25.231.jpg'),
(232, 25, '25.232.jpg'),
(233, 25, '25.233.jpg'),
(234, 25, '25.234.jpg'),
(235, 25, '25.235.jpg'),
(236, 25, '25.236.jpg'),
(237, 25, '25.237.jpg'),
(238, 25, '25.238.jpg'),
(239, 25, '25.239.jpg'),
(240, 25, '25.240.jpg'),
(241, 25, '25.241.jpg'),
(242, 25, '25.242.jpg'),
(243, 25, '25.243.jpg'),
(244, 25, '25.244.jpg'),
(245, 25, '25.245.jpg'),
(246, 25, '25.246.jpg'),
(247, 25, '25.247.jpg'),
(248, 25, '25.248.jpg'),
(249, 25, '25.249.jpg'),
(250, 25, '25.250.jpg'),
(251, 25, '25.251.jpg'),
(252, 25, '25.252.jpg'),
(253, 25, '25.253.jpg'),
(254, 25, '25.254.jpg'),
(255, 25, '25.255.jpg'),
(256, 25, '25.256.jpg'),
(257, 25, '25.257.jpg'),
(258, 25, '25.258.jpg'),
(259, 25, '25.259.jpg'),
(260, 25, '25.260.jpg'),
(261, 25, '25.261.jpg'),
(262, 25, '25.262.jpg'),
(263, 25, '25.263.jpg'),
(264, 25, '25.264.jpg'),
(265, 25, '25.265.jpg'),
(266, 25, '25.266.jpg'),
(267, 25, '25.267.jpg'),
(268, 25, '25.268.jpg'),
(269, 25, '25.269.jpg'),
(270, 25, '25.270.jpg'),
(271, 25, '25.271.jpg'),
(272, 25, '25.272.jpg'),
(273, 25, '25.273.jpg'),
(274, 25, '25.274.jpg'),
(275, 25, '25.275.jpg'),
(276, 25, '25.276.jpg'),
(277, 25, '25.277.jpg'),
(278, 25, '25.278.jpg'),
(279, 25, '25.279.jpg'),
(280, 25, '25.280.jpg'),
(281, 25, '25.281.jpg'),
(282, 25, '25.282.jpg'),
(283, 25, '25.283.jpg'),
(284, 25, '25.284.jpg'),
(285, 25, '25.285.jpg'),
(286, 25, '25.286.jpg'),
(287, 25, '25.287.jpg'),
(288, 25, '25.288.jpg'),
(289, 25, '25.289.jpg'),
(290, 25, '25.290.jpg'),
(291, 25, '25.291.jpg'),
(292, 25, '25.292.jpg'),
(293, 25, '25.293.jpg'),
(294, 25, '25.294.jpg'),
(295, 25, '25.295.jpg'),
(296, 25, '25.296.jpg'),
(297, 25, '25.297.jpg'),
(298, 25, '25.298.jpg'),
(299, 25, '25.299.jpg'),
(300, 25, '25.300.jpg'),
(301, 25, '25.301.jpg'),
(302, 25, '25.302.jpg'),
(303, 25, '25.303.jpg'),
(304, 25, '25.304.jpg'),
(305, 25, '25.305.jpg'),
(306, 25, '25.306.jpg'),
(307, 25, '25.307.jpg'),
(308, 25, '25.308.jpg'),
(309, 25, '25.309.jpg'),
(310, 25, '25.310.jpg'),
(311, 25, '25.311.jpg'),
(312, 25, '25.312.jpg'),
(313, 25, '25.313.jpg'),
(314, 25, '25.314.jpg'),
(315, 25, '25.315.jpg'),
(316, 25, '25.316.jpg'),
(317, 25, '25.317.jpg'),
(318, 25, '25.318.jpg'),
(319, 25, '25.319.jpg'),
(320, 25, '25.320.jpg'),
(321, 25, '25.321.jpg'),
(322, 25, '25.322.jpg'),
(323, 25, '25.323.jpg'),
(324, 25, '25.324.jpg'),
(325, 25, '25.325.jpg'),
(326, 25, '25.326.jpg'),
(327, 25, '25.327.jpg'),
(328, 25, '25.328.jpg'),
(329, 25, '25.329.jpg'),
(330, 25, '25.330.jpg'),
(331, 25, '25.331.jpg'),
(332, 25, '25.332.jpg'),
(333, 25, '25.333.jpg'),
(334, 25, '25.334.jpg'),
(335, 25, '25.335.jpg'),
(336, 25, '25.336.jpg'),
(337, 25, '25.337.jpg'),
(338, 25, '25.338.jpg'),
(339, 25, '25.339.jpg'),
(340, 25, '25.340.jpg'),
(341, 25, '25.341.jpg'),
(342, 25, '25.342.jpg'),
(343, 25, '25.343.jpg'),
(344, 25, '25.344.jpg'),
(345, 25, '25.345.jpg'),
(346, 25, '25.346.jpg'),
(347, 25, '25.347.jpg'),
(348, 25, '25.348.jpg'),
(349, 25, '25.349.jpg'),
(350, 25, '25.350.jpg'),
(351, 25, '25.351.jpg'),
(352, 25, '25.352.jpg'),
(353, 25, '25.353.jpg'),
(354, 25, '25.354.jpg'),
(355, 25, '25.355.jpg'),
(356, 25, '25.356.jpg'),
(357, 25, '25.357.jpg'),
(358, 25, '25.358.jpg'),
(359, 25, '25.359.jpg'),
(360, 25, '25.360.jpg'),
(361, 25, '25.361.jpg'),
(362, 25, '25.362.jpg'),
(363, 25, '25.363.jpg'),
(364, 25, '25.364.jpg'),
(365, 25, '25.365.jpg'),
(366, 25, '25.366.jpg'),
(367, 25, '25.367.jpg'),
(368, 25, '25.368.jpg'),
(369, 25, '25.369.jpg'),
(370, 25, '25.370.jpg'),
(371, 25, '25.371.jpg'),
(372, 25, '25.372.jpg'),
(373, 25, '25.373.jpg'),
(374, 25, '25.374.jpg'),
(375, 25, '25.375.jpg'),
(376, 25, '25.376.jpg'),
(377, 25, '25.377.jpg'),
(378, 25, '25.378.jpg'),
(379, 25, '25.379.jpg'),
(380, 25, '25.380.jpg'),
(381, 25, '25.381.jpg'),
(382, 25, '25.382.jpg'),
(383, 25, '25.383.jpg'),
(384, 25, '25.384.jpg'),
(385, 25, '25.385.jpg'),
(386, 25, '25.386.jpg'),
(387, 25, '25.387.jpg'),
(388, 25, '25.388.jpg'),
(389, 25, '25.389.jpg'),
(390, 25, '25.390.jpg'),
(391, 25, '25.391.jpg'),
(392, 25, '25.392.jpg'),
(393, 25, '25.393.jpg'),
(394, 25, '25.394.jpg'),
(395, 25, '25.395.jpg'),
(396, 25, '25.396.jpg'),
(397, 25, '25.397.jpg'),
(398, 25, '25.398.jpg'),
(399, 25, '25.399.jpg'),
(400, 25, '25.400.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `scan_history`
--

CREATE TABLE `scan_history` (
  `id` int(11) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  `scan_time` datetime NOT NULL DEFAULT current_timestamp(),
  `scan_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scan_history`
--

INSERT INTO `scan_history` (`id`, `user_profile_id`, `scan_time`, `scan_date`) VALUES
(3916, 24, '2024-12-18 20:24:24', '2024-12-18'),
(3917, 25, '2024-12-18 20:31:44', '2024-12-18'),
(3918, 24, '2024-12-18 20:32:03', '2024-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'admin', '2024-12-13 02:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `nim`, `name`, `address`, `phone_number`, `email`, `active`, `created_at`) VALUES
(24, '11220910000003', 'Raihan Ade Purnomo', 'Cipayung, Depok', '081385321390', 'raihan@mail.com', 1, '2024-12-18 13:23:22'),
(25, '1122091', 'Azriel Ilham Ramadhan', 'Bogor', '0987654312', 'azriel@gmail.com', 1, '2024-12-18 13:29:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `face_dataset`
--
ALTER TABLE `face_dataset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profile_id` (`user_profile_id`);

--
-- Indexes for table `scan_history`
--
ALTER TABLE `scan_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profile_id` (`user_profile_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `face_dataset`
--
ALTER TABLE `face_dataset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2769;

--
-- AUTO_INCREMENT for table `scan_history`
--
ALTER TABLE `scan_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3919;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `face_dataset`
--
ALTER TABLE `face_dataset`
  ADD CONSTRAINT `face_dataset_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scan_history`
--
ALTER TABLE `scan_history`
  ADD CONSTRAINT `scan_history_ibfk_1` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profiles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
