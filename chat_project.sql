-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2019 at 03:12 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `f_details`
--

CREATE TABLE `f_details` (
  `username` varchar(50) NOT NULL,
  `ffname` varchar(50) NOT NULL,
  `flname` varchar(20) NOT NULL,
  `fdept` varchar(10) NOT NULL,
  `fgen` varchar(6) NOT NULL,
  `fmob` varchar(10) NOT NULL,
  `femail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_details`
--

INSERT INTO `f_details` (`username`, `ffname`, `flname`, `fdept`, `fgen`, `fmob`, `femail`) VALUES
('E1032180180', 'FACULTY1', 'Surname', 'COMP', 'Male', '1234567891', 'abcd@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(11) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('', ''),
('E1032180180', '1234'),
('S1032180260', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `msg`
--

CREATE TABLE `msg` (
  `send` varchar(11) NOT NULL,
  `reci` varchar(11) NOT NULL,
  `msgs` varchar(500) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `timing` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msg`
--

INSERT INTO `msg` (`send`, `reci`, `msgs`, `status`, `timing`) VALUES
('S1032180260', 'E1032180180', 'hello', 1, '2019-10-14 19:58:05'),
('S1032180260', 'E1032180180', 'new message', 1, '2019-10-14 19:58:12'),
('E1032180180', 'S1032180260', 'kya haal hai', 1, '2019-10-14 20:12:04'),
('E1032180180', 'S1032180260', 'reply 1', 1, '2019-10-14 20:12:11'),
('S1032180260', 'E1032180180', 'nhi sab thik hai', 1, '2019-10-14 20:12:59'),
('S1032180260', 'E1032180180', 'hfwfhbwjhvbwhjbejhbvhj', 0, '2019-10-14 21:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `s_details`
--

CREATE TABLE `s_details` (
  `username` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `sgen` varchar(6) NOT NULL,
  `sdept` varchar(50) NOT NULL,
  `syear` varchar(20) NOT NULL,
  `semail` varchar(100) NOT NULL,
  `smobile` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_details`
--

INSERT INTO `s_details` (`username`, `sname`, `sgen`, `sdept`, `syear`, `semail`, `smobile`) VALUES
('S1032180260', 'Anurag Singh', 'Male', 'COMP-B', 'S.E.', 'anuragsingh@email.com', '9665247226');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `f_details`
--
ALTER TABLE `f_details`
  ADD UNIQUE KEY `F_MOBILE` (`fmob`),
  ADD UNIQUE KEY `femail` (`femail`),
  ADD KEY `fusername` (`username`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `msg`
--
ALTER TABLE `msg`
  ADD UNIQUE KEY `timing` (`timing`),
  ADD KEY `sender` (`send`),
  ADD KEY `reciever` (`reci`);

--
-- Indexes for table `s_details`
--
ALTER TABLE `s_details`
  ADD UNIQUE KEY `S_MOBILE` (`smobile`),
  ADD UNIQUE KEY `semail` (`semail`),
  ADD KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `f_details`
--
ALTER TABLE `f_details`
  ADD CONSTRAINT `fusername` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `msg`
--
ALTER TABLE `msg`
  ADD CONSTRAINT `reciever` FOREIGN KEY (`reci`) REFERENCES `login` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `sender` FOREIGN KEY (`send`) REFERENCES `login` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `s_details`
--
ALTER TABLE `s_details`
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
