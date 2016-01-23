-- phpMyAdmin SQL Dump
-- version 4.3.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 18, 2016 at 02:28 PM
-- Server version: 5.5.35-33.0-log
-- PHP Version: 5.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `host1213989_android`
--

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE IF NOT EXISTS `points` (
  `id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double NOT NULL,
  `description` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `routeId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `latitude`, `longitude`, `altitude`, `description`, `date`, `routeId`) VALUES
(1, 52.54555, 13.357765, 0, 'Test route from beuth', '2016-01-16', 1),
(2, 52.547898, 13.361498, 0, 'Test Point Desc', '2016-01-16', 1),
(3, 52.551252, 13.366734, 0, 'Test Point desc 2', '2016-01-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `routeHasPoints`
--

CREATE TABLE IF NOT EXISTS `routeHasPoints` (
  `id` int(11) NOT NULL,
  `pointId` int(11) NOT NULL,
  `routeId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routeHasPoints`
--

INSERT INTO `routeHasPoints` (`id`, `pointId`, `routeId`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE IF NOT EXISTS `routes` (
  `id` int(11) NOT NULL,
  `routeName` varchar(100) NOT NULL,
  `description` int(11) NOT NULL,
  `startPointId` int(11) NOT NULL,
  `endPointId` int(11) NOT NULL,
  `routePointId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `routeName`, `description`, `startPointId`, `endPointId`, `routePointId`) VALUES
(1, 'Test Route 1', 0, 1, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routeHasPoints`
--
ALTER TABLE `routeHasPoints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `routeHasPoints`
--
ALTER TABLE `routeHasPoints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
