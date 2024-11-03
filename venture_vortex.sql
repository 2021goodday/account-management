-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2024 at 09:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venture_vortex`
--

-- --------------------------------------------------------

--
-- Table structure for table `investor_document`
--

CREATE TABLE `investor_document` (
  `id` int(11) NOT NULL,
  `investor_name` varchar(255) DEFAULT NULL,
  `investor_company` varchar(255) DEFAULT NULL,
  `gov_id` varchar(255) DEFAULT NULL,
  `bir` varchar(255) DEFAULT NULL,
  `sec_registration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending',
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `investor_document`
--

INSERT INTO `investor_document` (`id`, `investor_name`, `investor_company`, `gov_id`, `bir`, `sec_registration`, `created_at`, `status`, `user_email`) VALUES
(11, 'elly buendia', 'rito games', 'eps10-brown-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg', '7653930.png', 'download (1)_1.png', '2024-10-18 16:35:08', 'pending', 'elly@gmail.com'),
(12, 'aki', 'lazada', 'permit_4.png', '7653930_1.png', 'alibaba logo_1.png', '2024-10-20 08:02:45', 'pending', 'aki@gmail.com'),
(13, 'adrielle', 'trendmicro', 'dti_3.png', 'bir_4.png', 'permit_5.png', '2024-10-25 08:25:21', 'pending', NULL),
(14, 'Mentor Name', 'Company Name', '1730070044-feast4.jpg', '1730070044-feast3.png', '1730070044-feast2.png', '2024-10-27 23:00:46', 'pending', 'rjq.software.tester@gmail.com'),
(15, 'Lemon Name', 'Lemon Corp', '1730070044-feast4.jpg', '1730070044-feast3.png', '1730070044-feast2.png', '2024-10-27 23:00:46', 'pending', 'lemon@gmail.com'),
(16, 'aki2', 'Shopee', 'permit_4.png', '7653930_1.png', 'alibaba logo_1.png', '2024-10-20 08:02:45', 'pending', 'aki2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `investor_profiles`
--

CREATE TABLE `investor_profiles` (
  `user_id` int(11) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `achievements` text DEFAULT NULL,
  `social_media_link` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `expertise` text DEFAULT NULL,
  `recent_activities` text DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `investor_profiles`
--

INSERT INTO `investor_profiles` (`user_id`, `phone`, `achievements`, `social_media_link`, `skills`, `expertise`, `recent_activities`, `user_email`) VALUES
(25, '', '', '', 'Python', 'Marketing', '', ''),
(26, '', '', '', 'Communication', 'Marketing', '', ''),
(28, NULL, '', '', '', '', '', 'lemon@gmail.com'),
(29, '09178680239', 'Investor of the year', 'facebook.com/yesyes', 'Math Skills', 'Marketing', 'Investment Activityss', 'rjq.software.tester@gmail.com'),
(30, '9178680239', 'Investor of the year', 'facebook.com/yesyes', 'Math Skills', 'Marketing', 'Investment Activity', 'aki@gmail.com'),
(31, '9178680239', 'Mentor of the year', 'facebook.com/market', 'Marketing Skills', 'Tutor', 'Mentorship Activity', 'elly@gmail.com'),
(32, '9178680239', 'Investor of the year', 'facebook.com/yesyes', 'Math Skills', 'Marketing', 'Investment Activity', 'aki2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pitch`
--

CREATE TABLE `pitch` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `links` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pitch`
--

INSERT INTO `pitch` (`id`, `user_id`, `project_name`, `company_name`, `description`, `links`, `category`, `amount`, `video`, `image`, `pdf`, `created_at`, `updated_at`) VALUES
(31, 31, 'Highways build build program', 'rsth', 'thdtgrfhers', 'ftgfrh', 'E-commerces', NULL, 'assets/img/1729268932_a977c15928330b6ffc3d.mp4', '../VentureVortexWeb/Uploads/RFIDIN.jpg', 'assets/img/1729268932_d6a2973115b3655c7620.pdf', '2024-10-18 16:28:52', '2024-10-28 11:27:52'),
(33, 32, 'Gojo Saturu', 'gojo', 'i love gojo', 'https://www.gojo.com/', 'Food & Beverage', NULL, 'assets/img/1729856814_d7a6658f87d0fbe48b68.mp4', 'assets/img/1729856814_3dfe0486732cc55fa71d.jpg', 'assets/img/1729856814_2a389c8f9028eebaf79a.pdf', '2024-10-25 11:46:54', '2024-10-27 23:48:51'),
(46, 31, 'Trip on mars for science', 'company name', 'test', 'youtube.com', 'category', NULL, NULL, '../VentureVortexWeb/Uploads/262352753_1597480717310427_972818494506717400_n.jpg', '../VentureVortexWeb/Uploads/Medical-Certificate-CS-Form-No.-211-01062024.pdf', '2024-10-28 00:51:44', '2024-10-28 11:28:13'),
(47, 24, 'Trip on venus for science', 'company name', 'test', 'youtube.com', 'category', NULL, NULL, '../VentureVortexWeb/Uploads/262352753_1597480717310427_972818494506717400_n.jpg', '../VentureVortexWeb/Uploads/Medical-Certificate-CS-Form-No.-211-01062024.pdf', '2024-10-28 00:51:44', '2024-10-28 11:28:13'),
(48, 31, 'Againn', 'firefly', 'aptapt', 'apt.com', 'E-commerce', NULL, 'assets/img/1730400846_ae88c69cdc7bdfc806e3.mp4', 'assets/img/1730400846_d786c1cbf58f3d351431.jpg', 'assets/img/1730400846_5bc5d05ffa8652d8a10b.pdf', '2024-10-30 13:37:35', '2024-10-31 18:54:06'),
(49, 31, 'techno', 'tech', 'tegfd', 'awerg', 'Technology', NULL, 'assets/img/1730396532_95732ff0b87115aa1b12.mp4', 'assets/img/1730396532_c5b81992cc258b830319.png', 'assets/img/1730396532_dc861273bcb5f6eb165c.pdf', '2024-10-31 17:42:12', '2024-10-31 17:42:12'),
(50, 36, 'agile', 'sdgaSEDGe', 'adsrfshbrzdsfbh', 'asdrfgbfazserdgd', 'Food & Beverage', NULL, 'assets/img/1730490545_a20e6a84eb21d60d2f70.mp4', 'assets/img/1730490545_534eef7bc66cb048a51f.png', 'assets/img/1730490545_9690edba27bd88f4ea59.pdf', '2024-11-01 19:49:05', '2024-11-01 19:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `progress_report`
--

CREATE TABLE `progress_report` (
  `ps_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `progress_title` varchar(255) DEFAULT NULL,
  `start_date` varchar(100) DEFAULT NULL,
  `target_date` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `description` text DEFAULT NULL,
  `submitted_date` varchar(100) DEFAULT NULL,
  `project_id` varchar(100) NOT NULL COMMENT 'accepted pitch'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress_report`
--

INSERT INTO `progress_report` (`ps_id`, `user_id`, `progress_title`, `start_date`, `target_date`, `status`, `description`, `submitted_date`, `project_id`) VALUES
(1, 31, 'Tanay Neh', '2024-10-15', '2024-11-10', 'Pending', 'The team is in search of other investors taht is willing for this project', '2024-10-05', '31'),
(4, 31, 'Crowd Sourcings 2', '2024-10-29', '2024-10-30', 'Pending', 'test test test test test test test test test test test test test test test test test test test test test', '2024-10-29', '33'),
(5, 31, 'Crowd Sourcings 3', '2024-10-30', '2024-10-31', 'Pending', 'test with project id', '2024-10-29', '46'),
(9, 0, 'edittttttttttttttt', '2024-10-15', '2024-12-14', 'Done', 'gcvfhmmhasdfvvvbdgbfgbfgbdfbgfbbb', NULL, ''),
(10, 0, 'Tsting', '2024-11-11', '2024-11-27', 'Ongoing', 'cvfxvfxvfx', '2024-11-19', '31'),
(12, 0, 'carol', '2024-11-15', '2024-11-25', 'Ongoing', 'asdefgasdfgv', '2024-11-27', '47'),
(13, 0, 'editted', '2024-10-28', '2024-12-07', 'Cancelled', 'safdfd', '2024-11-21', '31'),
(14, 0, 'carol', '2024-11-27', '2024-11-06', 'Ongoing', 'aewerdsdvdsdfvb', '2024-11-17', '47'),
(15, 0, 'serhshs', '2024-11-22', '2024-11-13', 'Ongoing', 'dfsghbdgd', '2024-11-13', '47'),
(22, 36, 'weertw4e', '2024-11-17', '2024-11-21', 'Pending', 'ertyyuhdhtfjnn', '2024-11-15', '50'),
(23, 24, 'tyhjfdhjfh', '2024-11-28', '2024-11-11', 'Ongoing', 'rthrth', '2024-11-20', '47'),
(24, 31, 'editted', '2024-11-18', '2024-11-22', 'Done', 'aesrghasderh', '2024-11-26', '49');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `investor_id` int(11) NOT NULL,
  `startup_id` int(11) NOT NULL,
  `request_type` enum('investment','mentorship') NOT NULL,
  `status` enum('pending','accepted','declined') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `investment_amount` varchar(255) NOT NULL DEFAULT '0' COMMENT 'For investments',
  `who_request` varchar(255) NOT NULL DEFAULT 'Start Up' COMMENT 'request from para ma indicate if si investor or start up ang nag request'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `project_id`, `investor_id`, `startup_id`, `request_type`, `status`, `created_at`, `updated_at`, `investment_amount`, `who_request`) VALUES
(35, 31, 26, 31, 'investment', 'accepted', '2024-10-25 04:10:19', '2024-10-29 07:48:27', '1500', 'Investor'),
(38, 31, 32, 31, 'mentorship', 'accepted', '2024-10-25 07:00:30', '2024-10-29 07:28:08', '0', 'Start Up'),
(55, 31, 25, 31, 'mentorship', 'pending', '2024-10-28 15:41:15', '2024-10-28 15:41:15', '0', 'Start Up'),
(56, 31, 28, 31, 'mentorship', 'pending', '2024-10-28 15:45:34', '2024-10-29 07:23:42', '0', 'Start Up'),
(57, 31, 32, 31, 'mentorship', 'declined', '2024-10-28 15:45:36', '2024-10-28 15:45:43', '0', 'Start Up'),
(58, 46, 32, 31, 'investment', 'accepted', '2024-10-28 16:38:06', '2024-10-29 07:03:46', '150000', 'Start Up'),
(59, 31, 33, 31, 'investment', 'pending', '2024-10-29 06:06:32', '2024-10-29 06:06:32', '0', 'Start Up'),
(60, 33, 32, 32, 'investment', 'pending', '2024-10-29 07:12:45', '2024-10-29 07:12:45', '1000', 'Investor'),
(61, 33, 32, 32, 'investment', 'pending', '2024-10-29 07:13:50', '2024-10-29 07:13:50', '1000', 'Investor'),
(62, 33, 32, 32, 'investment', 'pending', '2024-10-29 07:14:04', '2024-10-29 07:14:04', '1000', 'Investor'),
(63, 33, 32, 32, 'investment', 'pending', '2024-10-29 07:14:30', '2024-10-29 07:14:30', '1000', 'Investor'),
(65, 47, 32, 24, 'mentorship', 'accepted', '2024-10-29 12:26:11', '2024-10-29 12:30:17', '0', 'Investor'),
(66, 48, 28, 31, 'investment', 'accepted', '2024-10-30 06:49:50', '2024-10-30 06:50:21', '0', 'Start Up'),
(67, 49, 25, 31, 'investment', 'pending', '2024-10-31 09:42:42', '2024-10-31 09:42:42', '0', 'Start Up');

-- --------------------------------------------------------

--
-- Table structure for table `startup_activity`
--

CREATE TABLE `startup_activity` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `project` varchar(100) NOT NULL,
  `investor` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `startup_activity`
--

INSERT INTO `startup_activity` (`id`, `transaction_id`, `project`, `investor`, `amount`, `date`) VALUES
(3, 'editssss', 'edit', 'editsdc', 1000000.00, '2024-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `startup_document`
--

CREATE TABLE `startup_document` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `dti_registration` varchar(255) DEFAULT NULL,
  `business_permit` varchar(255) DEFAULT NULL,
  `bir_certificate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending',
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `startup_document`
--

INSERT INTO `startup_document` (`id`, `company_name`, `company_address`, `dti_registration`, `business_permit`, `bir_certificate`, `created_at`, `status`, `user_email`) VALUES
(11, 'riot', 'antipolo', 'dti_2.png', 'permit_3.png', 'bir_3.png', '2024-10-18 15:12:21', 'approved', 'rjq.software.tester@gmail.com'),
(12, 'riot2', 'antipolo', 'images.png', '1131w-Ina0HeyTFUk.webp', 'explain.PNG', '2024-10-18 16:31:38', 'pending', 'tanlegazpi@gmail.com'),
(14, 'RJQ Solutions', 'San Fernando La Union', '1730069226-feast1 (1).png', '1730069226-feast1.png', '1730069226-feast2.png', '2024-10-27 22:47:09', 'pending', 'ricojames.softdevsss@gmail.com'),
(15, 'riot3', 'antipolo', 'images.png', '1131w-Ina0HeyTFUk.webp', 'explain.PNG', '2024-10-18 16:31:38', 'pending', 'caroline@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `startup_profiles`
--

CREATE TABLE `startup_profiles` (
  `user_id` int(11) NOT NULL,
  `about_company` text DEFAULT NULL,
  `achievements` text DEFAULT NULL,
  `social_media_link` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `startup_profiles`
--

INSERT INTO `startup_profiles` (`user_id`, `about_company`, `achievements`, `social_media_link`, `contact_info`, `user_email`) VALUES
(1, 'My company a small software solution firm that aims to give people their software idea`s to life.', 'Startup of the year', 'facebook/jamessniper135', '09178680239', 'ricojames.softdevsss@gmail.com'),
(2, 'tester', 'Startup of the universe', 'facebook/jamessniper13555', '09178680235', 'tanlegazpi@gmail.com'),
(3, 'tester2', 'Startup of the universe', 'facebook/jamessniper13555', '09178680235', 'caroline@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE `tbl_messages` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `admin_id` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `from_user` varchar(255) DEFAULT NULL COMMENT 'admin / customer',
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(100) DEFAULT 'Unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_messages`
--

INSERT INTO `tbl_messages` (`id`, `customer_id`, `admin_id`, `message`, `from_user`, `date_created`, `status`) VALUES
(238, '31', '25', 'TEST1', 'Start Up', '2024-08-21 19:33:53', 'read'),
(239, '31', '25', 'TEST2', 'Investor', '2024-08-21 19:37:03', 'read'),
(263, '31', '25', 'test3', 'Start Up', '2024-10-28 16:27:14', 'read'),
(264, '31', '25', 'me', 'Start Up', '2024-10-28 16:27:54', 'read'),
(265, '31', '25', 'Hi sissy', 'Start Up', '2024-10-28 16:32:42', 'read'),
(266, '31', '26', 'test 3', 'Start Up', '2024-10-28 16:37:52', 'read'),
(271, '32', '31', 'TEST1', 'Investor', '2024-10-29 05:17:15', 'read'),
(272, '32', '31', 'TEST1', 'Start Up', '2024-10-29 05:17:15', 'read'),
(273, '32', '23', 'test1', 'Investor', '2024-10-29 05:18:32', 'read'),
(274, '24', '32', 'test', 'Start Up', '2024-10-29 12:30:28', 'Unread');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expertise` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verify_token` varchar(255) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT 0,
  `reset_token` varchar(255) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `profile_image`, `expertise`, `skills`, `created_at`, `updated_at`, `verify_token`, `email_verified`, `reset_token`, `token_expiry`) VALUES
(24, 'caroline', 'caroline@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'Tech Startup Companies', '1730070044-262352753_1597480717310427_972818494506717400_n.jpg', NULL, NULL, '2024-10-18 16:31:09', '2024-10-31 17:17:53', '3123123123123', 1, NULL, NULL),
(25, 'elly', 'elly@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'mentor', '1730069226-262352753_1597480717310427_972818494506717400_n.jpg', NULL, NULL, '2024-10-18 16:34:40', '2024-10-31 17:18:12', '212121', 1, NULL, NULL),
(26, 'aki', 'aki@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'passive-investors', '1730069226-262352753_1597480717310427_972818494506717400_n.jpg', NULL, NULL, '2024-10-20 08:02:13', '2024-10-30 00:00:09', NULL, 0, NULL, NULL),
(28, 'lemon', 'lemon@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'mentor', '1730070044-262352753_1597480717310427_972818494506717400_n.jpg', NULL, NULL, '2024-10-25 10:57:58', '2024-10-30 00:00:07', NULL, 0, NULL, NULL),
(29, 'ron', 'ron@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'Entrepreneurs', NULL, NULL, NULL, '2024-10-27 16:30:52', '2024-10-29 23:25:27', NULL, 0, NULL, NULL),
(31, 'Tester', 'ricojames.softdevsss@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'Tech Startup Companies', '1730069226-262352753_1597480717310427_972818494506717400_n.jpg', NULL, NULL, '2024-10-27 22:47:09', '2024-10-31 17:39:18', '1730066538', 1, NULL, NULL),
(32, 'Tester Mentor', 'rjq.software.tester@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'mentor', '1730070044-262352753_1597480717310427_972818494506717400_n.jpg', NULL, NULL, '2024-10-27 23:00:46', '2024-10-30 00:00:05', '1730066538', 0, NULL, NULL),
(33, 'aki', 'aki2@gmail.com', '$2y$10$klf4UXZoXN/xWtyt.HTkmOwctvJBCGXjB2mvcXbtyb59h5Q91.EbG', 'passive-investors', '1730069226-262352753_1597480717310427_972818494506717400_n.jpg', NULL, NULL, '2024-10-20 08:02:13', '2024-10-29 23:25:32', NULL, 0, NULL, NULL),
(35, 'dyie', 'dyie@gmail.com', '$2y$10$YgZFVY6FHWjoEhyVJCZhBuMmQ3/Ji8fCEigCjhcpI2tkngcXpxlnO', 'Entrepreneurs', NULL, NULL, NULL, '2024-10-31 15:56:44', '2024-10-31 15:56:44', NULL, 0, NULL, NULL),
(36, 'tan', 'tanlegazpi@gmail.com', '$2y$10$zY.lY6ABk.SK571/56C5gu5P.0ds1NtuO.oSq4fEjSuVVNaFT1xaG', 'Entrepreneurs', NULL, NULL, NULL, '2024-10-31 17:09:19', '2024-10-31 17:09:53', NULL, 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `investor_document`
--
ALTER TABLE `investor_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investor_profiles`
--
ALTER TABLE `investor_profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `pitch`
--
ALTER TABLE `pitch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pitch_user` (`user_id`);

--
-- Indexes for table `progress_report`
--
ALTER TABLE `progress_report`
  ADD PRIMARY KEY (`ps_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_project` (`project_id`),
  ADD KEY `fk_investor` (`investor_id`),
  ADD KEY `fk_startup` (`startup_id`);

--
-- Indexes for table `startup_activity`
--
ALTER TABLE `startup_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `startup_document`
--
ALTER TABLE `startup_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `startup_profiles`
--
ALTER TABLE `startup_profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `investor_document`
--
ALTER TABLE `investor_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `investor_profiles`
--
ALTER TABLE `investor_profiles`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pitch`
--
ALTER TABLE `pitch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `progress_report`
--
ALTER TABLE `progress_report`
  MODIFY `ps_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `startup_activity`
--
ALTER TABLE `startup_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `startup_document`
--
ALTER TABLE `startup_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `startup_profiles`
--
ALTER TABLE `startup_profiles`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pitch`
--
ALTER TABLE `pitch`
  ADD CONSTRAINT `fk_pitch_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `fk_investor` FOREIGN KEY (`investor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_project` FOREIGN KEY (`project_id`) REFERENCES `pitch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_startup` FOREIGN KEY (`startup_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
