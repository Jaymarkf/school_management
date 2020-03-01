-- MySQL dump 10.17  Distrib 10.3.16-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pro_sms
-- ------------------------------------------------------
-- Server version	10.3.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_settings`
--

DROP TABLE IF EXISTS `academic_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_settings`
--

LOCK TABLES `academic_settings` WRITE;
/*!40000 ALTER TABLE `academic_settings` DISABLE KEYS */;
INSERT INTO `academic_settings` VALUES (1,'limit_upload',''),(2,'report_teacher','1'),(3,'minium_mark','61'),(22,'teacher_average','1'),(13,'minium_average','80'),(23,'max_mark',''),(24,'allowed_marks','1');
/*!40000 ALTER TABLE `academic_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_syllabus`
--

DROP TABLE IF EXISTS `academic_syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_syllabus` (
  `academic_syllabus_id` int(11) NOT NULL AUTO_INCREMENT,
  `academic_syllabus_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `uploader_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`academic_syllabus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_syllabus`
--

LOCK TABLES `academic_syllabus` WRITE;
/*!40000 ALTER TABLE `academic_syllabus` DISABLE KEYS */;
INSERT INTO `academic_syllabus` VALUES (1,'be751ea','aaa','aaa',1,'admin',1,'2019-2020','1577954532','',1);
/*!40000 ALTER TABLE `academic_syllabus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `owner_status` int(11) NOT NULL DEFAULT 0 COMMENT '1 owner, 0 not owner',
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `birthday` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin','admin@gmail.com','admin','09090909090','Daet C.N.',1,'admin',1,'29-12-2016'),(45,'aa','aa','admin','2111','aaa',0,'aa',1,'');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0(undefined) 1(present) 2(absent)',
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (5,'1583017200','2020-2021',6,8,24,9,1),(6,'1583017200','2020-2021',6,8,25,9,1),(7,'1583017200','2020-2021',6,8,26,9,1),(8,'1583017200','2020-2021',6,8,27,9,1),(9,'1583017200','2020-2021',6,8,24,7,1),(10,'1583017200','2020-2021',6,8,25,7,0),(11,'1583017200','2020-2021',6,8,26,7,1),(12,'1583017200','2020-2021',6,8,27,7,3),(13,'1583017200','2020-2021',6,8,24,16,0),(14,'1583017200','2020-2021',6,8,25,16,0),(15,'1583017200','2020-2021',6,8,26,16,0),(16,'1583017200','2020-2021',6,8,27,16,0),(17,'1583017200','2020-2021',4,0,28,13,0),(18,'1583017200','2020-2021',6,8,24,10,1),(19,'1583017200','2020-2021',6,8,25,10,0),(20,'1583017200','2020-2021',6,8,26,10,0),(21,'1583017200','2020-2021',6,8,27,10,0),(22,'1583017200','2020-2021',6,8,24,17,0),(23,'1583017200','2020-2021',6,8,25,17,0),(24,'1583017200','2020-2021',6,8,26,17,0),(25,'1583017200','2020-2021',6,8,27,17,0),(26,'1583017200','2020-2021',6,8,24,8,0),(27,'1583017200','2020-2021',6,8,25,8,0),(28,'1583017200','2020-2021',6,8,26,8,0),(29,'1583017200','2020-2021',6,8,27,8,0),(30,'1583017200','2020-2021',4,0,28,13,0),(31,'1583017200','2020-2021',6,8,24,12,0),(32,'1583017200','2020-2021',6,8,25,12,0),(33,'1583017200','2020-2021',6,8,26,12,0),(34,'1583017200','2020-2021',6,8,27,12,0),(35,'1583017200','2020-2021',6,0,28,12,0),(36,'1583017200','2020-2021',6,8,24,11,1),(37,'1583017200','2020-2021',6,8,25,11,1),(38,'1583017200','2020-2021',6,8,26,11,1),(39,'1583017200','2020-2021',6,8,27,11,3),(40,'1583017200','2020-2021',6,0,28,11,2),(41,'1583017200','2020-2021',6,8,29,11,1),(42,'1583017200','2020-2021',6,8,30,11,0),(43,'1583017200','2020-2021',6,8,31,11,1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_backup`
--

DROP TABLE IF EXISTS `attendance_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_backup` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL COMMENT '0 undefined , 1 present , 2  absent',
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `year` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session` longtext NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_backup`
--

LOCK TABLES `attendance_backup` WRITE;
/*!40000 ALTER TABLE `attendance_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_info`
--

DROP TABLE IF EXISTS `candidate_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_info` (
  `candidate_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`candidate_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_info`
--

LOCK TABLES `candidate_info` WRITE;
/*!40000 ALTER TABLE `candidate_info` DISABLE KEYS */;
INSERT INTO `candidate_info` VALUES (1,14,'Patricia S. Cabrera',1),(2,25,'John Ruzzel Fraile',0),(3,24,'Patricia Kaye S. Cabrera',1),(4,26,'Karen Joy Gonzales',2),(5,27,'Mary Joy Tolosa',6),(6,28,'Russel Abarca',7),(7,29,'Richard Morales',0),(8,31,'Joyce Jimenez',1);
/*!40000 ALTER TABLE `candidate_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('bs9jdn0cfbqh4qd9g58jhu8he6','::1',1583038775,'__ci_last_regenerate|i:1583038359;admin_login|s:1:\"1\";admin_id|s:1:\"1\";login_user_id|s:1:\"1\";name|s:5:\"Admin\";login_type|s:5:\"admin\";'),('m2iq67avhc4v205bhie12kg84i','::1',1583057503,'__ci_last_regenerate|i:1583054099;admin_login|s:1:\"1\";admin_id|s:1:\"1\";login_user_id|s:1:\"1\";name|s:5:\"Admin\";login_type|s:5:\"admin\";');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name_numeric` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (4,'BSIT (1st year)','',0),(5,'BSIT (2nd year)','',0),(6,'BSIT (3rd Year)','',0),(7,'ACT (1st year)','',0),(8,'ACT (2nd year)','',0);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_routine`
--

DROP TABLE IF EXISTS `class_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_routine` (
  `class_routine_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `room_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `time_start` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `time_start_min` int(11) NOT NULL,
  `time_end_min` int(11) NOT NULL,
  `day` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`class_routine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_routine`
--

LOCK TABLES `class_routine` WRITE;
/*!40000 ALTER TABLE `class_routine` DISABLE KEYS */;
INSERT INTO `class_routine` VALUES (21,6,8,7,'CLab 1',17,20,30,0,'Friday','2020-2021'),(22,6,8,8,'106',17,18,0,0,'Monday','2020-2021'),(23,6,8,9,'105',18,19,0,0,'Tuesday','2020-2021'),(24,6,8,11,'CLab 2',18,21,0,0,'Wednesday','2020-2021'),(26,4,7,13,'102',8,9,0,0,'Tuesday','2020-2021'),(27,8,10,15,'102',13,15,0,0,'Friday','2020-2021'),(28,6,12,16,'CLab 1',16,17,0,0,'Thursday','2020-2021'),(29,8,10,19,'CLab 1',10,11,0,0,'Friday','2020-2021'),(30,8,10,18,'Tech Lab',16,18,0,0,'Wednesday','2020-2021'),(31,6,12,12,'Tech Lab',16,18,0,0,'Friday','2020-2021');
/*!40000 ALTER TABLE `class_routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dormitory` (
  `dormitory_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_room` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dormitory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (21,'myRoom','102','Desc');
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll` (
  `enroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `enroll_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL DEFAULT 0,
  `date_added` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `selected_subject` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`enroll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES (23,'87e045c',24,6,8,'1583030485','2020-2021','7,8,9,10,11,12,16,17'),(24,'6d795bb',25,6,8,'1583030715','2020-2021','7,8,9,10,11,12,16,17'),(25,'500e690',26,6,8,'1583030775','2020-2021','7,8,9,10,11,12,16,17'),(26,'cf6ca16',27,6,8,'1583030829','2020-2021','7,8,9,10,11,12,16,17'),(27,'79eb9b1',28,4,0,'1583030966','2020-2021','7,8,11,16,12,13'),(28,'9cc1e1a',29,6,8,'1583037330','2020-2021','7,8,9,10,11,12,16,17'),(29,'e2c1ea8',30,6,8,'1583038761','2020-2021','7,8,9,10,11,12,16,17'),(30,'e745f78',31,6,8,'1583038979','2020-2021','7,8,9,10,11,12,16,17');
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `datefrom` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateto` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (2,'Year End Party','','01-01-2020','02-01-2020');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (11,'Winter','2016-2017','Winter semester'),(12,'1st','2019-2020','BSIT');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `availablefrom` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `availableto` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `questions` int(11) NOT NULL,
  `pass` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accesscode` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `exam_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_category`
--

DROP TABLE IF EXISTS `expense_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_category`
--

LOCK TABLES `expense_category` WRITE;
/*!40000 ALTER TABLE `expense_category` DISABLE KEYS */;
INSERT INTO `expense_category` VALUES (1,'student ID laminate card');
/*!40000 ALTER TABLE `expense_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `section_id` int(11) NOT NULL,
  `post_status` int(11) DEFAULT 1,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_message`
--

DROP TABLE IF EXISTS `forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_message` (
  `message` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_message`
--

LOCK TABLES `forum_message` WRITE;
/*!40000 ALTER TABLE `forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_album`
--

DROP TABLE IF EXISTS `gallery_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_album` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_upload` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `photo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_album`
--

LOCK TABLES `gallery_album` WRITE;
/*!40000 ALTER TABLE `gallery_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_category`
--

DROP TABLE IF EXISTS `gallery_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `embed` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_category`
--

LOCK TABLES `gallery_category` WRITE;
/*!40000 ALTER TABLE `gallery_category` DISABLE KEYS */;
INSERT INTO `gallery_category` VALUES (1,'','front image na makikita sa video ','');
/*!40000 ALTER TABLE `gallery_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(2) NOT NULL,
  `year` longtext NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_grade` varchar(11) DEFAULT NULL,
  `specific_grade` varchar(11) DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-inactive, 1-active',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (3,2,'2020-2021',6,8,7,24,'1.25','96.80','PASSED',0),(4,2,'2020-2021',6,8,7,25,'1.00','99.7','',0),(5,2,'2020-2021',6,8,7,26,'1.50','92.0','',0),(6,2,'2020-2021',6,8,7,27,'1.75','85.79','',0),(7,2,'2020-2021',6,8,7,24,'1.25','96.80','PASSED',0),(8,2,'2020-2021',6,8,7,25,'1.00','99.7','',0),(9,2,'2020-2021',6,8,7,26,'1.50','92.0','',0),(10,2,'2020-2021',6,8,7,27,'1.75','85.79','',0),(11,1,'2020-2021',6,0,7,28,'2.75','62','',0),(12,1,'2020-2021',6,8,7,29,'1.50','90','',0),(13,1,'2020-2021',6,8,7,30,'1.00','','',0),(14,1,'2020-2021',6,8,7,31,'1.25','95','',0),(15,2,'2020-2021',6,0,7,28,'2.75','','',0),(16,2,'2020-2021',6,8,7,29,'1.50','','',0),(17,2,'2020-2021',6,8,7,30,'2.75','','',0),(18,2,'2020-2021',6,8,7,31,'1.00','','',0);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `homework_id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `homework_status` int(11) NOT NULL DEFAULT 1,
  `time_end` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `section_id` int(11) NOT NULL,
  `uploader_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`homework_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,'9a423ad44a','','',1,1,27,1,'',1,'teacher','Screenshot from 2019-12-26 15-53-47.png');
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_examenes`
--

DROP TABLE IF EXISTS `horarios_examenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios_examenes` (
  `horario_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `time_start_min` int(11) NOT NULL,
  `time_end_min` int(11) NOT NULL,
  `day` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `room_id` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fecha` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`horario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_examenes`
--

LOCK TABLES `horarios_examenes` WRITE;
/*!40000 ALTER TABLE `horarios_examenes` DISABLE KEYS */;
INSERT INTO `horarios_examenes` VALUES (2,1,4,1,17,18,30,30,'Friday','','2019-2020','03-01-2020'),(3,1,2,1,17,18,30,30,'Friday','','2019-2020','03-01-2020'),(5,1,18,2,14,18,10,20,'Monday','102','2020-2021','04-02-2020'),(6,6,8,8,17,18,0,0,'Monday','106','2020-2021','16-03-2020'),(7,6,8,9,18,19,30,30,'Monday','106','2020-2021','16-03-2020'),(8,6,8,11,17,18,30,30,'Tuesday','CLab 1','2020-2021','17-03-2020');
/*!40000 ALTER TABLE `horarios_examenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_paid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `due` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `payment_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (40,0,'wer','asdfasdf',55,'555','-500',1577635200,'','','','unpaid','2016-2017'),(41,0,'ID','bayad sa iD',300,'50','250',1577116800,'','','','unpaid','2016-2017'),(42,2,'ID','bayad sa ID',100,'80','20',1576684800,'','','','unpaid','2016-2017'),(43,7,'Diploma','diploma',100,'100','0',1577865600,'','','','unpaid','2019-2020'),(44,0,'asfasf','',0,'2322','-2322',1581523200,'','','','paid','2020-2021'),(45,1,'fasdf','asdf',123,'2322','-2199',1583251200,'','','','paid','2020-2021'),(46,15,'Tuition Fee','Midterm Exam',4,'4,500','0',1578956400,'','','','paid','2020-2021');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portuguse` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `hindi` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `french` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `serbian` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `arabic` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3981 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (386,'Required','Required','Obligatorio','obrigatório','अनिवार्य','obligatoire','обавезан','إلزامي'),(464,'Viewing-Report','Viewing Report','Viendo Reporte','visualização de relatórios','देखने रिपोर्ट','Rapport de visualisation','гледање Извештај','تقرير عرض'),(390,'Admin-Dashboard','Admin Dashboard','Tablero de Administración','Conselho de Administração','निदेशक मंडल','Conseil d\'administration','Управни одбор','مجلس الإدارة'),(391,'Send-Teacher-Files','Send files to teachers','Enviar archivos a los Profesores','Enviar arquivos para Professores','शिक्षकों के लिए फाइल को भेजें','Envoyer des fichiers aux enseignants','Слање датотека на наставнике','إرسال الملفات إلى المعلمين'),(392,'New-Student','Add Student','Agregar nuevo estudiante','Adicionar novo aluno','नए छात्र जोड़े','Ajouter un étudiant','Додај нови студент','إضافة طالب جديد'),(393,'Student-Form','Registration Form','Formulario de registro','Formulário de Inscrição','पंजीकरण फार्म','Formulaire d\'inscription','Образац за регистрацију','استمارة التسجيل'),(394,'Report-Teacher-List','Teachers reported','Profesores Reportados','Os professores relataram','शिक्षकों की सूचना दी','enseignants déclarés','nastavnici','المعلمين المبلغ عنها'),(465,'Students','Students','Estudiantes','estudantes','छात्रों','étudiants','студенти','الطلاب'),(450,'Delete','Delete','Eliminar','remover','हटाना','supprimer','уклонити','نقل'),(466,'Class','Class','Grado','grau','उपाधि','degré','степен','درجة'),(461,'Removed','Removed successfully','Eliminado Correctamente','justamente eliminado','सफलतापूर्वक हटा','Correctement éliminé','С правом елиминисан','القضاء بحق'),(460,'Updated','Successfully updated','Actualizado correctamente','atualizado com sucesso','सफलतापूर्वक अद्यतन','mis à jour avec succès','успешно ажурирана','تحديث بنجاح'),(453,'Add','Add','Agregar','adicionar','जोड़ना','ajouter','додати','إضافة'),(467,'Marks-Of','Marks of','Calificaciones de','classificações','रेटिंग्स','notes','рејтинг','تصنيفات'),(468,'Student-Promotion','Student Promotion','Promover Estudiantes','Os estudantes que promovem','को बढ़ावा देने के छात्र','promouvoir les étudiants','промовишу Студенти','طلاب تعزيز'),(469,'Manage-Parents','Manage Parents','Administrar Padres de familia','Gerenciar Pais','माता-पिता को प्रबंधित','Gérer les parents','upravljanje Парентс','إدارة الآباء'),(470,'Manage-Teachers','Manage Teachers','Administrar Profesores','gerenciar Professores','शिक्षकों का प्रबंधन','gérer enseignants','управљати наставнике','إدارة المعلمين'),(471,'Manage-Subjects','Manage Subjects','Administrar Cursos','gerenciar cursos','पाठ्यक्रम प्रबंधन','gérer Cours','управљају курсеве','إدارة الدورات'),(472,'Manage-Classes','Manage Classes','Administrar Grados','gerenciar graus','ग्रेड का प्रबंधन','gérer les qualités','управља степени','إدارة الصفوف'),(473,'Virtual-Library','Virtual Library','Librería Virtual','biblioteca virtual','आभासी पुस्तकालय','bibliothèque virtuelle','виртуелна библиотека','المكتبة الافتراضية'),(474,'Manage-Sections','Manage Sections','Administrar Secciones','gerenciar Secções','धारा का प्रबंधन','gérer Sections','управља секција','إدارة الأقسام'),(475,'Select-None','Not selected','Sin seleccionar','não verificado','अनियंत्रित','incontrôlé','није изабрано','دون رادع'),(476,'Semesters','Semesters','Semestres','semestres','सेमेस्टर','semestres','семестара','فصول دراسية'),(477,'Upload-Marks','Upload Marks','Subir Calificaciones','Subir Calificaciones','रेटिंग','up évaluations','Уплоад рејтинг','يصل التقييمات'),(478,'Marks-by-Subject','Marks By Subject','Calificaciones por curso','Classificações por curso','पाठ्यक्रम के अनुसार रेटिंग','Évaluations par cours','оцене по курсу','التقييمات لكل دورة'),(479,'Exam-Routine','Exam Routine','Horarios de Exámenes','Períodos de teste','परीक्षण के समय','Temps d\'essai','testiranje пута','الأوقات العصيبة'),(480,'Class-Routine','Class Routine','Horarios de Clases','Tabela de Ramos','वर्गों की अनुसूची','Horaire des cours','Распоред часова','الجدول الزمني للفصول'),(481,'Attendance','Attendance','Control de Asistencia','atendimento diário','नियंत्रण असिस्ट','Commande d\'assistance','Ассист Цонтрол','مساعدة تحكم'),(482,'Attendance-Report','Attendance Report','Reporte de Asistencia','Relatório de Frequência','उपस्थिति रिपोर्ट','Participation Rapport','prisustvo Извештај','تقرير الحضور'),(483,'Details','Details','Detalles','detalhes','विवरण','détails','detalji','تفاصيل'),(484,'Send-News','Send News','Enviar Noticias','enviar Notícia','समाचार प्रस्तुत','soumettre Nouvelles','субмит Невс','تقديم الأخبار'),(500,'Documents-Teachers','Documents for teachers','Documentos para los Profesores','Documentos para Professores','शिक्षकों के लिए दस्तावेज','Documents pour les enseignants','Документи за наставнике','وثائق للمعلمين'),(487,'Semester-Content','Contents of the semester','Contenidos del Semestre','conteúdo Semestre','सामग्री सेमेस्टर','Contenu Semestre','Садржај семестра','محتويات الفصل الدراسي'),(488,'Students-Payments','Student Payments','Pagos Mensuales','Os pagamentos mensais','मासिक भुगतान','Les paiements mensuels','месечних рата','دفعات شهرية'),(489,'Expense','Expense','Egresos','despesa','व्यय','dépense','трошак','إنفاق'),(490,'Expense-Category','Expense Category','Categorías de Egresos','Categorias de despesas','व्यय श्रेणियों','Catégories de dépenses','kategorije трошкова','فئات الإنفاق'),(491,'Manage-School-Bus','Manage School Bus','Administrar bus escolar','Gerenciar ônibus escolar','स्कूल बस का प्रबंधन','Gérer les autobus scolaires','Управљање школски аутобус','إدارة الحافلات المدرسية'),(492,'Manage-Classrooms','Manage Classrooms','Administrar salones de clases','Gerenciar salas de aula','कक्षाओं की व्यवस्था करें','Gérer les salles de classe','upravljanje учионице','إدارة الفصول الدراسية'),(493,'Message-Sent','Message sent correctly','Mensaje Enviado ','Mensagem enviada','संदेश भेजा','Message envoyé','poruka послата','رسالة أرسلت'),(494,'Private-Messages','Private Messages','Mensajes Privados','mensagens privadas','निजी संदेश','messages privés','приватне поруке','رسائل خاصة'),(495,'System-Updated','System Updated','Sistema Actualizado','sistema atualizado','अद्यतन प्रणाली','Mise à jour du système','ажуриран систем','النظام المحدثة'),(497,'System-Settings','System Settings','Ajustes del Sistema','Configurações do sistema','सिस्टम सेटिंग्स','Paramètres système','Систем Сеттингс','إعدادات النظام'),(499,'Admins','Admins','Administradores','administradores','प्रशासकों','administrateurs','администратори','الإداريين'),(505,'Password-Error','Password Error','La contraseña no coincide','A senha não corresponde','पासवर्ड मेल नहीं खाता','Le mot de passe ne correspond pas','Лозинка не одговара','لا تطابق كلمة المرور'),(506,'My-Profile','My Profile','Mi Perfil','Meu perfil','मेरी प्रोफाइल','Mon profil','мој профил','الملف الشخصي الخاص بي'),(507,'Search-Result','Search Result','Resultados de la Búsqueda','resultados da pesquisa','खोज परिणाम','Résultats de la recherche','Резултати претраге','نتائج البحث'),(508,'Events','Events Calendar','Calendario de Eventos','Calendário de Eventos','घटनाओं का कैलेंडर','Calendrier des événements','Календар догађаја','أجندة الفعاليات'),(509,'Welcome','Welcome','Bienvenido','bem-vindo','स्वागत','bienvenue','добродошао','ترحيب'),(511,'Messages','Messages','Mensajes','mensagens','पदों\n','messages','порука','المشاركات'),(512,'Profile','Profile','Perfil','perfil','प्रोफ़ाइल','profil','профил','البيانات الشخصية'),(513,'Exit','Logout','Salir','saída','निकास','Sortir','логоут','خروج'),(514,'Search-by-name','Search Student','Buscar estudiante por nombre','Pesquisa aluno pelo nome','नाम से खोजें छात्र','Rechercher étudiant par nom','Студента по имену','طالب في البحث عن طريق الاسم'),(520,'Create-Payment','Create Invoice','Realizar cobro','realizar a coleta','संग्रह में प्रदर्शन','effectuer la collecte','извршити наплату','أداء مجموعة'),(516,'Dashboard','Dashboard','Tablero','placa','बोर्ड','conseil','табла','مجلس'),(518,'School-Bus','School Bus','Bus Escolar','Ônibus escolar','स्कूल बस','Autobus scolaire','школски аутобус','حافلة مدرسية'),(521,'Payments-Sent','Invoices','Cobros enviados','Os rendimentos enviados','आय भेजा','Produit envoyé','prihodi послао','عائدات أرسلت'),(530,'User-Account','Users Accounts','Cuentas de Usuarios','Contas de usuário','उपयोगकर्ता खाते','Comptes d\'utilisateurs','Усер Аццоунтс','حسابات المستخدمين'),(531,'Teachers','Teachers','Profesores','professores','शिक्षकों','enseignants','мајстори','معلمون'),(532,'Parents','Parents','Padres','pais','माता-पिता','parents','родитељи','الآباء'),(533,'Student-Information','Student Information','Información de los Estudiantes','Informações do estudante','छात्र सूचना','Information sur les étudiants','студент informacije','معلومات الطالب'),(534,'Teachers-Files','Teacher Files','Archivos para profesores','Arquivos de professores','शिक्षक फ़ाइलें','Fichiers d\'enseignants','Теацхер Бр','ملفات المعلم'),(535,'Daily-Attendance','Daily Attendance','Asistencia Diaria','atendimento diário','दैनिक उपस्थिति','présence quotidienne','Дневни присуство','الحضور اليومي'),(536,'Subjects','Subjects','Cursos','cursos','पाठ्यक्रम','cours','курсеви','الدورات'),(537,'Schedules','Schedules','Horarios','horário','समय सारिणी','calendrier','распоред','جدول مواعيد'),(538,'Qualifications','Marks','Calificaciones','classificações','रेटिंग्स','notes','рејтинг','تصنيفات'),(539,'Academic-Files','Academic Files','Archivos Académicos','arquivos acadêmicos','एकेडमिक फ़ाइलें','fichiers académiques','Ацадемиц фајлова','ملفات الأكاديمية'),(540,'News-Sent','Sent News','Noticias Enviadas','Notícias submetidas','प्रस्तुत समाचार','Nouvelles Soumis','Субмиттед Новости','الأخبار المقدمة'),(541,'Accounting','Accounting','Contabilidad','contabilidade','लेखांकन','comptabilité','рачуноводство','المحاسبة'),(542,'Reports','Academic Reports','Reportes Académicos','relatórios académicos','एकेडमिक रिपोर्टों','rapports académiques','Ацадемиц извештаји','التقارير الأكاديمية'),(543,'Teacher-Report','Teacher Report','Reportes de Profesores','relatórios Professores','रिपोर्ट शिक्षक','Rapports enseignants','Извештаји Наставници','المعلمون تقارير'),(544,'Student-Report','Student Report','Reportes de Estudiantes','Relatórios de estudante','विद्यार्थी रिपोर्ट','Rapports d\'étudiants','Студент Извештаји','تقارير طالب'),(545,'News','News','Noticias','notícia','समाचार','nouvelles','новости','أخبار'),(547,'View-All','View All','Ver todo','ver todos','सभी देखते हैं','voir tous','види све','ترى كل'),(548,'Go-to-site','Go to website','Ir al sitio','Ir para o site','साइट पर जाएं','Accéder au site','Иди на сајту','انتقل إلى موقع'),(549,'Login','Login','Acceder','log in','लोग इन','connectez-vous','лог ин','تسجيل الدخول'),(550,'Password','Password','Contraseña','senha','पासवर्ड','mot de passe','лозинка','كلمة المرور'),(551,'Username','Username','Usuario','usuário','उपयोगकर्ता','utilisateur','корисник','المستخدم'),(552,'Close','Close','Cerrar','perto','निकट','Fermer','близу','قريب'),(553,'Cancel','Cancel','Cancelar','cancelar','रद्द करना','annuler','отказати','إلغاء'),(554,'Are-you-sure','Are you sure you want to do this?','¿Seguro que quieres hacer esto?','Tem certeza de que quer fazer isso?','आप ऐसा करना चाहते हैं आप सुनिश्चित हैं?','Êtes-vous sûr de vouloir faire ça?','Да ли сте сигурни да желите да урадите ово?','هل أنت متأكد أنك تريد أن تفعل هذا؟'),(555,'Date','Date','Fecha','data','तिथि','date','датум','تاريخ'),(557,'Name','Name','Nombre','nome','नाम','nom','име','اسم'),(558,'Description','Description','Descripción','descrição','विवरण','description','опис','وصف'),(559,'Options','Options','Opciones','opções','विकल्प','Options','opcije','خيارات'),(560,'Download','Download','Descargar','baixar','डाउनलोड','télécharger','Довнлоад','تحميل'),(561,'Upload-Files','Upload Files','Subir Archivos','fazer upload de arquivos','अपलोड फ़ाइलों','Télécharger des fichiers','Уплоад фајлова','تحميل الملفات'),(564,'Subject','Subject','Curso','curso','कोर्स','Cours','курс','مسار'),(563,'Upload-Book','Upload Book','Subir Libro','up livro','बुक','up Book','уп књига','حتى كتاب'),(565,'Select','Select','Seleccione','selecionar','चुनना','sélectionner','одабрати','اختر'),(566,'Title','Title','Título','título','शीर्षक','titre','наслов','لقب'),(567,'Book','Book','Libro','livro','किताब','livre','књига','كتاب'),(568,'Autor','Author','Autor','autor','लेखक','auteur','аутор','مؤلف'),(569,'Search','Search','Buscar','pesquisa','खोज','recherche','претраживање','بح'),(570,'Day','Day','Día','Dia','दिन','jour','дан','يوم'),(571,'Sunday','Sunday','Domingo','domingo','रविवार','dimanche','недеља','الأحد'),(572,'Monday','Monday','Lunes','segunda-feira','सोमवार','Lundi','понедељак','الإثنين'),(573,'Tuesday','Tuesday','Martes','terça-feira','मंगलवार','mardi','уторак','الثلاثاء'),(574,'Wednesday','Wednesday','Miercoles','quarta-feira','बुधवार','mercredi','среда','الأربعاء'),(575,'Thursday','Thursday','Jueves','quinta-feira','बृहस्पतिवार','jeudi','четвртак','الخميس'),(576,'Friday','Friday','Viernes','sexta-feira','शुक्रवार','vendredi','петак','الجمعة'),(577,'Saturday','Saturday','Sabado','sábado','शनिवार','samedi','субота','السبت'),(578,'Start','Start','Inicio','iniciação','दीक्षा','Début','иницирање','استهلال'),(579,'Hour','Hour','Hora','tempo','समय','temps','време','وقت'),(580,'Minutes','Minutes','Minutos','atas','मिनटों','procès-verbal','записник','دقيقة'),(581,'End','End','Fin','final','अंत','fin','крај','نهاية'),(582,'Email','Email','Correo','correio','मेल','courrier','пошта','بريد'),(583,'Phone','Phone','Celular','celular','सेलुलर','cellulaire','ћелијски','خلوي'),(584,'Address','Address','Dirección','endereço','पता','adresse','адреса','عنوان'),(585,'Type-Account','Account Type','Tipo de cuenta','Tipo de conta','खाते का प्रकार','Type de compte','Тип рачун','نوع الحساب'),(586,'Photo','Photo','Fotografía','fotografia','फोटोग्राफी','photographie','фотографија','تصوير'),(587,'Upload','Upload','Subir','carregar','अपलोड','télécharger','отпремање','تحميل'),(588,'Admin','Admin','Administrador','Gestor','प्रशासक','administrateur','Администратор','مدير'),(589,'Super-Admin','Super Administrator','Super Administrador','Super Gestor','सुपर व्यवस्थापक','super administrateur','супер Манагер','مدير سوبر'),(590,'Update','Update','Actualizar','atualizar','अद्यतन','mettre à jour','ажурирање','تحديث'),(591,'Change','Change','Cambiar','mudança','परिवर्तन','Changer','промена','تغيير'),(592,'Account-Status','Account Status','Estado de la cuenta','Estado da conta','खाते की स्थिति','Statut du compte','Статус налога','حالة الحساب'),(593,'Status','Status','Estado','estado','राज्य','état','држава','دولة'),(594,'Active','Active','Activa','Activa','एक्टिवा','Activa','ацтива','نشط'),(595,'Inactive','Inactive','Inactiva','inativo','निष्क्रिय','inactif','неактиван','غير فعال'),(596,'Parent','Parent','Padre','pai','पिता','père','отац','الأب'),(597,'Section','Section','Sección','seção','अनुभाग','section','одељак','قسم'),(598,'Select-Class','Select Class','Primero seleccione el grado','Primeiro, selecione a nota','पहली कक्षा का चयन','Sélectionnez d\'abord la note','Прво изаберите разред','أولا حدد الصف'),(599,'Roll','Roll','Carné','Carné','रोल','rouleau','Карне','كارنيه'),(600,'Birthday','Birthday','Cumpleaños','aniversário','जन्मदिन','anniversaire','рођендан','عيد ميلاد'),(601,'Sex','Sex','Género','sexo','लिंग','sexe','секс','جنس'),(602,'Male','Male','Masculino ','masculino','नर','Masculin','мушки','ذكر'),(603,'Female','Female','Femenino','feminino','महिला','Féminin','женски','أنثى'),(604,'Living-Assigned','Living Assigned','Salón asignado','Salão atribuído','हॉल सौंपा','attribué Salle','додељен сала','قاعة المخصصة'),(605,'View','View','Ver','ver','देखना','Voir','видети','شاهد'),(606,'Archived','Archive','Archivar','arquivo','फ़ाइल','fichier','фајл','ملف'),(607,'Unarchived','Unarchives','Desarchivar','desarmazenando','गैर अभिलेख','désarchivage','Опозив архивирања','unArchiving'),(608,'Add-Event','Add event','Agregar Evento','Adicionar evento','घटना जोड़ें','Ajouter un événement','Додај догађај','إضافة حدث'),(609,'Color','Colour','Color del Evento','Cor do evento','रंग घटना','Couleur de l\'événement','боја догађаја','حدث اللون'),(610,'Red','Red','Rojo','vermelho','लाल','Rouge','црвен','أحمر'),(611,'Orange','Orange','Naranja','laranja','नारंगी','Orange','поморанџа','البرتقالي'),(612,'Black','Black','Negro','preto','काला','noir','црн','أسود'),(613,'Blue','Blue','Azul','Azul','नीला','bleu','плава','أزرق'),(614,'Green','Green','Verde','verde','ग्रीन','vert','зелен','أخضر'),(615,'Edit','Edit','Editar','editar','संपादित','éditer','уреди','تحرير'),(617,'Return','Return','Regresar','retorno','वापसी','retour','повратак','عودة'),(618,'Year','Running Year','Año en curso','Ano','साल','Année','година','عام'),(619,'Titular-Teacher','Titular Teacher','Profesor Titular','professor de sala','प्रोफ़ेसर','professeur','мајстор Власник','أستاذ'),(620,'Numeric-Name','Numeric Name','Nombre Numérico ','nome numérico','संख्यात्मक नाम','nom numérique','Бројни име','اسم رقمية'),(622,'Classes','Classes','Grados','graus','ग्रेड','grades','оцене','الدرجات'),(623,'New','New','Nuevo','novo','नई','nouveau','нови','جديد'),(624,'Salons','Salons','Salones','salons','सैलून','Salons','салони','صالونات'),(625,'Salon','Salon','Salón','salão','सैलून','salon','салон','صالون'),(626,'Write-Comment','Write your comment here','Escribe tu comentario aquí','Escreva o seu comentário aqui','अपनी टिप्पणी यहाँ लिखें','Écrivez votre commentaire ici','Напишите ваш коментар овде','اكتب تعليقك هنا'),(627,'Send','Send','Enviar','enviar','भेजना','envoyer','послати','إرسال'),(628,'Teacher','Teacher','Profesor','mestre','प्रोफ़ेसर','professeur','мајстор','أستاذ'),(629,'Subject-Activity','Subject Activity','Actividades del Curso','As atividades do curso','पाठ्यक्रम गतिविधियों','Les activités du cours','kurs активности','أنشطة بالطبع'),(630,'Final-Exam','Final Exam','Examen Final','Exame final','अंतिम परीक्षा','Examen final','Завршни испит','إمتحان نهائي'),(631,'Prev','Previous','Anterior','anterior','पूर्व','précédent','претходна','سابق'),(632,'Next','Next','Siguiente','seguinte','निम्नलिखित','suivante','следећи','التالي'),(633,'Total-Users','Total Users','Usuarios Totales','total de usuários','कुल उपयोगकर्ताओं','total des utilisateurs','total Мемберс','إجمالي المستخدمين'),(634,'Update-Logo','Update Logo','Actualizar Logotipo','logotipo atualização','अद्यतन लोगो','mise à jour logo','ажурирање лого','شعار التحديث'),(635,'Logo','Logotype','Logotipo','logotipo','लोगो','logo','лого','شعار'),(636,'Calendar','Calendar','Calendario','calendário','कैलेंडर','calendrier','календар','تقويم'),(638,'Documents','Documents','Documentos','documentos','दस्तावेजों','documents','документи','وثائق'),(639,'File','File','Archivo','arquivo','पुरालेख','archives','Архива','أرشيف'),(640,'File-Type','Type of file','Tipo de archivo','Tipo de arquivo','फाइल प्रकार','Type de fichier','филе типе','نوع الملف'),(641,'Pdf','PDF','PDF','PDF','पीडीएफ','PDF','пдф','PDF'),(642,'Other','Other','Otro','outro','अन्य','autre','други','آخر'),(643,'Excel','Excel','Excel','sobressair','एक्सेल','exceller','екцел','تفوق'),(646,'Amount','Amount','Monto','quantidade','मात्रा','montant','износ','كمية'),(645,'Category','Category','Categoría','categoria','श्रेणी','catégorie','категорија','فئة'),(647,'Method','Method','Método','método','विधि','méthode','метод','طريقة'),(648,'Cash','Cash','Efectivo','Dinheiro','रोकड़','Espèces','ефикасан','فعال'),(649,'Check','Check','Cheque','Cheque bancário','बैंक चेक','Chèque bancaire','проверити','تحقق'),(650,'Card','Credit Card','Tarjeta','cartão','कार्ड','carte','картица','بطاقة'),(651,'New-Category','New Category','Nueva Categoría','novo Categoria','नई श्रेणी','nouvelle catégorie','nova категорија','جديد الفئة'),(652,'New-Expense','New Expense','Nuevo Egreso','nova Exit','नई निकलें','nouvelle sortie','нови излаз','خروج جديد'),(653,'Income','Income','Cobros','colecções','संग्रह','collections','колекције\n','مجموعات'),(654,'New-Income','New Income','Nuevo Cobro','nova coleção','नया संग्रह','nouvelle collection','nova колекција','مجموعة جديدة'),(655,'Report','Report','Reportes','relatórios','रिपोर्टों','rapports','извештаји','تقارير'),(656,'Update-Password','Update Password','Cambiar contraseña','alteração de senha','पासवर्ड बदलें','Changer le mot de passe','promena лозинке\n','تغيير كلمة المرور'),(657,'Current-Password','Current Password','Contraseña actual','Senha atual','वर्तमान पासवर्ड','mot de passe actuel','тренутна лозинка','كلمة المرور الحالية'),(658,'New-Password','New Password','Nueva contraseña','Nova senha','नया पासवर्ड','nouveau mot de passe','нова лозинка','كلمة سر جديدة'),(659,'Confirm-Password','Confirm new Password','Repita nueva contraseña','Repita nova senha','दोहराएँ नया पासवर्ड','Répéter nouveau mot de passe','Поновите нову лозинку','كلمة مرور جديدة كرر'),(660,'About','About','Acerca de mi','Sobre mim','मेरे बारे में','À propos de moi','О мени','معلومات عني'),(661,'Update-Profile','Update my Profile','Actualizar mi perfil','Atualizar o meu perfil','अद्यतन मेरा प्रोफ़ाइल','Mettre à jour mon profil','Упдате Ми Профиле','تحديث ملفي الشخصي'),(662,'School-Ads','Quick School Ads','Anuncios del Colegio','Anúncios escolares','स्कूल घोषणाएँ','Annonces scolaires','Школски Најаве','مدرسة الإعلانات'),(663,'Important','Important Information','Información Importante','Informação importante','महत्वपूर्ण जानकारी','informations importantes','Важне информације','معلومات هامة'),(664,'Go-to-news','Go to News','Ir a las noticias','Ir para notícias','खबर के लिए जाओ','Aller aux nouvelles','\nИди на вести','انتقل إلى أخبار'),(665,'Total','Total','Total','total','संपूर्ण','total','укупан','مجموع'),(667,'Print-Marks','Print','Imprimir','impressão','छाप','imprimer','штампа','طباعة'),(668,'Semester','Semester','Semestre','semestre','छमाही','semestre','семестар','نصف السنة'),(669,'Student','Student','Estudiante','estudante','छात्र','étudiant','ученик','طالب'),(670,'Total-Marks','Total Marks','Puntos Acumulados','pontos acumulados','उपार्जित अंक','Les points accumulés','Обрачунати бодова','نقاط مستحقة'),(671,'Select-to-continue','Select to continue','Seleccione uno para continuar','Selecione um para continuar','जारी रखने के लिए एक का चयन करें','Sélectionnez l\'une pour continuer','Изаберите једну за наставак','اختر واحدا لمواصلة'),(672,'Receiver','Receiver','Receptor','recebedor','रिसीवर','récepteur','пријемник','المتلق'),(673,'Select-User','Select user','Seleccione un usuario','Selecione um usuário','एक उपयोगकर्ता का चयन करें','Sélectionnez un utilisateur','Изаберите корисника','تحديد مستخدم'),(674,'Write-Message','Write your message','Escribe tu mensaje aquí','Faça aqui a sua mensagem','यहाँ अपना संदेश लिखें','Écrivez votre message ici','Напишите своју поруку овде','اكتب رسالتك هنا'),(675,'Reply','Reply','Responder','resposta','उत्तर','réponse','одговор','إجابة'),(685,'Enrollment-bus','Enrollment bus','Matrícula del bus','Autocarro de matrícula','ट्यूशन बस','Bus de scolarité','Школарина аутобус','حافلة الدراسية'),(686,'Driver-Name','Driver name','Nombre del Piloto','nome Pilot','नाम पायलट','Nom Pilot','ime пилот','اسم الطيار'),(687,'Driver-Phone','Driver phone','Celular','celular','सेलुलर','cellulaire','ћелијски','خلوي'),(684,'Route','Route','Ruta','rota','मार्ग','route','рута','طريق'),(707,'Save','Save','Guardar','salvar','बचाना','Garder','сачувати','حفظ'),(705,'Comment','Comment','Comentar','comentário','टिप्पणी','Commenter','коментар','تعليق'),(706,'Untitle','Untitled','Sin título ','sem título','शीर्षकहीन','Sans titre','Без','بدون عنوان'),(703,'Running','Active','Activas','ativo','सक्रिय','actif','активан','نشط'),(704,'Archiveds','Archived','Archivadas','arquivados','संग्रहीत','archivé','архивиране','أرشفة'),(709,'To-Year','Promotion to year','Año a promover','Ano para promover','वर्ष बढ़ावा देने के लिए','Année de promouvoir','Године да промовише','العام لتعزيز'),(710,'To-Class','Promotion to class','Grado a promover','Grau de promover','बढ़ावा देने के लिए डिग्री','Degré de promouvoir','Степен да промовише','درجة لتعزيز'),(711,'Code','Code','Código','código','कोड','code','код','قانون'),(712,'Priority','Priority','Prioridad','prioridade','प्राथमिकता','priorité','приоритет','أفضلية'),(713,'Month','Month','Mes','mês','महीना','mois','месец','شهر'),(714,'January','January','Enero','janeiro','जनवरी','janvier','јануар','يناير'),(715,'February','February','Febrero','fevereiro','फरवरी','février','фебруар','فبراير'),(716,'March','March','Marzo','março','मार्च','mars','март','مارس'),(717,'April','April','Abril','abril','अप्रैल','avril','април','أبريل'),(718,'May','May','Mayo','maio','मई','mai','мај','مايو'),(719,'June','June','Junio','Junho','जून','juin','јун','يونيو'),(720,'July','July','Julio','Julho','जुलाई','juillet','јул','يوليو'),(721,'August','August','Agosto','Agosto','अगस्त','août','август','أغسطس'),(722,'October','October','Octubre','outubro','अक्टूबर','octobre','октобар','أكتوبر'),(723,'November','November','Noviembre','novembro','नवंबर','novembre','новембар','تشرين الثاني'),(724,'December','December','Diciembre','dezembro','दिसंबर','décembre','децембар','ديسمبر'),(725,'September','September','Septiembre','setembro','सितंबर','septembre','септембар','سبتمبر'),(726,'Profession','Profession','Profesión','profissão','व्यवसाय','profession','професија','مهنة'),(727,'Not-Found','Not found','Sin resultados','nenhum resultado','कोई परिणाम नहीं','Aucun résultat','Нема резултата','لا يوجد نتائج'),(728,'Nick','Nickname','Nick','entalhe','छेद','entailler','ницк','شق'),(732,'Payment-Information','Payment Information','Información del cobro','Coleta de informações','सूचना संग्रह','Collecte d\'informations','prikupljanje информација','جمع المعلومات'),(731,'Information','Information','Información','informação','सूचना','information','информације','معلومات'),(737,'Promotion-Selected','Promote the selected students','Promover a los estudiantes seleccionados','Promover os alunos selecionados','चयनित छात्रों को बढ़ावा देना','Promouvoir les étudiants sélectionnés','Промовисати изабране студенте','تشجيع الطلاب الذين تم اختيارهم'),(734,'Promotion-to','Promotion to','Promover a','promover','को बढ़ावा देने के','promouvoir','унапредити','تعزيز'),(736,'Already','Already it promoted','Ya se ha promovido','Já promoveu','पहले से ही यह पदोन्नत','Déjà il a encouragé','Већ је промовисао','بالفعل روجت'),(738,'System-Name','System name','Nombre del Sistema','Name System','सिस्टम का नाम','Name System','систем Име','اسم النظام'),(739,'System-Title','System title','Título del sistema','título Sistema','शीर्षक प्रणाली','Titre système','Наслов систем','عناوين النظام'),(740,'Minium-Mark','Minimum mark','Nota minima','Nota mínima','न्यूनतम नोट','minimum Remarque','минимална Напомена','الحد الأدنى ملاحظة'),(741,'Domain','Domain name','Dominio','domínio','डोमेन','domaine','домен','Dominio'),(742,'Currency','Currency','Moneda','moeda','मुद्रा','monnaie','валута',''),(743,'Slider1','Salider 1 - 1920px - 570px','Slider 1 - 1920px - 570px','Slider 1 - 1920px - 570px','Slider 1 - 1920px - 570px','Slider 1 - 1920px - 570px','клизач 1 - 1920px - 570px','Slider 1 - 1920px - 570px'),(744,'Slider2','Salider 2 - 1920px - 570px','Slider 2 - 1920px - 570px','Slider 2 - 1920px - 570px','Slider 2 - 1920px - 570px','Slider 2 - 1920px - 570px','клизач 2 - 1920px - 570px','Slider 2 - 1920px - 570px'),(745,'Slider3','Salider 3 - 1920px - 570px','Slider 3 - 1920px - 570px','Slider 3 - 1920px - 570px','Slider 3 - 1920px - 570px','Slider 3 - 1920px - 570px','клизач 3 - 1920px - 570px','Slider 3 - 1920px - 570px'),(746,'List','List','Listado','listagem','लिस्टिंग','inscription','списак','قائمة'),(749,'By','By','Por','por','द्वारा','Par','по','بواسطة'),(748,'Salary','Salary','Salario','salário','वेतन','salaire','плата','أجرة'),(750,'Present','Present','Presente','presente','वर्तमान','présent','поклон','حاضر'),(751,'Absent','Absent','Ausente','ausente','अनुपस्थित','absent','одсутан','غائب'),(752,'Homework-Of','Homework of','Tareas de','tarefas','कार्यों','tâches','задаци','المهام'),(753,'Student-Dashboard','Student Dashboard','Tablero de Estudiante','Placa de estudante','छात्र बोर्ड','Conseil étudiant','студент одбор','مجلس الطلبة'),(754,'Your-Marks','these are your marks','estas son tus calificaciones','estas são as suas notas','ये अपने योग्यता हैं','ce sont vos qualifications','то су ти оцене','هذه هي مؤهلاتك'),(755,'My-Homework','My homework','Mis tareas','Minhas tarefas','मेरा कार्य','Mes tâches','Моји задаци','مهامي'),(756,'Teacher-Dashboard','Teacher Dashboard','Tablero de Profesores','professores Board','शिक्षक बोर्ड','Les enseignants Conseil','nastavnici одбор','مجلس المعلمين'),(757,'Students-Of','Students Of','Estudiantes de','estudantes','छात्रों','étudiants','студенти','الطلاب'),(758,'Send-Homework','Send Homework','Enviar Tareas','Enviar Tarefas','कार्य भेजें','Envoyer Tâches','Пошаљи Задаци','إرسال المهام'),(759,'Study-Material','Study Material','Material de estudio','Material de estudo','अध्ययन सामग्री','Matériaux d\'étude','Студи Материјали','دراسة المواد'),(760,'Homework','Homework','Tareas','tarefas','कार्यों','tâches','задаци','المهام'),(763,'Low','Low','Baja','cair','पड़ना','Petit','пасти','سقط'),(764,'Medium','Medium','Media','média','औसत','moyenne','просек','متوسط'),(765,'High','High','Alta','alto','उच्च','haut','висок','ارتفاع'),(766,'Why','Why report it?','¿Por qué lo reporta?','Por que denunciá-lo?','यह रिपोर्ट क्यों?','Pourquoi le signaler?','Зашто се пријавити?','لماذا الإبلاغ عنه؟'),(767,'Sents','Sent','Enviados','enviados','दूत','envoyés','изасланици','المبعوثون'),(768,'My-Marks','My Marks','Mis calificaciones','As minhas notas','मेरा ग्रेड','\nMes qualifications','Моје оцене','درجاتي'),(770,'My-Permissions','My Permissions','Mis Permisos','meus Permissão','मेरे अनुमतियां','Mes Autorisations','Моје Дозволе','بلدي ضوابط'),(771,'Create','Apply','Solicitar','pedido','प्रार्थना','Demander','захтев','طلب'),(772,'List-Perm','My permissions','Mis permisos','meus permissões','मेरे अनुमतियों','mes permissions','ми дозволе','أذونات بلدي'),(822,'News-Only','','Noticias para profesores','Notícias para professores','शिक्षकों के लिए समाचार','Nouvelles pour les enseignants','Вести за наставнике','أخبار للمعلمين'),(775,'End_Date','Until','Hasta','para cima','ऊपर','en haut','горе','فوق'),(776,'Start_Date','From','Desde','de','से','Despuis','од','من'),(779,'Pending','Pending','Pendiente','pendente','अपूर्ण','en attendant','нерешен','ريثما'),(778,'Rejected','Rejected','Rechazada','rejeitados','गिरावट आई','diminué','опао','رفض'),(821,'Notice-Sent','News sent to teachers','Noticias enviadas a los profesores','Notícia enviada para professores','समाचार शिक्षकों को भेजा','Nouvelles envoyé aux enseignants','Новости послати наставнике','أرسلت الخبر إلى المعلمين'),(780,'My-Request','My applications','Mis solicitudes','minhas aplicações','मेरे अनुप्रयोगों','Mes applications','Моје пријаве','طلباتي'),(823,'Student-Bulk','Massive students','Estudiantes Masivos','estudantes maciças','बड़े पैमाने पर छात्रों','étudiants Massive','Массиве студенти','طلاب هائل'),(872,'Quick-ad','Send Quick Ads','Enviar Anuncios Rápidos','Enviar anúncios rápidos','भेजें त्वरित टॉप','Envoyer Annonces rapides','Сенд Брзи Огласи','إرسال إعلانات السريع'),(873,'Language','Language','Idioma','idioma','भाषा','Langue','језик','لغة'),(790,'Lists-Perms','Applications for permits','Solicitudes de permisos','Pedidos de licenças','परमिट के लिए आवेदन','Les demandes de permis','Захтев за издавање дозволе','طلبات الحصول على تصاريح'),(796,'Reject','Refuse','Rechazar','rejeitar','अस्वीकार','rejeter','одбити','رفض'),(797,'Accept','Accept','Aceptar','aceitar','स्वीकार करना','Accepter','прихватити','استعرض'),(811,'No_Options','No options','Sin opciones','não há opções','कोई विकल्प','Pas d\'options','Но оптионс','لا توجد خيارات'),(815,'Nice','Approved','Aprobada','aprovado','अनुमोदित','approuvé','одобрен','وافق'),(820,'Teacher-News','Send news Professors only','Enviar noticia solo a Profesores','Enviar somente Professores de notícias','केवल समाचार प्रोफेसर भेजें','Envoyer uniquement les professeurs de presse','Послати само вести Професори','إرسال أساتذة الأخبار فقط'),(838,'add_a_row','Add more','Agregar más','Adicionar mais','जोड़े','Ajouter plus','Додај више','إضافة المزيد'),(876,'you-have-until','Youi have until','Tienes hasta','você tem até','आप जब तक है','vous avez jusqu\'au','имате до','لديك حتى'),(877,'to-deliver-this-task','to deliver this task.','para entregar esta tarea','para entregar esta tarefa','इस कार्य को वितरित करने के लिए','pour fournir cette tâche','да испоручи овог задатка','لتقديم هذه المهمة'),(878,'Review-File','Your file will be sent for review.','Tu archivo será enviado para su revisión','Seu arquivo será enviado para revisão','आपकी फ़ाइल समीक्षा के लिए भेजा जाएगा','Votre dossier sera envoyé pour examen','Ваша датотека ће бити послат на преглед','سيتم إرسال ملف للمراجعة'),(879,'on-time','On time','A tiempo','A tempo','एक समय','À temps','vreme','زمن'),(880,'delayed','Delayed','Retrasada','atrasado','विलंबित','différé','одложен','مؤجل'),(881,'sent-for-review','Sent for review','Enviada para su revisión','Enviado para revisão','समीक्षा के लिए भेजा','Envoyés pour examen','Упућени на преглед','أرسلت للمراجعة'),(882,'deliver','Deliver','Entregar','entregar','उद्धार','livrer','доставити','نقل'),(883,'Last-day-delivery','Last day delivery','Último día de entrega','A entrega do último dia','अंतिम दिन वितरण','Livraison Dernier jour','Последњи дан испоруке','آخر يوم تسليم'),(884,'Files','Deliveries','Entregas','entregas','प्रसव','livraisons','испоруке','التسليم'),(885,'Homework-Sent','Sent','Enviadas','você enviou','आप भेजा','Vous avez envoyé','сте послали','قمت بإرسالها'),(2176,'Payments','Create Payment','Crear nuevo pago','Criar novo pagamento','नई भुगतान बनाएं','Créer un nouveau paiement','Створити нову уплату','خلق دفعة جديدة'),(2098,'Average','Average','Promedio ','média','औसत','moyenne','просек','متوسط'),(2080,'Generate','Generate Sheet','Generar cuadros','gerar imagens','चित्रों उत्पन्न','générer des images','генерисање слике','توليد الصور'),(2074,'Tabulation','Tabulation Sheet','Cuadros','imagens','चित्रों','photos','слике','الصور'),(2073,'Comments','Comment','Comentario','comentário','टिप्पणी','commentaire','коментар','تعليق'),(2071,'Sections','Sections','Secciones','seções','वर्गों','sections','профили','الأقسام'),(1904,'Discussion','Discussions','Discusiones  ','discussões','विचार-विमर्श','discussions','дискусије','مناقشات'),(2068,'FinalExam','Exam','Examen','exame','परीक्षा','exam','испит','امتحان'),(2066,'Update-Information','Update Profile','Actualizar perfil','atualizar','अद्यतन','mettre à jour','ажурирање','تحديث'),(2065,'No','No','No','não','नहीं','pas','не','ليس'),(2064,'Yes','Yes','Si','se','यदि','si','ако','إذا'),(2063,'This-Month','This month is her birthday','Este mes es su cumpleaños','Este mês é seu aniversário','इस महीने अपने जन्मदिन है','Ce mois-ci est votre anniversaire','Овог месеца је ваш рођендан','هذا الشهر هو عيد ميلادك'),(2059,'Class-Assigned','Assigned Class','Salón Asignado','alocados Salão','आवंटित हॉल','Numéroté Salle','издвојила сала','قاعة المخصصة'),(2060,'Excellent','\nExcellent Student','Alumno Excelente','excelente aluno','उत्कृष्ट छात्र','Excellente élève','одличан ученик','طالب ممتاز'),(2026,'Academic-Settings','Academic Settings','Ajustes Académicos','ambientes acadêmicos','शैक्षिक सेटिंग्स','paramètres académiques','Ацадемиц подешавања','إعدادات الأكاديمية'),(2016,'Type','Type','Tipo','tipo','टाइप','Type','тип','نوع'),(2017,'From','From','Desde','de','से','Despuis','од','من'),(2018,'To','To','Hasta','para cima','ऊपर','en haut','горе','فوق'),(2062,'Last-News','Last News','Noticias recientes','Notícias recentes','हाल ही में खबर','Nouvelles récentes','nedavno Новости','الأخبار الأخيرة'),(2019,'Main','Navigation','Menu','menu','मेन्यू','menu','мени','قائمة الطعام'),(2021,'Students-Information','Information','Información','informação','सूचना','information','информације','معلومات'),(2022,'Users-Account','Users','Usuarios','usuários','उपयोगकर्ताओं','utilisateurs','\nкорисници','المستخدمين'),(2023,'ManageClassrooms','Classrooms','Salones de Clase','Salas de aula','कक्षाओं','Les salles de classe','učionice','الفصول الدراسية'),(2024,'SemesterContent','Contents','Contenidos','conteúdo','अंतर्वस्तु','contenu','садржај','محتويات'),(2025,'Settings','Settings','Ajustes','configurações','सेटिंग्स','réglages','podešavanja','إعدادات'),(2027,'Library','Library','Librería','livraria','किताबों की दुकान','librairie','књижара','مكتبة'),(2028,'StudentsReports','Students Reports','Estudiantes','estudantes','छात्रों','étudiants','студенти','الطلاب'),(2029,'TeacherReports','Teachers Reports','Profesores','professores','शिक्षकों','enseignants','наставници','معلمون'),(2030,'SchoolReports','School Reports','Reportes Escolares','relatórios escolares','स्कूल की रिपोर्ट','les bulletins scolaires','Школски извештаји','التقارير المدرسية'),(2031,'TeachersFiles','Teachers Files','Archivos Profesores','arquivos de professores','शिक्षक फ़ाइलें','fichiers enseignants','Наставници фајлова','ملفات المعلمين'),(2032,'ListsPerms','Permissions','Permisos','permissões','अनुमतियों','autorisations','дозволе','أذونات'),(2033,'StaticPages','Statics Pages','Páginas estáticas','páginas estáticas','स्थैतिक पृष्ठों','pages statiques','статичке странице','صفحات ثابتة'),(2034,'ManagePages','Manage Pages','Administrar Páginas','gerenciar páginas','पेज का प्रबंधन','gérer Pages','управљати Пагес','إدارة الصفحات'),(2035,'NewPage','New Page','Agregar nueva','Adicionar nova','नए जोड़े','Ajouter un nouveau','Додај нови','إضافة جديدة'),(2036,'Pages','Pages','Páginas','páginas','पृष्ठों','pages','страница','الصفحات'),(2037,'PersonalInfo','Personal Information','Información Personal','Informação pessoal','व्यक्तिगत जानकारी','Information personnelle','Лични подаци','المعلومات الشخصية'),(2038,'UpdateProfile','Update Information','Actualizar Información','actualização da informação','जानकारी अद्यतन करें','mise à jour de l\'information','informacije ажурирање','تحديث المعلومات'),(2039,'Picture','Photo','Fotografía','fotografia','फोटोग्राफी','photographie','фотографија','تصوير'),(2058,'Registered','Registered Since','Registrado desde','registrado desde','के बाद से पंजीकृत','enregistré depuis','регистрован од','مسجل منذ'),(2057,'Student-Portal','Student Portal','Portal de Estudiantes','Portal do aluno','छात्र पोर्टल','Portail étudiant','студент портал','بوابة الطالب'),(2056,'Add-Student','Add Student','Agregar Estudiante','Adicionar Student','छात्र जोड़े','Ajouter étudiant','Додај Студент','إضافة طالب'),(2240,'Single','Single Payment','Pago único','de pagamento único','एकल भुगतान','paiement unique','једнократно','دفعة واحدة'),(2305,'Invoice','Invoice Details','Detalles de la Factura','Detalhes da fatura','चालान विवरण','Détails facture','Детаљи рачуна','تفاصيل الفاتورة'),(2338,'PaymentInfo','Payment Information','Información del pago','Informação de pagamento','भुगतान जानकारी','Conditions de vente','informacije о плаћању','معلومات الدفع'),(2356,'Payment','Payment','Cantidad','quantidade','मात्रा','quantité','количина','كمية'),(2357,'PaymentAmount','Payment Amount','Cantidad del pago','Valor do pagamento','भुगतान राशि','Montant du paiement','Износ за плаћање','دفع المبلغ'),(2525,'Student-Payment','Student Payment','Pagos de estudiantes','Pagamentos estudantes','भुगतान के छात्रों','Étudiants Paiements','Исплате студенти','دفعات الطلبة'),(2526,'Payment','Payment','Cantidad','pagamento','मात्रा','quantité','количина','كمية'),(2527,'Paid','Paid','Pagado','pago','भुगतान','payé','плаћен','مدفوع'),(2528,'Unpaid','Unpaid','Sin pagar','sem pagar','भुगतान के बिना','Sans payer','без плаћања','دون دفع'),(2652,'StudentPayment','Student Payment','Pagos de estudiantes','Pagamentos estudantes','भुगतान के छात्रों','Étudiants Paiements','Исплате студенти','دفعات الطلبة'),(2653,'invoices','Invoices','Facturas','facturas','चालान','factures','фактуре','الفواتير'),(2654,'payment_history','Payment History','Historial de pagos','Histórico de pagamentos','भुगतान इतिहास','Historique des paiements','Историја плаћање','تاريخ الدفع'),(3588,'Paypal-Email','PayPal Email','Correo PayPal','E PayPal','ई पेपैल','E PayPal','Е ПаиПал','E باي بال'),(3595,'Price','Price','Precio','preço','कीमत','prix','цена','السعر'),(3607,'Price','Price','Precio','preço','कीमत','prix','цена','السعر'),(3609,'Price','Price','Precio','preço','कीमत','prix','цена','السعر'),(3644,'MarksLimit','Date limit to upload marks','Fecha límite para subir calificaciones','Prazo para carregar pontuações','स्कोर को अपलोड करने की समय सीमा','Date limite pour télécharger les partitions','Рок за отпремање резултате','الموعد النهائي لتحميل عشرات'),(3645,'Rating','Allow students to report to teachers?','¿Permitir reportes para profesores?','Permitir relatórios para os professores?','शिक्षकों के लिए रिपोर्ट की अनुमति दें?','Autoriser les rapports pour les enseignants?','Дозволите извештаје за наставнике?','السماح تقارير للمعلمين؟'),(3646,'MiniMark','Minimum mark to pass a course','Nota mínima para aprobar un curso','nota mínima para passar por um curso','न्यूनतम ग्रेड एक कोर्स पास करने के लिए','note minimale de passer un cours','минимална оцена да прође курс','الحد الأدنى درجة لتمرير دورة'),(3647,'AverageMin','Minimum average for outstanding student','Promedio mínimo para estudiante destacado','estudante excepcional média mínima','न्यूनतम औसत बकाया छात्र','étudiant exceptionnel en moyenne minimum','Минимални просечни изузетан ученик','متوسط الحد الأدنى الطالب المتميز'),(3648,'TeacherAverage','Allow teachers to check the tabulation?','¿Permitir a los profesores consultar los cuadros?','Permitir aos professores para ver as fotos?','शिक्षकों तस्वीरें देखने के लिए अनुमति दें?','Permettre aux enseignants de voir les images?','Омогуће наставницима да видимо слике?','تمكين المدرسين من رؤية الصور؟'),(3653,'ClassForum','Class Forum','Foro de clases','Fórum classe','कक्षा फोरम','classe Forum','цласс форум','المنتدى الدرجة'),(3654,'CreatePost','Create Post','Publicar','publicar','प्रकाशित करना','publier','објавити','نشر'),(3686,'Parents-Dashboard','Parents Dashboard','Tablero de padres','Os pais Board','माता-पिता को बोर्ड','Conseil parents','roditelji одбор','مجلس أولياء الأمور'),(3699,'Students-Dashboard','Student Dashboard','Tablero de Estudiante','Placa de estudante','छात्र बोर्ड','Conseil étudiant','студент одбор','مجلس الطلبة'),(3894,'Print','Print','Imprimir','impressão','छाप','imprimer','штампа','طباعة'),(3865,'Gallery','Media Gallery','Multimedia','multimídia','मल्टीमीडिया','multimédia','мултимедијални','الوسائط المتعددة'),(3866,'GalleryCat','Gallery Category','Categorías','Categorias','श्रेणियाँ','Catégories','Категорије','الفئات'),(3867,'GalleryPic','Gallery','Galería','galeria','गैलरी','galerie','галерија','رواق'),(3868,'VideoGallery','Video Gallery','Videos','vídeos','वीडियो','Vidéos','Видео','فيديو'),(3889,'Unavailab','Unavailable','No disponible','Não disponível','उपलब्ध नहीं','Non disponible','није доступно','غير متوفرة'),(3871,'embedid','URL embed','URL embed','URL embed','ट्वीट यूआरएल','URL d\'intégration','УРЛ за уграђивање','URL ضمن'),(3872,'Skin','Skin Colour','Estilo','estilo','शैली','style','стил','أسلوب'),(3873,'White','White','Blanco','branco','\nसफेद','Blanc','бео','أبيض'),(3874,'Upload-Video','Add Video','Agregar Video','Adicionar vídeo','वीडियो जोड़ें','Ajouter la vidéo','Адд Видео','إضافة فيديو'),(3886,'Availab','Available','Disponible','disponível','उपलब्ध','disponible','доступан','متاح'),(3883,'Author','Author','Autor','autor','लेखक','auteur','аутор','مؤلف'),(3930,'TeacherRequest','Teacher Permits','Permisos de Profesores','professores licenças','शिक्षक परमिट','enseignants permis','Наставници дозволе','تصاريح المعلمين'),(3931,'StudentRequest','Student Permits','Permisos de Estudiantes','Visto de estudante','छात्र परमिट','Le permis d\'études','Студент дозволе','تصاريح طالب'),(3932,'Late','I\'m late','Llegó tarde','Estou atrasado','यह देर हो चुकी थी','Je suis en retard','Било је касно','أنا في وقت متأخر'),(3933,'Allowed','Allow to change marks more than twice?','¿Permitir cambiar calificaciones más de dos veces?',NULL,NULL,NULL,NULL,'السماح عشرات تغير أكثر من مرتين؟'),(3934,'homework','','',NULL,NULL,NULL,NULL,''),(3935,'Available','','',NULL,NULL,NULL,NULL,''),(3936,'Unavailable','','',NULL,NULL,NULL,NULL,''),(3937,'class','','',NULL,NULL,NULL,NULL,''),(3938,'students','','',NULL,NULL,NULL,NULL,''),(3939,'Senasdadadd','','',NULL,NULL,NULL,NULL,''),(3940,'Sfffend','','',NULL,NULL,NULL,NULL,''),(3941,'asdadadsd','','',NULL,NULL,NULL,NULL,''),(3942,'Input Grade','','',NULL,NULL,NULL,NULL,''),(3943,'Input-Grades','','',NULL,NULL,NULL,NULL,''),(3944,'Grades','','',NULL,NULL,NULL,NULL,''),(3945,'Manage Grades','','',NULL,NULL,NULL,NULL,''),(3946,'Student-Grade','','',NULL,NULL,NULL,NULL,''),(3947,'Manage Attendance','','',NULL,NULL,NULL,NULL,''),(3948,'Manage Grade','','',NULL,NULL,NULL,NULL,''),(3949,'Grade','','',NULL,NULL,NULL,NULL,''),(3950,'WEW','','',NULL,NULL,NULL,NULL,''),(3951,'wwwww','','',NULL,NULL,NULL,NULL,''),(3952,'Specific Grade','','',NULL,NULL,NULL,NULL,''),(3953,'Comments (optional)','','',NULL,NULL,NULL,NULL,''),(3954,'Assigned-Teacher','','',NULL,NULL,NULL,NULL,''),(3955,'Room','','',NULL,NULL,NULL,NULL,''),(3956,'Voting','','',NULL,NULL,NULL,NULL,''),(3957,'Regular','','',NULL,NULL,NULL,NULL,''),(3958,'Irregular','','',NULL,NULL,NULL,NULL,''),(3959,'Select-Status','','',NULL,NULL,NULL,NULL,''),(3960,'View Grades','','',NULL,NULL,NULL,NULL,''),(3961,'View My Grades','','',NULL,NULL,NULL,NULL,''),(3962,'Specific-Grade','','',NULL,NULL,NULL,NULL,''),(3963,'Register Candidate','','',NULL,NULL,NULL,NULL,''),(3964,'Position','','',NULL,NULL,NULL,NULL,''),(3965,'Register','','',NULL,NULL,NULL,NULL,''),(3966,'President','','',NULL,NULL,NULL,NULL,''),(3967,'Vice President','','',NULL,NULL,NULL,NULL,''),(3968,'Secretary','','',NULL,NULL,NULL,NULL,''),(3969,'Auditor','','',NULL,NULL,NULL,NULL,''),(3970,'Treasurer','','',NULL,NULL,NULL,NULL,''),(3971,'Sgt & Arms','','',NULL,NULL,NULL,NULL,''),(3972,'Muse','','',NULL,NULL,NULL,NULL,''),(3973,'Escort','','',NULL,NULL,NULL,NULL,''),(3974,'Vote','','',NULL,NULL,NULL,NULL,''),(3975,'vote unavailable','','',NULL,NULL,NULL,NULL,''),(3976,'Winner of the year','','',NULL,NULL,NULL,NULL,''),(3977,'Advertise Message','','',NULL,NULL,NULL,NULL,''),(3978,'Losgo','','',NULL,NULL,NULL,NULL,''),(3979,'Advertise-Image','','',NULL,NULL,NULL,NULL,''),(3980,'Vote Result','','',NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mark` (
  `mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark_obtained` int(11) NOT NULL DEFAULT 0,
  `mark_total` int(11) NOT NULL DEFAULT 100,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `labuno` int(11) NOT NULL DEFAULT 0,
  `labdos` int(11) NOT NULL DEFAULT 0,
  `labtres` int(11) NOT NULL DEFAULT 0,
  `labcuatro` int(11) NOT NULL DEFAULT 0,
  `labcinco` int(11) NOT NULL DEFAULT 0,
  `labseis` int(11) NOT NULL DEFAULT 0,
  `labsiete` int(11) NOT NULL DEFAULT 0,
  `labocho` int(11) NOT NULL DEFAULT 0,
  `labnueve` int(11) NOT NULL DEFAULT 0,
  `labtotal` int(11) NOT NULL DEFAULT 0,
  `final` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,4,1,1,2,12,10,100,'','2019-2020',110,10,10,10,10,10,10,10,10,200,0);
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje_reporte`
--

DROP TABLE IF EXISTS `mensaje_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje_reporte` (
  `news_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `news_id` int(11) NOT NULL,
  `date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`news_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_reporte`
--

LOCK TABLES `mensaje_reporte` WRITE;
/*!40000 ALTER TABLE `mensaje_reporte` DISABLE KEYS */;
INSERT INTO `mensaje_reporte` VALUES (1,'fffff',44,'07 Jan 2020','student',2,''),(2,'haysss',44,'07 Jan 2020','teacher',27,''),(3,'oks\r\n',45,'01 Mar 2020','student',24,'');
/*!40000 ALTER TABLE `mensaje_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_thread`
--

DROP TABLE IF EXISTS `message_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`message_thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_thread`
--

LOCK TABLES `message_thread` WRITE;
/*!40000 ALTER TABLE `message_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `news_status` int(11) NOT NULL DEFAULT 1 COMMENT '1 for running, 0 for archived',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (44,'6ab0d1c62e','Voting system','Voting System',1),(45,'b19997406b','No classes','NEWS',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_teacher`
--

DROP TABLE IF EXISTS `news_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_teacher` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notice_status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_teacher`
--

LOCK TABLES `news_teacher` WRITE;
/*!40000 ALTER TABLE `news_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_message`
--

DROP TABLE IF EXISTS `notice_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_message` (
  `notice_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notice_id` int(11) NOT NULL,
  `date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_file_name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`notice_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_message`
--

LOCK TABLES `notice_message` WRITE;
/*!40000 ALTER TABLE `notice_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profession` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (33,'maricel isagani','maricel@gmail.com','maricel','09090909090','Jose Panganiban C.N.','','maricel'),(31,'noel','noel@gmail.com','cancer','099099897','manila','','noel'),(32,'Teresa','teresa@gmail.com','teresa','0999998444','Jose Panganiban C.N.','','Teresa');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poa`
--

DROP TABLE IF EXISTS `poa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poa` (
  `id_poa` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre_archivo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipo_archivo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_poa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poa`
--

LOCK TABLES `poa` WRITE;
/*!40000 ALTER TABLE `poa` DISABLE KEYS */;
/*!40000 ALTER TABLE `poa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `question` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optiona` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optionb` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optionc` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `optiond` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correctanswer` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `marks` int(11) NOT NULL,
  `exam_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_alumnos`
--

DROP TABLE IF EXISTS `reporte_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte_alumnos` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `report_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `priority` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_alumnos`
--

LOCK TABLES `reporte_alumnos` WRITE;
/*!40000 ALTER TABLE `reporte_alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_mensaje`
--

DROP TABLE IF EXISTS `reporte_mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte_mensaje` (
  `report_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sender_type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`report_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_mensaje`
--

LOCK TABLES `reporte_mensaje` WRITE;
/*!40000 ALTER TABLE `reporte_mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte_mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `start_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `end_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = accepted, 2 = rejected',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (7,'IT11',4,37),(8,'IT61',6,36),(9,'A11',7,37),(10,'A31',8,37),(11,'IT31',5,33),(12,'IT51',6,35),(13,'A41',5,34);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'system_name','ProSMS'),(2,'system_title','School Management System'),(3,'address','Jose Panganiban C.N.'),(4,'phone','090909090'),(5,'paypal_email',''),(6,'currency','Php'),(7,'system_email','admin@admin.comdddd'),(20,'rtl',''),(11,'language','english'),(13,'minimark','50'),(15,'ad','ff'),(16,'skin_colour','danger'),(18,'domain','google.com'),(21,'running_year','2020-2021'),(22,'facebook_url','https://www.facebook.com/'),(23,'twitter_url','https://www.twitter.com/'),(24,'google_url','https://www.google.com/'),(25,'instagram_url','https://instagram.com/'),(26,'linkedin_url','https://www.linkedin.com/'),(27,'pinterest_url','https://pinterest.com/'),(28,'dribbble_url','https://dribbble.com/'),(29,'youtube_url','https://youtube.com/'),(30,'advertise','testing'),(31,'ads_switch','1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `dormitory_id` int(11) DEFAULT NULL,
  `transport_id` int(11) DEFAULT NULL,
  `student_session` int(11) NOT NULL DEFAULT 1,
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  `aditional_subjects_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `board` int(11) NOT NULL DEFAULT 0,
  `student_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (23,'yu','29-12-1995','male','Daet C.N.','123','ruzzel@gmail.com','yu',33,NULL,NULL,1,'yu','','1583090400',0,'',NULL),(24,'Patricia Kaye S. Cabrera','29-12-1995','female','Jose Panganiban C.N.','123','patricia@gmail.com','patricia',32,NULL,NULL,1,'patricia','','1583090400',0,'',NULL),(25,'John Ruzzel Fraile','18-03-1996','male','Daet C.N.','09090909090','ruzzel@gmail.com','ruzzel',31,NULL,NULL,1,'ruzzel','','1583090400',0,'',NULL),(26,'Karen Joy Gonzales','25-03-1992','female','Labo C.N.','09090909090','karen@gmail.com','karen',33,NULL,NULL,1,'karen','','1583090400',0,'',NULL),(27,'Mary Joy Tolosa','26-02-1995','female','Labo C.N.','08797656','joy@yahoo.com','joy',32,NULL,NULL,1,'joy','','1583090400',0,'',NULL),(28,'Russel Abarca','27-03-1996','male','Daet C.N.','08956757','russel@gmail.com','russel',31,NULL,NULL,1,'russel','','1583090400',0,'',NULL),(29,'Richard Morales','18-03-1992','male','Jose Panganiban C.N.','08797656','richard@gmail.com','richard',33,NULL,NULL,1,'richard','','1583090400',0,'',NULL),(31,'Joyce Jimenez','04-02-2020','female','Daet C.N.','08909897867','joyce@yahoo.com','joyce',31,NULL,NULL,1,'joycebell','','1583090400',0,'',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_exam`
--

DROP TABLE IF EXISTS `student_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `correctlyanswered` int(11) NOT NULL DEFAULT 0,
  `status` enum('completed','inprogress') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_exam`
--

LOCK TABLES `student_exam` WRITE;
/*!40000 ALTER TABLE `student_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_irregular_selected_subject`
--

DROP TABLE IF EXISTS `student_irregular_selected_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_irregular_selected_subject` (
  `selected_subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `selected_subject_concat_id` longtext NOT NULL,
  PRIMARY KEY (`selected_subject_id`),
  FULLTEXT KEY `selected_subject_concat_id` (`selected_subject_concat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_irregular_selected_subject`
--

LOCK TABLES `student_irregular_selected_subject` WRITE;
/*!40000 ALTER TABLE `student_irregular_selected_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_irregular_selected_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_request`
--

DROP TABLE IF EXISTS `students_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `start_date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `end_date` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_request`
--

LOCK TABLES `students_request` WRITE;
/*!40000 ALTER TABLE `students_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `la1` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la2` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la3` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la4` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la5` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la6` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la7` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la8` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la9` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `la10` longtext CHARACTER SET utf16 COLLATE utf16_unicode_ci DEFAULT NULL,
  `final` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (7,'Major Elective 3',6,35,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Life and Works of Jose Rizal',6,37,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Art Man',6,36,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Capstone',6,33,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Free Elective 1',6,33,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'Data communication',6,34,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Filipino',4,37,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'English',7,36,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'SAD',8,33,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'ME1',6,35,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Soft. Eng.',6,34,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'D.B.M.S 1',8,34,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'C ++',8,35,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'P.E. 1',7,36,'2020-2021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birthday` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `salary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (33,'Ronalyn Baraquiel','04-02-2020','female','Daet C.N.','0999999999','ronalyn@gmail.com','ronalyn','','Ronalyn'),(34,'Albert Gareza','29-12-1995','male','Daet C.N.','09090909090','albert@gmail.com','albert','','albert'),(35,'Gerry Lopez','28-12-1995','male','Daet C.N.','09980284165','gerry@gmail.com','gerry','','gerry'),(36,'Jeffrey Purcincula',NULL,'male','Daet C.N.','09090909090','jeff@yahoo.com','jeff','','jeff'),(37,'Jherson Paguirigan',NULL,'male','Daet C.N.','09090909090','jherson@gmail.com','jherson','','jherson');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_message`
--

DROP TABLE IF EXISTS `ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_message` (
  `ticket_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ticket_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_message`
--

LOCK TABLES `ticket_message` WRITE;
/*!40000 ALTER TABLE `ticket_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voting_position`
--

DROP TABLE IF EXISTS `voting_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voting_position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voting_position`
--

LOCK TABLES `voting_position` WRITE;
/*!40000 ALTER TABLE `voting_position` DISABLE KEYS */;
INSERT INTO `voting_position` VALUES (0,'President'),(1,'Vice President'),(2,'Secretary'),(3,'Auditor'),(4,'Treasurer'),(5,'Sgt & Arms'),(6,'Muse'),(7,'Escort');
/*!40000 ALTER TABLE `voting_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voting_process`
--

DROP TABLE IF EXISTS `voting_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voting_process` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_student_id` int(11) NOT NULL,
  `student_voter_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `year` longtext NOT NULL,
  PRIMARY KEY (`candidate_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `voting_process_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `voting_position` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voting_process`
--

LOCK TABLES `voting_process` WRITE;
/*!40000 ALTER TABLE `voting_process` DISABLE KEYS */;
INSERT INTO `voting_process` VALUES (1,25,28,0,'2020-2021'),(2,24,28,1,'2020-2021'),(3,26,28,2,'2020-2021'),(4,27,28,6,'2020-2021'),(5,28,28,7,'2020-2021'),(6,29,31,0,'2020-2021'),(7,31,31,1,'2020-2021'),(8,25,24,0,'2020-2021'),(9,24,24,1,'2020-2021'),(10,26,24,2,'2020-2021'),(11,27,24,6,'2020-2021'),(12,28,24,7,'2020-2021');
/*!40000 ALTER TABLE `voting_process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-01 18:14:10
