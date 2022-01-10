-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 10, 2022 at 07:51 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `booking_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `s_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`booking_id`, `u_id`, `item_quantity`, `cost`, `order_date`, `end_date`, `s_id`) VALUES
(2, 1, 1500, 15000, '2022-01-05 11:55:00', '2022-01-21 11:56:00', 10),
(3, 1, 100, 1500, '2021-12-30 11:56:00', '2022-01-06 11:56:00', 10),
(4, 1, 200, 2500, '2022-01-14 11:59:00', '2022-01-22 11:59:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Query`
--

CREATE TABLE `Query` (
  `q_id` int(2) NOT NULL,
  `u_id` int(2) NOT NULL,
  `username` varchar(100) NOT NULL,
  `query_msg` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Storage`
--

CREATE TABLE `Storage` (
  `s_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cost` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `img_path` varchar(1000) DEFAULT NULL,
  `consumed` int(11) NOT NULL DEFAULT 0,
  `remains` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Storage`
--

INSERT INTO `Storage` (`s_id`, `name`, `cost`, `quantity`, `description`, `img_path`, `consumed`, `remains`) VALUES
(10, 'Cold Storage', 120, 1234, 'Cold storage is a way of holding cryptocurrency tokens offline. By using cold storage, cryptocurrency investors aim to prevent hackers from being able to access their holdings via traditional means.', 'uploads/cold_storage.jpeg', 20, 1234),
(12, 'Dry Storage', 100, 1000, 'Dry storage is one of the ancient and traditional food storing techniques. Dry storage means the storage of shell stock out of water. The products stored under dry storage don’t require a climate-controlled environment. Items placed in dry storage generally have a long shelf life. Dry storage also refers to storing a boat or other water vessel on land.', 'uploads/cold-storage-wms1.jpeg', 0, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `u_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(1000) DEFAULT NULL,
  `zip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`u_id`, `name`, `username`, `password`, `city`, `state`, `zip`) VALUES
(1, 'shubhu123', 'shubhu123', 'shubhu123', 'Bangalore', 'karnataka', 0),
(2, 'Pranitha', 'Pranitha123', '4444', 'Hyderabad', 'Andhra Pradesh', 1111),
(6, 'shubhu', 'shubhunic123', '123123', 'Lucknow', 'Uttar Pradesh', 2222),
(7, 'Divya', 'Divya123', '12345', 'bangalore', 'Andhra Pradesh', 222222);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `s_id` (`s_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `Query`
--
ALTER TABLE `Query`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `Storage`
--
ALTER TABLE `Storage`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Query`
--
ALTER TABLE `Query`
  MODIFY `q_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Storage`
--
ALTER TABLE `Storage`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `Storage` (`s_id`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `Users` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
