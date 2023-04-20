-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2023 at 09:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankbcnf`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `AccountID` int(11) NOT NULL,
  `Balance` decimal(8,0) NOT NULL,
  `AccountDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`AccountID`, `Balance`, `AccountDate`) VALUES
(1, '5000', '2021-01-01'),
(2, '10000', '2021-02-05'),
(3, '750', '2021-03-10'),
(4, '3000', '2021-04-15'),
(5, '12500', '2021-05-20'),
(6, '800', '2021-06-25'),
(7, '15000', '2021-07-30'),
(8, '2500', '2021-08-31'),
(9, '500', '2021-09-10'),
(10, '18000', '2021-10-15'),
(11, '6500', '2021-11-20'),
(12, '300', '2021-12-25'),
(13, '14000', '2022-01-01'),
(14, '9000', '2022-02-05'),
(15, '1200', '2022-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `transactionID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`transactionID`, `AccountID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `applies`
--

CREATE TABLE `applies` (
  `userID` int(11) NOT NULL,
  `loanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applies`
--

INSERT INTO `applies` (`userID`, `loanID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `creates_bcnf`
--

CREATE TABLE `creates_bcnf` (
  `accountID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creates_bcnf`
--

INSERT INTO `creates_bcnf` (`accountID`, `userID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `loanpayment_accounts`
--

CREATE TABLE `loanpayment_accounts` (
  `accountID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `loanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loanpayment_accounts`
--

INSERT INTO `loanpayment_accounts` (`accountID`, `paymentID`, `loanID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `loanpayment_payments`
--

CREATE TABLE `loanpayment_payments` (
  `paymentID` int(11) NOT NULL,
  `loanID` int(11) NOT NULL,
  `paymentDate` date NOT NULL,
  `paymentAmount` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loanpayment_payments`
--

INSERT INTO `loanpayment_payments` (`paymentID`, `loanID`, `paymentDate`, `paymentAmount`) VALUES
(1, 1, '2022-01-15', '1000'),
(2, 2, '2022-02-28', '1500'),
(3, 3, '2022-03-17', '2000'),
(4, 4, '2022-04-22', '2500'),
(5, 5, '2022-05-11', '3000'),
(6, 6, '2022-06-08', '1000'),
(7, 7, '2022-07-05', '1500'),
(8, 8, '2022-08-19', '2000'),
(9, 9, '2022-09-26', '2500'),
(10, 10, '2022-10-13', '3000');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loanID` int(11) NOT NULL,
  `loanAmount` decimal(10,0) NOT NULL,
  `loanType` varchar(20) NOT NULL,
  `interestRate` decimal(4,0) NOT NULL,
  `loanTerm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loanID`, `loanAmount`, `loanType`, `interestRate`, `loanTerm`) VALUES
(1, '10000', 'Personal', '7', 12),
(2, '20000', 'Business', '5', 24),
(3, '15000', 'Education', '6', 36),
(4, '8000', 'Personal', '8', 6),
(5, '50000', 'Mortgage', '4', 360),
(6, '25000', 'Business', '6', 36),
(7, '12000', 'Education', '5', 24),
(8, '18000', 'Personal', '9', 12),
(9, '35000', 'Mortgage', '3', 240),
(10, '10000', 'Business', '6', 12),
(11, '5000', 'Personal', '10', 6),
(12, '40000', 'Mortgage', '4', 360),
(13, '30000', 'Education', '7', 48),
(14, '6000', 'Personal', '12', 6),
(15, '22000', 'Business', '7', 24);

-- --------------------------------------------------------

--
-- Table structure for table `madeto`
--

CREATE TABLE `madeto` (
  `accountID` int(11) NOT NULL,
  `transactionID` int(11) DEFAULT NULL,
  `paymentID` int(11) DEFAULT NULL,
  `loanID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `madeto`
--

INSERT INTO `madeto` (`accountID`, `transactionID`, `paymentID`, `loanID`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `userID` int(11) NOT NULL,
  `transactionID` int(11) DEFAULT NULL,
  `paymentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `makes`
--

INSERT INTO `makes` (`userID`, `transactionID`, `paymentID`) VALUES
(1, 4, NULL),
(2, NULL, 8),
(3, 1, NULL),
(4, NULL, 3),
(5, 7, NULL),
(6, NULL, 5),
(7, 2, NULL),
(8, NULL, 9),
(9, 6, NULL),
(10, NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `paymentAmount` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `paymentAmount`) VALUES
(1, '500'),
(2, '1200'),
(3, '750'),
(4, '900'),
(5, '1500'),
(6, '200'),
(7, '400'),
(8, '950'),
(9, '600'),
(10, '850'),
(11, '300'),
(12, '1100'),
(13, '100'),
(14, '1800'),
(15, '650');

-- --------------------------------------------------------

--
-- Table structure for table `payment_date`
--

CREATE TABLE `payment_date` (
  `paymentID` int(11) NOT NULL,
  `paymentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_date`
--

INSERT INTO `payment_date` (`paymentID`, `paymentDate`) VALUES
(1, '2005-01-01'),
(2, '2006-01-01'),
(3, '2007-01-01'),
(4, '2008-01-01'),
(5, '2009-01-01'),
(6, '2010-01-01'),
(7, '2011-01-01'),
(8, '2012-01-01'),
(9, '2013-01-01'),
(10, '2014-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionID` int(11) NOT NULL,
  `transactionType` varchar(20) NOT NULL,
  `transactionAmount` int(11) NOT NULL,
  `transactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionID`, `transactionType`, `transactionAmount`, `transactionDate`) VALUES
(1, 'Purchase', 100, '2022-01-01'),
(2, 'Withdrawal', 50, '2022-01-02'),
(3, 'Deposit', 200, '2022-01-03'),
(4, 'Purchase', 75, '2022-01-04'),
(5, 'Deposit', 150, '2022-01-05'),
(6, 'Withdrawal', 25, '2022-01-06'),
(7, 'Purchase', 80, '2022-01-07'),
(8, 'Deposit', 100, '2022-01-08'),
(9, 'Purchase', 120, '2022-01-09'),
(10, 'Withdrawal', 60, '2022-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_locations`
--

CREATE TABLE `transaction_locations` (
  `transactionID` int(11) NOT NULL,
  `Longitude` varchar(20) NOT NULL,
  `Latitude` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_locations`
--

INSERT INTO `transaction_locations` (`transactionID`, `Longitude`, `Latitude`) VALUES
(1, '51.5074° N', '0.1278° W'),
(2, '40.7128° N', '74.0060° W'),
(3, '34.0522° N', '118.2437° W'),
(4, '41.8781° N', '87.6298° W'),
(5, '37.7749° N', '122.4194° W'),
(6, '33.6846° N', '117.8265° W'),
(7, '42.3601° N', '71.0589° W'),
(8, '51.5074° N', '0.1278° W'),
(9, '40.7128° N', '74.0060° W'),
(10, '34.0522° N', '118.2437° W');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `PhoneNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `Address`, `PhoneNumber`) VALUES
(1, 'John Smith', '123 Main St', -679),
(2, 'Jane Doe', '456 Elm St', -5123),
(3, 'Bob Johnson', '789 Oak St', -8457),
(4, 'Sarah Lee', '111 Cherry St', -556),
(5, 'Tom Smith', '222 Maple St', -1667),
(6, 'Emily Davis', '333 Cedar St', -2778),
(7, 'David Chen', '444 Pine St', -3889),
(8, 'Sophia Kim', '555 Oak St', -5000),
(9, 'Jack Brown', '666 Elm St', -6111),
(10, 'Lila Patel', '777 Birch St', -7222),
(11, 'Luke Wilson', '888 Cedar St', -8333),
(12, 'Avery Jones', '999 Pine St', -9444),
(13, 'Olivia White', '1010 Oak St', -455),
(14, 'William Taylor', '1111 Elm St', -556),
(15, 'Emma Lee', '1212 Maple St', -657);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `AccountID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`AccountID`, `userID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_loans`
--

CREATE TABLE `user_loans` (
  `loanID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `loanDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_loans`
--

INSERT INTO `user_loans` (`loanID`, `userID`, `loanDate`) VALUES
(1, 1, '2022-01-15'),
(2, 2, '2022-02-28'),
(3, 3, '2022-03-17'),
(4, 4, '2022-04-22'),
(5, 5, '2022-05-11'),
(6, 6, '2022-06-08'),
(7, 7, '2022-07-05'),
(8, 8, '2022-08-19'),
(9, 9, '2022-09-26'),
(10, 10, '2022-10-13');

-- --------------------------------------------------------

--
-- Table structure for table `user_personal_info`
--

CREATE TABLE `user_personal_info` (
  `UserID` int(11) NOT NULL,
  `SSN` int(20) NOT NULL,
  `BirthDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_personal_info`
--

INSERT INTO `user_personal_info` (`UserID`, `SSN`, `BirthDate`) VALUES
(1, 1234567, '1990-01-01'),
(2, 2345671, '1991-01-01'),
(3, 3456712, '1992-01-01'),
(4, 4567123, '1993-01-01'),
(5, 5671234, '1993-01-01'),
(6, 6712345, '1994-01-01'),
(7, 7123456, '1995-01-01'),
(8, 5555555, '1996-01-01'),
(9, 4444444, '1997-01-01'),
(10, 7777777, '1998-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`AccountID`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`transactionID`,`AccountID`),
  ADD KEY `AccountID` (`AccountID`);

--
-- Indexes for table `applies`
--
ALTER TABLE `applies`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `loanID` (`loanID`);

--
-- Indexes for table `creates_bcnf`
--
ALTER TABLE `creates_bcnf`
  ADD PRIMARY KEY (`accountID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `loanpayment_accounts`
--
ALTER TABLE `loanpayment_accounts`
  ADD PRIMARY KEY (`accountID`,`paymentID`),
  ADD KEY `loanpayment_accounts_fk1` (`paymentID`),
  ADD KEY `loanpayment_accounts_fk2` (`loanID`);

--
-- Indexes for table `loanpayment_payments`
--
ALTER TABLE `loanpayment_payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `loanpayment_payments_fk1` (`loanID`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loanID`);

--
-- Indexes for table `madeto`
--
ALTER TABLE `madeto`
  ADD PRIMARY KEY (`accountID`),
  ADD KEY `transactionID` (`transactionID`),
  ADD KEY `paymentID` (`paymentID`),
  ADD KEY `loanID` (`loanID`);

--
-- Indexes for table `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `makes_ibfk_1` (`transactionID`),
  ADD KEY `makes_ibfk_3` (`paymentID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `payment_date`
--
ALTER TABLE `payment_date`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionID`);

--
-- Indexes for table `transaction_locations`
--
ALTER TABLE `transaction_locations`
  ADD PRIMARY KEY (`transactionID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`AccountID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user_loans`
--
ALTER TABLE `user_loans`
  ADD PRIMARY KEY (`loanID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user_personal_info`
--
ALTER TABLE `user_personal_info`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD CONSTRAINT `account_transactions_ibfk_1` FOREIGN KEY (`transactionID`) REFERENCES `transactions` (`transactionID`),
  ADD CONSTRAINT `account_transactions_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`);

--
-- Constraints for table `applies`
--
ALTER TABLE `applies`
  ADD CONSTRAINT `applies_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `applies_ibfk_2` FOREIGN KEY (`loanID`) REFERENCES `loans` (`loanID`);

--
-- Constraints for table `creates_bcnf`
--
ALTER TABLE `creates_bcnf`
  ADD CONSTRAINT `creates_bcnf_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `accounts` (`AccountID`),
  ADD CONSTRAINT `creates_bcnf_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `loanpayment_accounts`
--
ALTER TABLE `loanpayment_accounts`
  ADD CONSTRAINT `loanpayment_accounts_fk1` FOREIGN KEY (`paymentID`) REFERENCES `loanpayment_payments` (`paymentID`),
  ADD CONSTRAINT `loanpayment_accounts_fk2` FOREIGN KEY (`loanID`) REFERENCES `loans` (`loanID`);

--
-- Constraints for table `loanpayment_payments`
--
ALTER TABLE `loanpayment_payments`
  ADD CONSTRAINT `loanpayment_payments_fk1` FOREIGN KEY (`loanID`) REFERENCES `loans` (`loanID`);

--
-- Constraints for table `madeto`
--
ALTER TABLE `madeto`
  ADD CONSTRAINT `madeto_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `accounts` (`AccountID`),
  ADD CONSTRAINT `madeto_ibfk_2` FOREIGN KEY (`transactionID`) REFERENCES `transactions` (`transactionID`),
  ADD CONSTRAINT `madeto_ibfk_3` FOREIGN KEY (`paymentID`) REFERENCES `loanpayment_payments` (`paymentID`),
  ADD CONSTRAINT `madeto_ibfk_4` FOREIGN KEY (`loanID`) REFERENCES `loans` (`loanID`);

--
-- Constraints for table `makes`
--
ALTER TABLE `makes`
  ADD CONSTRAINT `makes_ibfk_1` FOREIGN KEY (`transactionID`) REFERENCES `transactions` (`transactionID`),
  ADD CONSTRAINT `makes_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `makes_ibfk_3` FOREIGN KEY (`paymentID`) REFERENCES `loanpayment_payments` (`paymentID`);

--
-- Constraints for table `payment_date`
--
ALTER TABLE `payment_date`
  ADD CONSTRAINT `payment_date_fk` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`paymentID`);

--
-- Constraints for table `transaction_locations`
--
ALTER TABLE `transaction_locations`
  ADD CONSTRAINT `transaction_locations_ibfk_1` FOREIGN KEY (`transactionID`) REFERENCES `transactions` (`transactionID`) ON DELETE CASCADE;

--
-- Constraints for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD CONSTRAINT `user_accounts_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`),
  ADD CONSTRAINT `user_accounts_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `user_loans`
--
ALTER TABLE `user_loans`
  ADD CONSTRAINT `user_loans_ibfk_1` FOREIGN KEY (`loanID`) REFERENCES `loans` (`loanID`),
  ADD CONSTRAINT `user_loans_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `user_personal_info`
--
ALTER TABLE `user_personal_info`
  ADD CONSTRAINT `user_personal_info_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
