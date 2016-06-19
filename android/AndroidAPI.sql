-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: 10.25.140.23
-- Generation Time: Jun 07, 2016 at 02:26 PM
-- Server version: 5.1.73
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `paschimmedinipur`
--

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_APP_Logs`
--

CREATE TABLE IF NOT EXISTS `WebSite_APP_Logs` (
  `LogID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMEI` varchar(20) NOT NULL,
  `LocalIP` varchar(16) NOT NULL,
  `IP` varchar(16) NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `AccessTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_APP_NoDefsViewUsers`
--
CREATE TABLE IF NOT EXISTS `WebSite_APP_NoDefsViewUsers` (
`Designation` varchar(50)
,`LastAccessTime` timestamp
,`MobileNo` varchar(10)
,`UserID` varchar(50)
,`UserData` text
);
-- --------------------------------------------------------

--
-- Table structure for table `WebSite_APP_Register`
--

CREATE TABLE IF NOT EXISTS `WebSite_APP_Register` (
  `RequestID` int(11) NOT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  `RequestTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_APP_Users`
--

CREATE TABLE IF NOT EXISTS `WebSite_APP_Users` (
  `MobileNo` varchar(10) NOT NULL DEFAULT '',
  `UserName` varchar(50) DEFAULT NULL,
  `UserData` text,
  `TempData` text,
  `Designation` varchar(50) DEFAULT NULL,
  `eMailID` text,
  `UsageCount` int(11) DEFAULT '0',
  `Status` enum('Registered','Activated','Inactive') DEFAULT NULL,
  `LastAccessTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MobileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_CaptchaCodes`
--

CREATE TABLE IF NOT EXISTS `WebSite_CaptchaCodes` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `namespace` varchar(32) CHARACTER SET latin1 NOT NULL,
  `code` varchar(32) CHARACTER SET latin1 NOT NULL,
  `code_display` varchar(32) CHARACTER SET latin1 NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`,`namespace`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_Contacts`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_Contacts` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `ContactName` varchar(50) DEFAULT NULL,
  `Designation` varchar(255) NOT NULL,
  `MobileNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ContactID`),
  UNIQUE KEY `MobileNo` (`MobileNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_DlrReports`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_DlrReports` (
  `MessageID` varchar(25) NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `DlrStatus` varchar(50) NOT NULL,
  `CarrierStatus` varchar(50) NOT NULL,
  `SentOn` varchar(20) NOT NULL,
  `DeliveredOn` varchar(20) NOT NULL,
  `UnDelivered` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_SMS_Duplicates`
--
CREATE TABLE IF NOT EXISTS `WebSite_SMS_Duplicates` (
`Rows` bigint(21)
,`MobileNo` varchar(10)
);
-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_GroupDetails`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_GroupDetails` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ContactID`,`GroupID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_Groups`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_Groups` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GroupID`),
  UNIQUE KEY `GroupName` (`GroupName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_SMS_GroupWiseContacts`
--
CREATE TABLE IF NOT EXISTS `WebSite_SMS_GroupWiseContacts` (
`ContactID` int(11)
,`ContactName` varchar(50)
,`Designation` varchar(255)
,`MobileNo` varchar(10)
,`GroupName` varchar(20)
,`GroupID` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_GroupWiseMobileNos`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_GroupWiseMobileNos` (
  `ContactID` int(3) DEFAULT NULL,
  `ContactName` varchar(32) DEFAULT NULL,
  `Designation` varchar(72) DEFAULT NULL,
  `MobileNo` bigint(10) DEFAULT NULL,
  `GroupName` varchar(14) DEFAULT NULL,
  `GroupID` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_Messages`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_Messages` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(10) DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `MsgText` varchar(500) DEFAULT NULL,
  `SentTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_SMS_NoDefsViewRU`
--
CREATE TABLE IF NOT EXISTS `WebSite_SMS_NoDefsViewRU` (
`MobileNo` varchar(10)
,`RequestTime` timestamp
,`UserName` varchar(50)
,`UserData` text
,`LastAccessTime` timestamp
);
-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_Register`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_Register` (
  `RequestID` int(11) NOT NULL AUTO_INCREMENT,
  `MobileNo` varchar(10) DEFAULT NULL,
  `RequestTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RequestID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_Replace`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_Replace` (
  `ContactID` int(3) DEFAULT NULL,
  `Replace` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_Status`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_Status` (
  `StatusID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageID` int(11) DEFAULT NULL,
  `Report` text,
  `MobileNo` varchar(10) DEFAULT NULL,
  `Status` text,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WebSite_SMS_Users`
--

CREATE TABLE IF NOT EXISTS `WebSite_SMS_Users` (
  `MobileNo` varchar(10) NOT NULL DEFAULT '',
  `UserName` varchar(50) DEFAULT NULL,
  `UserData` text,
  `TempData` text,
  `Designation` varchar(50) DEFAULT NULL,
  `eMailID` text,
  `UsageCount` int(11) DEFAULT '0',
  `Status` enum('Registered','Activated','Inactive') DEFAULT NULL,
  `LastAccessTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MobileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_SMS_ViewContacts`
--
CREATE TABLE IF NOT EXISTS `WebSite_SMS_ViewContacts` (
`ContactID` int(11)
,`GroupID` int(11)
,`MobileNo` varchar(10)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_SMS_ViewDlrData`
--
CREATE TABLE IF NOT EXISTS `WebSite_SMS_ViewDlrData` (
`MsgID` bigint(20)
,`MsgData` longtext
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_SMS_ViewDlrStatus`
--
CREATE TABLE IF NOT EXISTS `WebSite_SMS_ViewDlrStatus` (
`MessageID` int(11)
,`To` varchar(10)
,`ContactName` varchar(50)
,`Designation` varchar(255)
,`SentOn` varchar(20)
,`DlrStatus` varchar(50)
,`DeliveredOn` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `WebSite_SMS_GroupMembers`
--
CREATE TABLE `WebSite_SMS_GroupMembers` (
`ContactID` int(11)
,`ContactName` varchar(50)
,`Designation` varchar(255)
,`GroupID` int(11)
,`MobileNo` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `WebSite_SMS_GroupMembers`
--
DROP TABLE IF EXISTS `WebSite_SMS_GroupMembers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `WebSite_SMS_GroupMembers`  AS  select `C`.`ContactID` AS `ContactID`,`C`.`ContactName` AS `ContactName`,`C`.`Designation` AS `Designation`,`G`.`GroupID` AS `GroupID`,`C`.`MobileNo` AS `MobileNo` from (`WebSite_SMS_GroupDetails` `G` join `WebSite_SMS_Contacts` `C` on((`C`.`ContactID` = `G`.`ContactID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `WebSite_APP_NoDefsViewUsers`
--
DROP TABLE IF EXISTS `WebSite_APP_NoDefsViewUsers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`paschimmedinipur`@`10.25.137.%` SQL SECURITY DEFINER VIEW `WebSite_APP_NoDefsViewUsers` AS select `U`.`UserName` AS `Designation`,`S`.`LastAccessTime` AS `LastAccessTime`,`U`.`MobileNo` AS `MobileNo`,`U`.`UserID` AS `UserID`,`S`.`UserData` AS `UserData` from (`WebSite_Users` `U` join `WebSite_APP_Users` `S` on((`U`.`MobileNo` = `S`.`MobileNo`)));

-- --------------------------------------------------------

--
-- Structure for view `WebSite_SMS_Duplicates`
--
DROP TABLE IF EXISTS `WebSite_SMS_Duplicates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`paschimmedinipur`@`10.25.137.%` SQL SECURITY DEFINER VIEW `WebSite_SMS_Duplicates` AS select count(0) AS `Rows`,`WebSite_SMS_Contacts`.`MobileNo` AS `MobileNo` from `WebSite_SMS_Contacts` group by `WebSite_SMS_Contacts`.`MobileNo` having (count(0) > 1) order by `WebSite_SMS_Contacts`.`MobileNo`;

-- --------------------------------------------------------

--
-- Structure for view `WebSite_SMS_GroupWiseContacts`
--
DROP TABLE IF EXISTS `WebSite_SMS_GroupWiseContacts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`paschimmedinipur`@`10.26.%.%` SQL SECURITY DEFINER VIEW `WebSite_SMS_GroupWiseContacts` AS select `C`.`ContactID` AS `ContactID`,`C`.`ContactName` AS `ContactName`,`C`.`Designation` AS `Designation`,`C`.`MobileNo` AS `MobileNo`,`G`.`GroupName` AS `GroupName`,`G`.`GroupID` AS `GroupID` from ((`WebSite_SMS_GroupDetails` `GD` join `WebSite_SMS_Contacts` `C` on((`C`.`ContactID` = `GD`.`ContactID`))) join `WebSite_SMS_Groups` `G` on((`G`.`GroupID` = `GD`.`GroupID`)));

-- --------------------------------------------------------

--
-- Structure for view `WebSite_SMS_NoDefsViewRU`
--
DROP TABLE IF EXISTS `WebSite_SMS_NoDefsViewRU`;

CREATE ALGORITHM=UNDEFINED DEFINER=`paschimmedinipur`@`10.25.137.%` SQL SECURITY DEFINER VIEW `WebSite_SMS_NoDefsViewRU` AS select `R`.`MobileNo` AS `MobileNo`,`R`.`RequestTime` AS `RequestTime`,`U`.`UserName` AS `UserName`,`U`.`UserData` AS `UserData`,`U`.`LastAccessTime` AS `LastAccessTime` from (`WebSite_SMS_Register` `R` join `WebSite_SMS_Users` `U` on((`R`.`MobileNo` = `U`.`MobileNo`)));

-- --------------------------------------------------------

--
-- Structure for view `WebSite_SMS_ViewContacts`
--
DROP TABLE IF EXISTS `WebSite_SMS_ViewContacts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`paschimmedinipur`@`10.25.137.%` SQL SECURITY DEFINER VIEW `WebSite_SMS_ViewContacts` AS select `C`.`ContactID` AS `ContactID`,`G`.`GroupID` AS `GroupID`,`C`.`MobileNo` AS `MobileNo` from (`WebSite_SMS_GroupDetails` `G` join `WebSite_SMS_Contacts` `C` on((`C`.`ContactID` = `G`.`ContactID`)));

-- --------------------------------------------------------

--
-- Structure for view `WebSite_SMS_ViewDlrData`
--
DROP TABLE IF EXISTS `WebSite_SMS_ViewDlrData`;

CREATE ALGORITHM=UNDEFINED DEFINER=`paschimmedinipur`@`10.25.137.%` SQL SECURITY DEFINER VIEW `WebSite_SMS_ViewDlrData` AS select `SMS_Data`.`MsgID` AS `MsgID`,`SMS_Data`.`MsgData` AS `MsgData` from `SMS_Data` where ((`SMS_Data`.`MsgType` = 'Delivery Report') and (`SMS_Data`.`ReadUnread` = 0)) order by `SMS_Data`.`MsgID` desc limit 500;

-- --------------------------------------------------------

--
-- Structure for view `WebSite_SMS_ViewDlrStatus`
--
DROP TABLE IF EXISTS `WebSite_SMS_ViewDlrStatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`paschimmedinipur`@`10.25.137.%` SQL SECURITY DEFINER VIEW `WebSite_SMS_ViewDlrStatus` AS select `S`.`MessageID` AS `MessageID`,`S`.`MobileNo` AS `To`,`C`.`ContactName` AS `ContactName`,`C`.`Designation` AS `Designation`,`R`.`SentOn` AS `SentOn`,`R`.`CarrierStatus` AS `DlrStatus`,`R`.`DeliveredOn` AS `DeliveredOn` from ((`WebSite_SMS_DlrReports` `R` join `WebSite_SMS_Status` `S` on((convert(`R`.`MessageID` using utf8) = `S`.`Status`))) join `WebSite_SMS_Contacts` `C` on((`C`.`MobileNo` = `S`.`MobileNo`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `WebSite_SMS_GroupDetails`
--
ALTER TABLE `WebSite_SMS_GroupDetails`
  ADD CONSTRAINT `WebSite_SMS_GroupDetails_ibfk_1` FOREIGN KEY (`ContactID`) REFERENCES `WebSite_SMS_Contacts` (`ContactID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `WebSite_SMS_GroupDetails_ibfk_2` FOREIGN KEY (`GroupID`) REFERENCES `WebSite_SMS_Groups` (`GroupID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
