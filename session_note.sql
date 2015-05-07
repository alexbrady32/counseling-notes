-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2015 at 02:59 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `session_note`
--

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE IF NOT EXISTS `fields` (
`Field_ID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `FormSeq_Number` int(11) NOT NULL,
  `Carry_Over` bit(1) NOT NULL,
  `Extra_Text_Allowance` bit(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`Field_ID`, `Title`, `FormSeq_Number`, `Carry_Over`, `Extra_Text_Allowance`) VALUES
(3, 'Time', 4, b'1', b'0'),
(4, 'Gender', 2, b'1', b'0'),
(5, 'Name', 1, b'1', b'0'),
(6, 'DSM', 6, b'1', b'1'),
(7, 'Date', 3, b'1', b'0'),
(8, 'Medication', 8, b'1', b'1'),
(9, 'Session Number', 5, b'1', b'0'),
(11, 'GAF', 7, b'0', b'0'),
(13, 'Compliance', 9, b'0', b'0'),
(14, 'Side Effects', 10, b'0', b'1'),
(15, 'Pychosocial', 11, b'0', b'0'),
(16, 'Assessment', 12, b'0', b'0'),
(17, 'Mental Status', 13, b'0', b'0'),
(18, 'Family', 14, b'0', b'0'),
(19, 'Academics', 15, b'1', b'1'),
(20, 'Themes', 16, b'1', b'1'),
(21, 'Strategies', 17, b'1', b'1'),
(22, 'Goals', 18, b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `field_options`
--

CREATE TABLE IF NOT EXISTS `field_options` (
`FieldOption_ID` int(11) NOT NULL,
  `Field_ID` int(11) DEFAULT NULL,
  `Choose_Options` varchar(255) NOT NULL,
  `ParentOption_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field_options`
--

INSERT INTO `field_options` (`FieldOption_ID`, `Field_ID`, `Choose_Options`, `ParentOption_ID`) VALUES
(1, 4, 'Male', NULL),
(2, 4, 'Female', NULL),
(21, 6, 'ADHD', NULL),
(22, 6, 'Bipolar Disorder', NULL),
(23, 6, 'Borderline Personality Disorder', NULL),
(24, 6, 'Chronic Pain', NULL),
(25, 6, 'Depression', NULL),
(26, 6, 'Eating Disorders', NULL),
(27, 6, 'Anxiety', NULL),
(28, 6, 'Insomnia', NULL),
(29, 6, 'Obsessive-compulsive disorder', NULL),
(30, 6, 'Panic Disorder', NULL),
(31, 6, 'PTSD', NULL),
(32, 6, 'Scizophrenia', NULL),
(33, 6, 'Social Phobia', NULL),
(34, 6, 'Phobias', NULL),
(35, 6, 'Substance Abuse', NULL),
(36, 8, 'Ritalin', 1),
(37, 8, 'Methylin', 1),
(38, 8, 'Adderall', 1),
(39, 8, 'Dexedrine', 1),
(40, 8, 'Vyvanse', 1),
(41, 8, 'Focalin', 1),
(42, 8, 'Strattera', 1),
(43, 8, 'Aplenzin', 1),
(44, 8, 'Wellbutrin', 1),
(45, 8, 'Zyban', 1),
(46, 8, 'Zyprexa', 2),
(47, 8, 'Seroquel', 2),
(48, 8, 'Risperdal', 2),
(49, 8, 'Abilify', 2),
(50, 8, 'Geodon', 2),
(51, 8, 'Clozaril', 2),
(52, 8, 'Calan', 2),
(53, 8, 'Carbatrol', 2),
(54, 8, 'Klonopin', 2),
(55, 8, 'Saphris', 2),
(56, 8, 'Prozac', 3),
(57, 8, 'Paxil', 3),
(58, 8, 'Effexor XR', 3),
(59, 8, 'Risperdal', 3),
(60, 8, 'Lamictal', 3),
(61, 8, 'Topamax', 3),
(62, 8, 'Tylenol', 4),
(63, 8, 'Apirin', 4),
(64, 8, 'Ibuprofen', 4),
(65, 8, 'Aleve', 4),
(66, 8, 'Neurontin', 4),
(67, 8, 'Lyrica', 4),
(68, 8, 'Vicodin', 4),
(69, 8, 'Avinza', 4),
(70, 8, 'Butrans', 4),
(71, 8, 'Cymbalta', 4),
(72, 18, 'Crisis Management / Stabilization', NULL),
(73, 18, 'development of coping', NULL),
(74, 18, 'Long-term Pattern / Personality Change', NULL),
(75, 18, 'Symptom Reduction', NULL),
(76, 18, 'Self-examination', NULL),
(77, 18, 'Prevention of Relapse / Stabilization / Maintenance', NULL),
(78, 14, 'Report', NULL),
(79, 14, 'No Report', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE IF NOT EXISTS `goals` (
`Option_ID` int(11) NOT NULL,
  `Field_ID` int(11) NOT NULL,
  `Goal_Titles` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `narrative`
--

CREATE TABLE IF NOT EXISTS `narrative` (
`Narrative_ID` int(11) NOT NULL,
  `Narrative_Line1` varchar(255) DEFAULT NULL,
  `Narrative_Line2` varchar(255) DEFAULT NULL,
  `Field_ID` int(11) NOT NULL,
  `Seq_Number` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `narrative`
--

INSERT INTO `narrative` (`Narrative_ID`, `Narrative_Line1`, `Narrative_Line2`, `Field_ID`, `Seq_Number`) VALUES
(1, 'This person has been diagnosed with ', '.', 6, 6),
(2, 'This person is taking ', ' for their diagnosis.', 8, 5),
(4, '', '', 18, 1),
(33, '', '', 19, 4),
(36, '', '', 16, 0),
(37, '', '', 17, 3),
(38, '', '', 20, 7),
(39, '', '', 21, 2),
(40, 'We started at ', '.', 3, 8),
(54, '', '', 4, 9),
(55, '', '', 5, 10),
(56, '', '', 7, 11),
(57, '', '', 22, 15),
(58, '', '', 9, 14),
(59, '', '', 11, 12),
(60, '', '', 13, 16),
(61, '', '', 14, 13),
(62, '', '', 15, 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
 ADD PRIMARY KEY (`Field_ID`);

--
-- Indexes for table `field_options`
--
ALTER TABLE `field_options`
 ADD PRIMARY KEY (`FieldOption_ID`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
 ADD PRIMARY KEY (`Option_ID`);

--
-- Indexes for table `narrative`
--
ALTER TABLE `narrative`
 ADD PRIMARY KEY (`Narrative_ID`), ADD UNIQUE KEY `Field_ID` (`Field_ID`), ADD UNIQUE KEY `Field_ID_2` (`Field_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
MODIFY `Field_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `field_options`
--
ALTER TABLE `field_options`
MODIFY `FieldOption_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
MODIFY `Option_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `narrative`
--
ALTER TABLE `narrative`
MODIFY `Narrative_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
