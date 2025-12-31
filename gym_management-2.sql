-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2025 at 11:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `c_no` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `name`, `email`, `c_no`, `address`, `password`) VALUES
(1, 'nancy', 'nancy@mm.com', '12345', 'dhk', '123');

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `a_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE `complains` (
  `m_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complains`
--

INSERT INTO `complains` (`m_id`, `e_id`, `t_id`, `comment`) VALUES
(1, 1, 1, 'Member feels knee pain after running. Reduce intensity.'),
(2, 2, 2, 'Equipment grip issue reported. Please check.');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `e_id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `warrenty` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `p_date` date DEFAULT NULL,
  `rating` varchar(50) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`e_id`, `name`, `warrenty`, `quantity`, `p_date`, `rating`, `a_id`, `m_id`) VALUES
(2, 'Dumbbell Set', '1 year', 10, '2023-09-01', 'Excellent', 1, NULL),
(4, 'Treadmill', '2 years', 1, '2025-12-17', 'Excellent', 1, NULL),
(5, 'dumbell', '3 years', 2, '2025-12-17', '', 1, NULL),
(7, 'bjkjl', '6yeae', 1, '2025-12-17', 'good', 1, NULL),
(8, 'kh', '4 yeas', 5, '2025-12-23', 'good', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `m_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `c_no` varchar(30) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `bmi` varchar(20) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`m_id`, `name`, `address`, `email`, `c_no`, `gender`, `password`, `bmi`, `t_id`) VALUES
(1, 'jacob', 'mrp', 'jkb@mm.com', '01234', 'M', '123', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_req`
--

CREATE TABLE `member_req` (
  `m_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `req_status` varchar(30) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_req`
--

INSERT INTO `member_req` (`m_id`, `e_id`, `req_status`) VALUES
(1, 1, 'resolved'),
(1, 2, 'declined'),
(2, 2, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `p_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT 'pending',
  `m_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`p_id`, `date`, `status`, `m_id`) VALUES
(1, '2025-12-01', 'paid', 1),
(2, '2025-12-20', 'pending', 2);

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `t_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `c_no` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `availability` date DEFAULT NULL,
  `rating` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`t_id`, `name`, `address`, `email`, `c_no`, `password`, `availability`, `rating`) VALUES
(1, 'ron', 'dmd', 'ron@mm.com', '0123', '123', '2025-12-09', '4.9'),
(2, 'sas', 'mrp', 'sas@mm.com', '12311', '123', '2025-12-27', '4.90');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_specialization`
--

CREATE TABLE `trainer_specialization` (
  `t_id` int(11) NOT NULL,
  `specialization` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer_specialization`
--

INSERT INTO `trainer_specialization` (`t_id`, `specialization`) VALUES
(1, 'Cardio'),
(1, 'Weight Loss'),
(2, 'Strength Training');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `complains`
--
ALTER TABLE `complains`
  ADD PRIMARY KEY (`m_id`,`e_id`,`t_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`m_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `member_req`
--
ALTER TABLE `member_req`
  ADD PRIMARY KEY (`m_id`,`e_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`t_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `trainer_specialization`
--
ALTER TABLE `trainer_specialization`
  ADD PRIMARY KEY (`t_id`,`specialization`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
