-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2021 at 09:39 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `call_center`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0 - InActive, 1- Active',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `app_name`, `table_name`, `display_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'extension', 'sip_peers', 'Extension', 1, '2021-07-15 20:05:07', '2021-07-15 20:05:07'),
(2, 'ivr', 'ivr_application', 'IVR', 1, '2021-07-15 20:06:17', '2021-07-15 20:06:17'),
(3, 'voicemail', NULL, 'Voicemail', 1, '2021-07-15 20:07:32', '2021-07-15 20:12:41'),
(4, 'callgroup', 'callgroup_application', 'Call Group', 1, '2021-07-15 20:08:23', '2021-07-15 22:49:29'),
(5, 'conference', 'conference_application', 'Conference', 1, '2021-07-15 20:08:55', '2021-07-15 20:08:55'),
(6, 'timecondition', 'time_condition_application', 'Time Conditions', 1, '2021-07-15 20:09:56', '2021-07-15 22:50:03'),
(7, 'queue', 'queue_application', 'Queue', 1, '2021-07-15 20:10:59', '2021-07-15 20:12:45'),
(8, 'hangup', NULL, 'Hangup', 1, '2021-07-15 20:11:58', '2021-07-15 20:11:58'),
(9, 'forward', 'forward_application', 'Call Forward', 1, '2021-07-15 20:12:35', '2021-07-15 22:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `callgroup_application`
--

CREATE TABLE IF NOT EXISTS `callgroup_application` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `members` varchar(255) DEFAULT NULL,
  `timeout` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `callgroup_application`
--

INSERT INTO `callgroup_application` (`id`, `name`, `members`, `timeout`, `user_id`, `status`, `created_at`) VALUES
(1, 'test group', '9895909009,7907442293', 15, NULL, 1, '2021-01-27 11:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `conference_application`
--

CREATE TABLE IF NOT EXISTS `conference_application` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `confroom` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conference_application`
--

INSERT INTO `conference_application` (`id`, `name`, `confroom`, `pin`, `user_id`, `created_date`, `updated_date`) VALUES
(1, 'test conference', '123456', '1234', 1, '2021-07-12 08:47:39', '2021-07-12 08:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `did_numbers`
--

CREATE TABLE IF NOT EXISTS `did_numbers` (
  `id` int(11) NOT NULL,
  `pri` varchar(255) DEFAULT NULL COMMENT 'did number',
  `did` varchar(255) DEFAULT NULL COMMENT 'mapped number',
  `job` int(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `app_name` varchar(150) DEFAULT NULL COMMENT 'mapped to ivr_application table',
  `app_value` int(11) DEFAULT NULL,
  `operator` int(11) DEFAULT NULL COMMENT 'jio-1,vodafone-2,tata-3',
  `type` int(11) DEFAULT NULL COMMENT 'gsm-1,landline-2',
  `enable_outbound` int(5) DEFAULT NULL,
  `forward_to` varchar(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `dept_id` int(255) DEFAULT NULL,
  `caller_id` varchar(255) DEFAULT NULL,
  `welcome_audio` varchar(255) DEFAULT NULL,
  `schedule_time_in` time DEFAULT NULL,
  `schedule_time_out` time DEFAULT NULL,
  `is_agent` int(11) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `channel` int(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `call_record` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-no , 1- yes',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `did_numbers`
--

INSERT INTO `did_numbers` (`id`, `pri`, `did`, `job`, `route`, `app_name`, `app_value`, `operator`, `type`, `enable_outbound`, `forward_to`, `user_id`, `account_id`, `dept_id`, `caller_id`, `welcome_audio`, `schedule_time_in`, `schedule_time_out`, `is_agent`, `agent_name`, `channel`, `status`, `description`, `created_date`, `updated_date`, `call_record`, `created_at`, `updated_at`) VALUES
(98, '9895909009', '9895909009', NULL, '1', 'EXTENSION', 132, 1, 2, NULL, NULL, 1, 1, NULL, '919446321608', NULL, NULL, NULL, 0, NULL, 15, 1, NULL, '2020-09-08 09:05:15', NULL, 0, '2021-07-15 23:18:13', '2021-07-17 07:36:07'),
(112, '8220509953', NULL, 7, '3', 'TIMECONDITION', 4, 1, NULL, 1, '0', 1, NULL, 1, '4846193000', NULL, NULL, NULL, 1, 'Vinayak', 10, 1, '', '2020-09-10 17:02:14', '2020-09-10 17:02:14', 0, '2021-07-15 23:18:13', '2021-07-17 07:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `forward_application`
--

CREATE TABLE IF NOT EXISTS `forward_application` (
  `id` int(11) NOT NULL,
  `number` varchar(150) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forward_application`
--

INSERT INTO `forward_application` (`id`, `number`, `status`, `created_at`) VALUES
(1, '7907016359 	', 1, '2021-06-17 11:59:55'),
(2, '7907016359', 1, '2021-07-07 06:09:14');

-- --------------------------------------------------------

--
-- Table structure for table `ivr_application`
--

CREATE TABLE IF NOT EXISTS `ivr_application` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `welcome_audio` varchar(500) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '1.Direct,2.DTMF',
  `app_name` varchar(150) DEFAULT NULL,
  `app_value` int(11) DEFAULT NULL,
  `invalid_tries` int(11) DEFAULT NULL,
  `invalid_audio` varchar(100) DEFAULT NULL,
  `invalid_app` varchar(150) DEFAULT NULL,
  `invalid_app_id` int(11) DEFAULT NULL,
  `timeout_sec` int(11) DEFAULT NULL,
  `timeout_audio` varchar(100) DEFAULT NULL,
  `timeout_app` varchar(150) DEFAULT NULL,
  `timeout_app_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ivr_application`
--

INSERT INTO `ivr_application` (`id`, `name`, `description`, `welcome_audio`, `type`, `app_name`, `app_value`, `invalid_tries`, `invalid_audio`, `invalid_app`, `invalid_app_id`, `timeout_sec`, `timeout_audio`, `timeout_app`, `timeout_app_id`, `created_at`) VALUES
(16, 'AGG BUS MM', '', '127', 1, 'QUEUE', 69, 0, '0', '0', 0, 0, '0', '0', 0, '2020-09-08 20:02:05'),
(20, 'RY Food MM', 'dtmf 2', '', 1, 'QUEUE', 69, 0, '0', '0', 0, 0, '0', '0', 0, '2020-10-06 11:16:57'),
(22, 'Train Ticket MM', '', '', 0, '0', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-10-06 11:41:27'),
(25, 'test', 'testing', '94', 2, '0', 0, 3, '0', 'HANGUP', 0, 2, '0', 'HANGUP', 0, '2020-10-06 13:00:38'),
(27, '8010500300_Main', '', '109,110', 2, '0', 0, 2, '121', '0', 0, 7, '0', 'IVR', 36, '2020-10-10 12:33:37'),
(28, '8010500300_1_train', '', '119', 2, '0', 0, 2, '121', '0', 0, 7, '0', 'IVR', 37, '2020-10-10 12:41:31'),
(33, 'train_1_1', '', '117', 2, '0', 0, 2, '121', '0', 0, 5, '113', '0', 0, '2020-10-10 15:01:51'),
(34, 'train_pnr', '', '118', 2, '0', 0, 2, '121', '0', 0, 5, '0', 'IVR', 38, '2020-10-10 15:33:53'),
(35, 'call_agent', '', '120', 1, 'QUEUE', 81, 0, '0', '0', 0, 0, '0', '0', 0, '2020-10-10 16:12:11'),
(36, '8010500300 No Input', '', '113,110', 2, '0', 0, 2, '0', 'AUDIO', 121, 10, '128', '0', 0, '2020-10-10 20:30:55'),
(37, '8010500300 Train No Input', '', '113,119', 2, '0', 0, 2, '0', 'AUDIO', 121, 10, '128', '0', 0, '2020-10-12 16:42:32'),
(38, '8010500300 Train PNR No Input', '', '113,118', 2, '0', 0, 2, '0', 'AUDIO', 121, 10, '128', '0', 0, '2020-10-12 16:53:05'),
(39, 'Intrcity No Input', '', '141,136,137,138', 2, '0', 0, 2, '139', '0', 0, 10, '140', '0', 0, '2020-11-07 16:00:20'),
(40, 'Intrcity Smart Bus (API ivr flow)', '', '135,136,137,138', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 76, '2020-11-07 16:04:20'),
(41, 'Intercity Support inner ivr', '', '142', 2, '0', 0, 2, '139', '0', 0, 7, '0', 'IVR', 44, '2020-11-07 16:29:09'),
(42, 'Intrcity Smart Bus - Enquiry', '', '', 1, 'IVR', 45, 0, '0', '0', 0, 0, '0', '0', 0, '2020-11-07 16:33:25'),
(43, 'Intrcity Smart Bus - New Booki (Sales)', '', '', 1, 'QUEUE', 90, 0, '0', '0', 0, 0, '0', '0', 0, '2020-11-07 16:44:25'),
(44, 'Connecting SBUS Q', '', '157', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2020-11-07 17:09:22'),
(45, 'SBUS DTMF Api', '', '144,145,150,147', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 45, '2020-11-09 14:29:11'),
(46, 'Intrcity SBUS IVR MAIN', '', '135,136,137,138', 2, '0', 0, 2, '0', '-----Select---', 0, 10, '0', 'IVR', 47, '2020-11-09 19:52:38'),
(47, 'Intrcity SBUS IVR Timout Case', '', '135,136,137,138', 2, '0', 0, 2, '130', '0', 0, 10, '0', 'AUDIO', 151, '2020-11-13 12:14:09'),
(49, 'HANG UP', '', '', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-11-27 18:58:35'),
(50, 'TT Covid 19 - block', '28-10-2020', '177', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-02 10:27:18'),
(51, 'AGG BUS TIMOUT CASE', '', '179', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-02 10:44:23'),
(52, 'South Routes ENG', 'For travel between Bangalore and Vijayawada Press 1, For travel between Bangalore and Hyderabad Press', '178,160,165,170,173,176', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 10:45:03'),
(53, 'AGG BUS Other routs', '', '180', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-02 10:49:19'),
(54, 'West Routes Hin', '', '181,162,167,172,175', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 10:54:31'),
(55, 'West Routes ENG', 'For travel between Ahmedabad and Mumbai Press 1,For travel between Ahmedabad and Jaipur Press 2 ,Fo', '178,161,166,171,174', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'IVR', 54, '2020-12-02 10:57:37'),
(56, 'North routs hindi', '', '181,159,163,169', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 11:00:33'),
(57, 'North routs eng', 'Delhi and Uttar Pradesh Press 1,Delhi and Punjab Press 2 ,For all other routes - Press 3', '178,158,163,168', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'IVR', 56, '2020-12-02 11:03:35'),
(58, 'Thank You- Hangup', '', '182', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-02 11:34:25'),
(59, 'SBUS Hyderabad and Tirupati', '', '178,183', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 11:37:31'),
(60, 'SBUS Bangalore - Hyderabad	', '', '178,184', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'IVR', 51, '2020-12-02 11:40:17'),
(61, 'SBUS Mumbai - Ahmedabad H', '', '181,185', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'IVR', 62, '2020-12-02 11:42:12'),
(62, 'SBUS Mumbai - Ahmedabad E', '', '178,186', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 11:47:52'),
(63, 'AGG BUS MainIVR', 'call ending with msg', '187', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-02 11:58:49'),
(65, 'GADSBUS_INC_AHMD-JAI-E', 'Ahmedabad - Jaipur - english timout', '178,188,189,190,191', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 12:34:52'),
(66, 'GADSBUS_INC_AHMD-JAI-H	', 'GADS-Ahmedabad-Jaipur - hindi', '181,192,193,194,195', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'IVR', 51, '2020-12-02 12:38:05'),
(67, 'GADSBUS_INC_DEL_PUN-E', '	delhi punjab english timout', '178,188,189,190,191', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 12:41:12'),
(68, 'GADSBUS_INC_DEL_PUN-H', 'delhi-punjab-hindi', '181,192,193,194,195', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'IVR', 51, '2020-12-02 12:45:47'),
(69, 'GADS BUS INBOUND-E', 'GADS BUS INBOUND-E	English', '178,188,189,190,191', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 51, '2020-12-02 12:48:03'),
(70, 'GADS BUS INBOUND-H', 'hindi', '181,192,193,194,195', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'IVR', 51, '2020-12-02 13:04:22'),
(71, 'MM no input from customer', '', '141,197', 2, '0', 0, 2, '139', '0', 0, 10, '140', '0', 0, '2020-12-03 11:38:17'),
(72, 'Ry Food', '', '198', 1, 'FORWARD', 14, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-03 11:47:42'),
(73, 'Board Number RY', 'Welcome Script1Bus2Food 3TTicket', '196,197', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 71, '2020-12-03 12:02:50'),
(74, 'Connecting BUS', '', '199,102', 1, 'QUEUE', 69, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-03 15:50:59'),
(75, 'Connecting Bus Main', '', '178,188,189,190,191', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'IVR', 74, '2020-12-03 17:14:19'),
(76, 'Intrcity Smart Bus (API ivr flow)	- Timeout', '', '135,136,137,138', 2, '0', 0, 2, '139', '0', 0, 10, '0', 'QUEUE', 91, '2020-12-07 18:36:01'),
(77, 'Intrcity Smart Bus M (API updated)', '(API IVR flow) 17-12-2020', '216', 2, '0', 0, 0, '0', 'IVR', 78, 6, '0', 'IVR', 80, '2020-12-17 10:43:03'),
(78, '	Intrcity Smart Bus - WrongInput 1(API updated)', '', '221', 2, '0', 0, 1, '0', 'IVR', 79, 6, '0', 'IVR', 80, '2020-12-17 10:44:17'),
(79, 'Intrcity Smart Bus - WrongInput 2(API updated)', '', '222', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 10:44:47'),
(80, 'Intrcity Smart Bus - No Input 1(API updated)', '', '219', 2, '0', 0, 1, '0', 'IVR', 79, 6, '0', 'IVR', 81, '2020-12-17 10:45:35'),
(81, 'Intrcity Smart Bus - No Input 2(API updated)', '', '225', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 10:46:07'),
(82, 'Intrcity Smart Bus - Inner IVR 1 phone/pnr success (API updated)', '', '229', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 11:13:53'),
(83, 'Intrcity Smart bus - Wrong PNR entered', '', '230', 1, 'IVR', 83, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 11:16:13'),
(84, 'Intrcity Smart bus - Wrong PNR entered 2 (API updated)', '', '231', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 11:18:20'),
(86, 'Intrcity Smart bus - cancellations/refund press 4', '', '233', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 11:34:45'),
(87, 'Intrcity Smart bus - authorized partner, press 3.', '', '235', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 11:36:13'),
(88, 'intrcity Smart Bus- Inner IVR Press 1 (enquiry)', '', '265', 2, '0', 0, 0, '0', 'IVR', 90, 2, '0', 'IVR', 92, '2020-12-17 12:00:36'),
(89, 'SBUS- new booking press 2 API updated', '', '234', 1, 'QUEUE', 90, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 12:04:02'),
(90, 'SBUS Enquery Wrong Input 1', '', '266', 2, '0', 0, 1, '0', 'IVR', 91, 6, '0', 'IVR', 92, '2020-12-17 12:26:37'),
(91, 'SBUS Enquery Wrong Input 2', '', '227', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 12:29:48'),
(92, 'SBUS Enquery Timout 1', '', '267', 2, '0', 0, 1, '0', 'IVR', 90, 6, '0', 'IVR', 93, '2020-12-17 12:32:01'),
(93, 'SBUS Enquery Timout 2', '', '225', 1, 'HANGUP', 0, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 12:32:44'),
(94, 'Connecting SBUS Q (API updated)', '', '231', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2020-12-17 13:58:29'),
(95, 'Train_Ticket_IRCTC_Login', 'press 1 for resetting IRCTC password\npress 2 for creating a new irctc user-id\npress 3 for reopen IRCTC login page', '240,241,242,243', 2, '0', 0, 2, '139', '0', 0, 6, '0', 'HANGUP', 0, '2020-12-21 17:23:58'),
(96, 'Bus Captain not answered', '', '253', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2021-01-19 16:08:51'),
(97, 'Command Center specialist wrong pnr', '', '254', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2021-01-25 12:48:44'),
(98, 'Bus Captain - boarding time not mached', '', '253', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2021-01-28 17:21:07'),
(99, 'Bus Captain - API failed response', 'captain number not received', '253', 1, 'QUEUE', 91, 0, '0', '0', 0, 0, '0', '0', 0, '2021-01-28 17:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_05_31_183725_entrust_setup_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'acl.role.view', 'acl role view', 'acl.role.view', '2021-03-19 15:35:32', '2021-03-19 16:17:24'),
(2, 'assign.role.permission', 'assign.role.permission', 'assign.role.permission', '2021-03-19 16:17:49', '2021-03-19 16:17:49'),
(3, 'acl.perms.view', 'acl.perms.view', 'acl.perms.view', '2021-03-19 16:53:27', '2021-03-19 16:53:27'),
(4, 'web.did.listing', 'DID Listing', 'web.did.listing', '2021-07-14 10:10:10', '2021-07-14 10:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `queue_application`
--

CREATE TABLE IF NOT EXISTS `queue_application` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'queue extension',
  `musiconhold` varchar(255) DEFAULT NULL,
  `announce` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `monitor_join` int(11) DEFAULT NULL,
  `monitor_format` varchar(255) DEFAULT NULL,
  `queue_youarenext` varchar(255) DEFAULT NULL,
  `queue_thereare` varchar(255) DEFAULT NULL,
  `queue_callswaiting` varchar(255) DEFAULT NULL,
  `queue_holdtime` varchar(255) DEFAULT NULL,
  `queue_minutes` varchar(255) DEFAULT NULL,
  `queue_seconds` varchar(255) DEFAULT NULL,
  `queue_lessthan` varchar(255) DEFAULT NULL,
  `queue_thankyou` varchar(255) DEFAULT NULL,
  `queue_reporthold` varchar(255) DEFAULT NULL,
  `announce_frequency` int(11) DEFAULT NULL,
  `announce_round_seconds` int(11) DEFAULT NULL,
  `announce_holdtime` varchar(255) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` varchar(255) DEFAULT NULL,
  `joinempty` varchar(255) DEFAULT NULL,
  `leavewhenempty` varchar(255) DEFAULT NULL,
  `eventmemberstatus` int(11) DEFAULT NULL,
  `eventwhencalled` int(11) DEFAULT NULL,
  `reportholdtime` int(11) DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` int(11) DEFAULT NULL,
  `periodic_announce` varchar(255) DEFAULT NULL,
  `periodic_announce_frequency` int(11) DEFAULT NULL,
  `ringinuse` varchar(11) DEFAULT 'no',
  `setinterfacevar` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `queue_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queue_application`
--

INSERT INTO `queue_application` (`id`, `user_id`, `name`, `musiconhold`, `announce`, `context`, `timeout`, `monitor_join`, `monitor_format`, `queue_youarenext`, `queue_thereare`, `queue_callswaiting`, `queue_holdtime`, `queue_minutes`, `queue_seconds`, `queue_lessthan`, `queue_thankyou`, `queue_reporthold`, `announce_frequency`, `announce_round_seconds`, `announce_holdtime`, `retry`, `wrapuptime`, `maxlen`, `servicelevel`, `strategy`, `joinempty`, `leavewhenempty`, `eventmemberstatus`, `eventwhencalled`, `reportholdtime`, `memberdelay`, `weight`, `timeoutrestart`, `periodic_announce`, `periodic_announce_frequency`, `ringinuse`, `setinterfacevar`, `created_date`, `updated_date`, `queue_name`) VALUES
(69, 16, '10069', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2020-09-08 14:52:30', '2020-09-08 14:52:30', 'Aggregated BUS'),
(73, 21, '10073', 'connect', NULL, 'ivr-queue', NULL, NULL, NULL, '/var/lib/asterisk/connect_queue/youarenext', '/var/lib/asterisk/connect_queue/thereare', '/var/lib/asterisk/connect_queue/callswaiting', '/var/lib/asterisk/connect_queue/holdtime', '/var/lib/asterisk/connect_queue/minutes', '/var/lib/asterisk/connect_queue/seconds', '/var/lib/asterisk/connect_queue/less-than', '/var/lib/asterisk/connect_queue/thankyou', '/var/lib/asterisk/connect_queue/reporthold', 30, NULL, 'yes', NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/var/lib/asterisk/connect_queue/periodic-announce', 45, 'no', NULL, '2020-09-11 15:42:10', '2020-09-11 15:42:10', 'test'),
(81, 21, '10081', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2020-10-14 14:27:06', '2020-10-14 14:27:06', 'Train Ticket (no using)'),
(85, 21, '10085', 'connect', NULL, 'ivr-queue', NULL, NULL, NULL, '/var/lib/asterisk/connect_queue/youarenext', '/var/lib/asterisk/connect_queue/thereare', '/var/lib/asterisk/connect_queue/callswaiting', '/var/lib/asterisk/connect_queue/holdtime', '/var/lib/asterisk/connect_queue/minutes', '/var/lib/asterisk/connect_queue/seconds', '/var/lib/asterisk/connect_queue/less-than', '/var/lib/asterisk/connect_queue/thankyou', '/var/lib/asterisk/connect_queue/reporthold', 30, NULL, 'yes', NULL, NULL, NULL, NULL, 'random', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/var/lib/asterisk/connect_queue/periodic-announce', 45, 'no', NULL, '2020-10-14 16:38:11', '2020-10-14 16:38:11', 'Test Announce Queue'),
(86, 21, '10086', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2020-10-14 16:39:44', '2020-10-14 16:39:44', 'Train Ticket outbound'),
(89, 11, '10089', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2020-11-09 18:41:42', '2020-11-09 18:41:42', 'SBUS GROUP 1'),
(90, 11, '10090', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2020-11-09 18:42:03', '2020-11-09 18:42:03', 'SBUS GROUP 2'),
(91, 11, '10091', 'connect', NULL, 'ivr-queue', NULL, NULL, NULL, '/var/lib/asterisk/connect_queue/youarenext', '/var/lib/asterisk/connect_queue/thereare', '/var/lib/asterisk/connect_queue/callswaiting', '/var/lib/asterisk/connect_queue/holdtime', '/var/lib/asterisk/connect_queue/minutes', '/var/lib/asterisk/connect_queue/seconds', '/var/lib/asterisk/connect_queue/less-than', '/var/lib/asterisk/connect_queue/thankyou', '/var/lib/asterisk/connect_queue/reporthold', 30, NULL, 'yes', NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/var/lib/asterisk/connect_queue/periodic-announce', 45, 'no', NULL, '2020-11-09 19:54:19', '2020-11-09 19:54:19', 'SBUS Support (Intrcity board Number)'),
(92, 11, '10092', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'random', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2020-11-18 11:37:47', '2020-11-18 11:37:47', 'Progressive Dialer (Funnel)'),
(93, 11, '10093', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rrmemory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2020-11-26 11:23:33', '2020-11-26 11:23:33', 'SBUS GROUP 3 (Experimental)'),
(94, 20, '10094', NULL, NULL, 'ivr-queue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ringall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, '2021-01-12 15:15:16', '2021-01-12 15:15:16', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin', NULL, NULL),
(2, 'user', 'User', 'Done', '2021-06-05 06:32:37', '2021-06-05 06:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sip_peers`
--

CREATE TABLE IF NOT EXISTS `sip_peers` (
  `id` int(11) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `dept_id` int(255) DEFAULT NULL COMMENT '1-sales ,2 support',
  `name` varchar(10) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `ipaddr` varchar(15) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `regseconds` int(11) DEFAULT NULL,
  `defaultuser` varchar(10) DEFAULT NULL,
  `fullcontact` varchar(255) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `lastms` int(11) DEFAULT NULL,
  `host` varchar(40) DEFAULT NULL,
  `type` enum('friend','user','peer') DEFAULT NULL,
  `context` varchar(40) DEFAULT NULL,
  `permit` varchar(40) DEFAULT NULL,
  `deny` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `md5secret` varchar(40) DEFAULT NULL,
  `remotesecret` varchar(40) DEFAULT NULL,
  `transport` enum('udp','tcp','udp,tcp','tcp,udp','ws,wss,udp') DEFAULT NULL,
  `dtmfmode` enum('rfc2833','info','shortinfo','inband','auto') DEFAULT NULL,
  `directmedia` enum('yes','no','nonat','update') DEFAULT NULL,
  `nat` enum('yes','no','never','route','force_rport','force_rport,comedia') DEFAULT NULL,
  `callgroup` varchar(40) DEFAULT NULL,
  `pickupgroup` varchar(40) DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `allow` varchar(40) DEFAULT NULL,
  `disallow` varchar(40) DEFAULT NULL,
  `insecure` varchar(40) DEFAULT NULL,
  `trustrpid` enum('yes','no') DEFAULT NULL,
  `progressinband` enum('yes','no','never') DEFAULT NULL,
  `promiscredir` enum('yes','no') DEFAULT NULL,
  `useclientcode` enum('yes','no') DEFAULT NULL,
  `accountcode` varchar(40) DEFAULT NULL,
  `setvar` varchar(40) DEFAULT NULL,
  `callerid` varchar(40) DEFAULT NULL,
  `amaflags` varchar(40) DEFAULT NULL,
  `callcounter` enum('yes','no') DEFAULT NULL,
  `busylevel` int(11) DEFAULT NULL,
  `allowoverlap` enum('yes','no') DEFAULT NULL,
  `allowsubscribe` enum('yes','no') DEFAULT NULL,
  `videosupport` enum('yes','no') DEFAULT NULL,
  `maxcallbitrate` int(11) DEFAULT NULL,
  `rfc2833compensate` enum('yes','no') DEFAULT NULL,
  `mailbox` varchar(40) DEFAULT NULL,
  `session-timers` enum('accept','refuse','originate') DEFAULT NULL,
  `session-expires` int(11) DEFAULT NULL,
  `session-minse` int(11) DEFAULT NULL,
  `session-refresher` enum('uac','uas') DEFAULT NULL,
  `t38pt_usertpsource` varchar(40) DEFAULT NULL,
  `regexten` varchar(40) DEFAULT NULL,
  `fromdomain` varchar(40) DEFAULT NULL,
  `fromuser` varchar(40) DEFAULT NULL,
  `qualify` varchar(40) DEFAULT NULL,
  `defaultip` varchar(40) DEFAULT NULL,
  `rtptimeout` int(11) DEFAULT NULL,
  `rtpholdtimeout` int(11) DEFAULT NULL,
  `sendrpid` enum('yes','no') DEFAULT NULL,
  `outboundproxy` varchar(40) DEFAULT NULL,
  `callbackextension` varchar(40) DEFAULT NULL,
  `registertrying` enum('yes','no') DEFAULT NULL,
  `timert1` int(11) DEFAULT NULL,
  `timerb` int(11) DEFAULT NULL,
  `qualifyfreq` int(11) DEFAULT NULL,
  `constantssrc` enum('yes','no') DEFAULT NULL,
  `contactpermit` varchar(40) DEFAULT NULL,
  `contactdeny` varchar(40) DEFAULT NULL,
  `usereqphone` enum('yes','no') DEFAULT NULL,
  `textsupport` enum('yes','no') DEFAULT NULL,
  `faxdetect` enum('yes','no') DEFAULT NULL,
  `buggymwi` enum('yes','no') DEFAULT NULL,
  `auth` varchar(40) DEFAULT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `trunkname` varchar(40) DEFAULT NULL,
  `cid_number` varchar(40) DEFAULT NULL,
  `callingpres` enum('allowed_not_screened','allowed_passed_screen','allowed_failed_screen','allowed','prohib_not_screened','prohib_passed_screen','prohib_failed_screen','prohib') DEFAULT NULL,
  `mohinterpret` varchar(40) DEFAULT NULL,
  `mohsuggest` varchar(40) DEFAULT NULL,
  `parkinglot` varchar(40) DEFAULT NULL,
  `hasvoicemail` enum('yes','no') DEFAULT NULL,
  `subscribemwi` enum('yes','no') DEFAULT NULL,
  `vmexten` varchar(40) DEFAULT NULL,
  `autoframing` enum('yes','no') DEFAULT NULL,
  `rtpkeepalive` int(11) DEFAULT NULL,
  `call-limit` int(11) DEFAULT NULL,
  `g726nonstandard` enum('yes','no') DEFAULT NULL,
  `ignoresdpversion` enum('yes','no') DEFAULT NULL,
  `allowtransfer` enum('yes','no') DEFAULT NULL,
  `dynamic` enum('yes','no') DEFAULT NULL,
  `ringinuse` varchar(255) DEFAULT 'no',
  `encryption` varchar(255) DEFAULT NULL,
  `avpf` varchar(255) DEFAULT NULL,
  `force_avp` varchar(255) DEFAULT NULL,
  `icesupport` varchar(255) DEFAULT NULL,
  `dtlsenable` varchar(255) DEFAULT NULL,
  `dtlsverify` varchar(255) DEFAULT NULL,
  `dtlscertfile` varchar(255) DEFAULT NULL,
  `dtlscafile` varchar(255) DEFAULT NULL,
  `dtlssetup` varchar(255) DEFAULT NULL,
  `rtcp_mux` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sip_peers`
--

INSERT INTO `sip_peers` (`id`, `user_id`, `dept_id`, `name`, `agent_name`, `ipaddr`, `port`, `regseconds`, `defaultuser`, `fullcontact`, `regserver`, `useragent`, `lastms`, `host`, `type`, `context`, `permit`, `deny`, `secret`, `md5secret`, `remotesecret`, `transport`, `dtmfmode`, `directmedia`, `nat`, `callgroup`, `pickupgroup`, `language`, `allow`, `disallow`, `insecure`, `trustrpid`, `progressinband`, `promiscredir`, `useclientcode`, `accountcode`, `setvar`, `callerid`, `amaflags`, `callcounter`, `busylevel`, `allowoverlap`, `allowsubscribe`, `videosupport`, `maxcallbitrate`, `rfc2833compensate`, `mailbox`, `session-timers`, `session-expires`, `session-minse`, `session-refresher`, `t38pt_usertpsource`, `regexten`, `fromdomain`, `fromuser`, `qualify`, `defaultip`, `rtptimeout`, `rtpholdtimeout`, `sendrpid`, `outboundproxy`, `callbackextension`, `registertrying`, `timert1`, `timerb`, `qualifyfreq`, `constantssrc`, `contactpermit`, `contactdeny`, `usereqphone`, `textsupport`, `faxdetect`, `buggymwi`, `auth`, `fullname`, `trunkname`, `cid_number`, `callingpres`, `mohinterpret`, `mohsuggest`, `parkinglot`, `hasvoicemail`, `subscribemwi`, `vmexten`, `autoframing`, `rtpkeepalive`, `call-limit`, `g726nonstandard`, `ignoresdpversion`, `allowtransfer`, `dynamic`, `ringinuse`, `encryption`, `avpf`, `force_avp`, `icesupport`, `dtlsenable`, `dtlsverify`, `dtlscertfile`, `dtlscafile`, `dtlssetup`, `rtcp_mux`, `created_date`, `updated_date`) VALUES
(132, 21, 1, '787', 'Vinayak', '157.44.188.225', 47079, 1626366497, '787', 'sip:787@157.44.188.225:47079^3Btransport=UDP^3Brinstance=5ac729023b53c3a4', '', 'Zoiper rv2.10.12.3-mod', 0, 'dynamic', 'peer', 'inbound', NULL, NULL, 'vinayak', NULL, NULL, 'ws,wss,udp', NULL, NULL, 'force_rport,comedia', NULL, NULL, NULL, NULL, NULL, 'port,invite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-10 17:02:14', '2020-09-10 17:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `time_condition_application`
--

CREATE TABLE IF NOT EXISTS `time_condition_application` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `time_group_id` int(11) DEFAULT NULL,
  `success_app_name` varchar(150) DEFAULT NULL,
  `success_app_id` int(11) DEFAULT NULL,
  `failed_app_name` varchar(150) DEFAULT NULL,
  `failed_app_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_condition_application`
--

INSERT INTO `time_condition_application` (`id`, `name`, `time_group_id`, `success_app_name`, `success_app_id`, `failed_app_name`, `failed_app_id`, `created_at`) VALUES
(4, 'Agg Bus Time Condition', 5, 'IVR', 16, 'AUDIO', 95, '2020-09-08 14:35:06'),
(5, 'Train Time Condtion', 6, 'IVR', 73, 'IVR', 73, '2020-10-06 05:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rubin', 'admin@mailinator.com', '$2y$10$U5DVWmKZoqaKkgovBSW93.lrM3gjVnBk4QxWQr1xscj.RZUe/erWq', 'JXUANGzJsfj1kptgxlvKvmLMj6lh7trXY8mx1SUY9CX7uhdFatPq7LEYEDgJ', '2021-05-28 22:52:36', '2021-05-28 22:52:36'),
(2, 'RubinUser', 'user@mailinator.com', '$2y$10$U5DVWmKZoqaKkgovBSW93.lrM3gjVnBk4QxWQr1xscj.RZUe/erWq', 'BDMjmIUyL5lp8CFRW315qr8jXzdslS9Jix5MLy4irg6KJNxBfP5SEQKV6PH7', '2021-05-28 22:52:36', '2021-05-28 22:52:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `callgroup_application`
--
ALTER TABLE `callgroup_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conference_application`
--
ALTER TABLE `conference_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `did_numbers`
--
ALTER TABLE `did_numbers`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `search_did` (`pri`), ADD KEY `pri` (`pri`), ADD KEY `did` (`did`), ADD KEY `app_name` (`app_name`), ADD KEY `app_value` (`app_value`), ADD KEY `operator` (`operator`), ADD KEY `type` (`type`), ADD KEY `status` (`status`), ADD KEY `created_date` (`created_date`);

--
-- Indexes for table `forward_application`
--
ALTER TABLE `forward_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ivr_application`
--
ALTER TABLE `ivr_application`
  ADD PRIMARY KEY (`id`), ADD KEY `type` (`type`), ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`), ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `queue_application`
--
ALTER TABLE `queue_application`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`), ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sip_peers`
--
ALTER TABLE `sip_peers`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `ipaddr` (`ipaddr`,`port`), ADD KEY `host` (`host`,`port`);

--
-- Indexes for table `time_condition_application`
--
ALTER TABLE `time_condition_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `callgroup_application`
--
ALTER TABLE `callgroup_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `conference_application`
--
ALTER TABLE `conference_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `did_numbers`
--
ALTER TABLE `did_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `forward_application`
--
ALTER TABLE `forward_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ivr_application`
--
ALTER TABLE `ivr_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `queue_application`
--
ALTER TABLE `queue_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sip_peers`
--
ALTER TABLE `sip_peers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT for table `time_condition_application`
--
ALTER TABLE `time_condition_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
