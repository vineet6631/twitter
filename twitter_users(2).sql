-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 24, 2025 at 05:10 AM
-- Server version: 8.0.41-0ubuntu0.20.04.1
-- PHP Version: 7.4.3-4ubuntu2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `follow_relations`
--

CREATE TABLE `follow_relations` (
  `relation_id` int NOT NULL,
  `user_id` int NOT NULL,
  `following` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_true` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `follow_relations`
--

INSERT INTO `follow_relations` (`relation_id`, `user_id`, `following`, `time`, `is_true`) VALUES
(17, 18, 19, '2025-03-12 11:09:59', 1),
(18, 18, 21, '2025-03-12 11:10:09', 1),
(19, 26, 19, '2025-03-12 11:15:50', 1),
(20, 26, 18, '2025-03-12 11:16:04', 1),
(21, 26, 20, '2025-03-12 11:16:06', 1),
(22, 26, 21, '2025-03-12 11:16:06', 1),
(27, 19, 18, '2025-03-12 13:18:20', 1),
(28, 19, 21, '2025-03-12 13:19:31', 0),
(29, 25, 19, '2025-03-12 13:34:18', 0),
(30, 25, 18, '2025-03-12 13:34:22', 1),
(31, 25, 26, '2025-03-12 13:34:24', 1),
(32, 25, 27, '2025-03-12 13:34:25', 1),
(33, 19, 26, '2025-03-12 13:34:56', 0),
(34, 19, 25, '2025-03-12 13:34:57', 1),
(35, 28, 19, '2025-03-12 14:04:18', 1),
(38, 29, 19, '2025-03-12 14:17:14', 1),
(39, 19, 21, '2025-03-12 14:18:57', 0),
(40, 19, 26, '2025-03-12 14:20:13', 1),
(41, 19, 28, '2025-03-12 14:44:28', 0),
(42, 19, 28, '2025-03-13 04:05:08', 0),
(43, 25, 20, '2025-03-13 11:44:17', 1),
(44, 26, 27, '2025-03-17 08:13:35', 1),
(45, 25, 19, '2025-03-19 14:17:06', 0),
(46, 25, 19, '2025-03-19 14:17:09', 0),
(47, 25, 19, '2025-03-19 14:18:57', 1),
(48, 25, 31, '2025-03-19 14:20:31', 1),
(49, 33, 18, '2025-03-20 13:54:41', 1),
(50, 33, 19, '2025-03-20 13:54:42', 1),
(51, 33, 20, '2025-03-20 13:54:42', 1),
(52, 33, 21, '2025-03-20 13:54:43', 1),
(53, 33, 25, '2025-03-20 13:54:43', 1),
(54, 33, 26, '2025-03-20 13:54:44', 1),
(55, 33, 27, '2025-03-20 13:54:47', 1),
(56, 33, 28, '2025-03-20 13:54:47', 1),
(57, 33, 29, '2025-03-20 13:54:48', 1),
(58, 33, 30, '2025-03-20 13:54:48', 1),
(59, 33, 31, '2025-03-20 13:54:49', 1),
(60, 19, 21, '2025-03-20 14:00:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int NOT NULL,
  `tweet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `tweet_id`, `user_id`, `time`) VALUES
(35, 3, 19, '2025-03-17 07:56:10'),
(36, 1, 19, '2025-03-17 07:56:11'),
(37, 3, 26, '2025-03-17 07:59:41'),
(38, 1, 26, '2025-03-17 07:59:42'),
(39, 2, 26, '2025-03-17 07:59:43'),
(40, 4, 19, '2025-03-17 09:36:07'),
(42, 5, 19, '2025-03-17 14:18:39'),
(48, 4, 25, '2025-03-19 13:55:00'),
(49, 9, 19, '2025-03-20 05:58:17'),
(50, 13, 19, '2025-03-20 11:58:08'),
(51, 13, 33, '2025-03-20 13:54:58'),
(52, 12, 33, '2025-03-20 13:54:59'),
(53, 11, 33, '2025-03-20 13:55:00'),
(54, 10, 33, '2025-03-20 13:55:01'),
(55, 9, 33, '2025-03-20 13:55:02'),
(56, 8, 33, '2025-03-20 13:55:03'),
(57, 7, 33, '2025-03-20 13:55:04'),
(58, 5, 33, '2025-03-20 13:55:12'),
(59, 6, 33, '2025-03-20 13:55:13'),
(60, 4, 33, '2025-03-20 13:55:15'),
(61, 3, 33, '2025-03-20 13:55:22'),
(62, 2, 33, '2025-03-20 13:55:24'),
(63, 1, 33, '2025-03-20 13:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `retweet_likes`
--

CREATE TABLE `retweet_likes` (
  `like_id` int NOT NULL,
  `retweet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `retweet_likes`
--

INSERT INTO `retweet_likes` (`like_id`, `retweet_id`, `user_id`, `time`) VALUES
(10, 2, 26, '2025-03-17 07:59:55'),
(11, 5, 26, '2025-03-17 07:59:56'),
(12, 1, 26, '2025-03-17 08:00:01'),
(15, 5, 19, '2025-03-17 09:19:55'),
(17, 3, 19, '2025-03-17 09:37:49'),
(24, 14, 25, '2025-03-19 13:54:52'),
(25, 14, 33, '2025-03-20 13:55:06'),
(26, 13, 33, '2025-03-20 13:55:08'),
(27, 7, 33, '2025-03-20 13:55:10'),
(28, 5, 33, '2025-03-20 13:55:16'),
(29, 3, 33, '2025-03-20 13:55:18'),
(30, 2, 33, '2025-03-20 13:55:19'),
(31, 1, 33, '2025-03-20 13:55:21'),
(32, 15, 33, '2025-03-20 13:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `retweet_records`
--

CREATE TABLE `retweet_records` (
  `retweet_id` int NOT NULL,
  `tweet_id` int NOT NULL,
  `retweet_user_id` int NOT NULL,
  `retweet_string` varchar(150) NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `retweet_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `retweet_records`
--

INSERT INTO `retweet_records` (`retweet_id`, `tweet_id`, `retweet_user_id`, `retweet_string`, `likes`, `retweet_time`) VALUES
(1, 2, 25, 'hello this is retweet 25', 2, '2025-03-17 04:33:24'),
(2, 3, 19, 'hello this is retweet 19', 2, '2025-03-17 04:39:45'),
(3, 2, 19, 'hello this is retweet 19', 2, '2025-03-17 05:24:46'),
(5, 3, 26, 'hello this is retweet 26', 3, '2025-03-17 07:59:46'),
(7, 6, 30, 'hello this is retweet 30', 1, '2025-03-19 11:26:27'),
(13, 2, 25, 'hello this is retweet 25', 1, '2025-03-19 13:41:34'),
(14, 6, 25, 'hello this is retweet 25', 2, '2025-03-19 13:45:22'),
(15, 13, 33, 'hello this is retweet 33', 1, '2025-03-20 13:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `tweet_records`
--

CREATE TABLE `tweet_records` (
  `tweet_id` int NOT NULL,
  `tweet_string` varchar(150) NOT NULL,
  `user_id` int NOT NULL,
  `tweet_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tweet_records`
--

INSERT INTO `tweet_records` (`tweet_id`, `tweet_string`, `user_id`, `tweet_time`, `likes`) VALUES
(1, 'hello this is 19...!', 19, '2025-03-13 05:47:48', 3),
(2, 'hello this is 21', 21, '2025-03-13 06:06:07', 2),
(3, 'hello this is 25', 25, '2025-03-13 06:06:07', 3),
(4, 'i am man', 19, '2025-03-17 08:45:22', 3),
(5, 'its 16:15 PM', 19, '2025-03-17 10:45:50', 3),
(6, 'hello', 19, '2025-03-19 11:05:53', 2),
(7, 'i am bhavdip....!', 25, '2025-03-19 13:58:12', 1),
(8, 'hello this is 20 mar', 19, '2025-03-20 04:32:33', 1),
(9, 'hello this is current tiem', 19, '2025-03-20 04:58:10', 2),
(10, 'hiiiiiiiiiiiiiiiii', 19, '2025-03-20 05:59:51', 1),
(11, 'hiiiiiiiiii at 11:50', 19, '2025-03-20 06:20:09', 1),
(12, 'heeeeeeeeeeeeeeeeeeeeeeelllllooooooo', 19, '2025-03-20 07:06:36', 1),
(13, 'hello this is 2:22', 19, '2025-03-20 08:52:25', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(260) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`user_id`, `firstname`, `lastname`, `email`, `password`, `time`, `is_verified`) VALUES
(18, 'vineet', 'pathar', 'vineet@abc.copm', '$2b$10$baxVKLG3niKq2W8O7oOJSOcdqOuicFY0hffJUoj6LgWFTFdhpXO5a', '2025-03-11 08:48:28', 1),
(19, 'man', 'patel', 'man@gmail.com', '$2b$10$lKXdbWkDYu8IVHXNmW54WOW2i3wSY.N/5g6EUWpqfg2Z7C2fdVpOu', '2025-03-11 10:29:54', 1),
(20, 'man', 'patel', 'man.patel@gmail.com', '$2b$10$DO4StNMwmOmNtzCyLMKfFOKCvJ/uvATsSfn0Cp7oaVXST9yresCqW', '2025-03-11 10:39:03', 1),
(21, 'vineet', 'pathar', 'vineet.pathar@esparkbizmail.comcfvaa', '$2b$10$U/jT0KTnGzrfLb.1v/J3ZelofwBK/uUJjShV5Eut4Tdkvq0eycMCO', '2025-03-11 10:43:17', 1),
(22, 'bhavik', 'patel', 'bhavik@gmail.com', '', '2025-03-11 11:13:35', 0),
(25, 'bhavdip', 'Patel', 'bhavdippatel@gmail.com', '$2b$10$b01247XEHKK9lvVgUP5E/e9sqls.l.TQ34cmkYMVvr0ZK4qNqnRta', '2025-03-12 04:52:57', 1),
(26, 'jaydip', 'koriya', 'jaydip@gmail.com', '$2b$10$1HRcLndhjeaM7L0WfIEbXOVzqW2AbIGVjGUvwOiq8TDzhRgg0c6f2', '2025-03-12 11:14:55', 1),
(27, 'priyank', 'ahir', 'pruyank@gmail.com', '$2b$10$OYgP9v77i6JaPDIvKa/msO46wMqLuInig1xVo/4lzUPl65Kcu2JUu', '2025-03-12 11:31:01', 1),
(28, 'sumit', 'chauhan', 'sumit@gmail.com', '$2b$10$jiCYkfwVab4/Y48rFMJcLesZlJFCka4fcAqaai0mwlXnybnUm1WEW', '2025-03-12 14:03:46', 1),
(29, 'dodiya', 'dodiya', 'dodiya@gmail.com', '$2b$10$1RiBUS9sUVHScp9htX7iBeC7kyZaIYBwwavMttM2y.SEVHDIXYUXG', '2025-03-12 14:16:38', 1),
(30, 'akshay', 'nena', 'akshay123@gmail.com', '$2b$10$FNKu.cydNwIPPj2Wcb92KuA865RGN0S5XmobGA5pLTjEr1RchF6Zu', '2025-03-19 11:20:00', 1),
(31, 'krishi', 'mehta', 'krishi@gmail.com', '$2b$10$wCMJepuxOoGZsxPC5.B1E.ZUejTIueGMeFhyFxyiqO29aQwtSJh02', '2025-03-19 12:04:35', 1),
(32, 'maharshi', 'bhagatji', 'm@gmail.com', NULL, '2025-03-19 13:41:02', 0),
(33, 'xxx', 'yyy', 'xxx@yyy.com', '$2b$10$ujfI3kON8x/5YZ5WjB4s7OtbCIGn2jQxtp.kJjUDOM1TbmNqw9UmC', '2025-03-20 13:50:18', 1),
(34, 'dishan', 'pathar', 'dishan@gmail.com', '$2b$10$z3PCxZjM8GElj0ls1Jd1z.lzZAPlUcWVGIHCjhd.yZC5ZDsICUWzq', '2025-03-20 14:00:47', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `follow_relations`
--
ALTER TABLE `follow_relations`
  ADD PRIMARY KEY (`relation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `followed_by` (`following`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `tweet_id` (`tweet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `retweet_likes`
--
ALTER TABLE `retweet_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `retweet_id` (`retweet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `retweet_records`
--
ALTER TABLE `retweet_records`
  ADD PRIMARY KEY (`retweet_id`),
  ADD KEY `tweet_id` (`tweet_id`),
  ADD KEY `retweet_user_id` (`retweet_user_id`);

--
-- Indexes for table `tweet_records`
--
ALTER TABLE `tweet_records`
  ADD PRIMARY KEY (`tweet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `follow_relations`
--
ALTER TABLE `follow_relations`
  MODIFY `relation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `retweet_likes`
--
ALTER TABLE `retweet_likes`
  MODIFY `like_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `retweet_records`
--
ALTER TABLE `retweet_records`
  MODIFY `retweet_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tweet_records`
--
ALTER TABLE `tweet_records`
  MODIFY `tweet_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `follow_relations`
--
ALTER TABLE `follow_relations`
  ADD CONSTRAINT `follow_relations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `follow_relations_ibfk_2` FOREIGN KEY (`following`) REFERENCES `user_data` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweet_records` (`tweet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `retweet_likes`
--
ALTER TABLE `retweet_likes`
  ADD CONSTRAINT `retweet_likes_ibfk_1` FOREIGN KEY (`retweet_id`) REFERENCES `retweet_records` (`retweet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `retweet_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `retweet_records`
--
ALTER TABLE `retweet_records`
  ADD CONSTRAINT `retweet_records_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tweet_records` (`tweet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `retweet_records_ibfk_2` FOREIGN KEY (`retweet_user_id`) REFERENCES `user_data` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
