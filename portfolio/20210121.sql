-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `grp_article_b`
--

DROP TABLE IF EXISTS `grp_article_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_article_b` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileURL` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_article_b`
--

LOCK TABLES `grp_article_b` WRITE;
/*!40000 ALTER TABLE `grp_article_b` DISABLE KEYS */;
INSERT INTO `grp_article_b` VALUES (1,'Y','234','관리자',NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grp_article_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_article_management`
--

DROP TABLE IF EXISTS `grp_article_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_article_management` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileURL` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_article_management`
--

LOCK TABLES `grp_article_management` WRITE;
/*!40000 ALTER TABLE `grp_article_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_article_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_article_notice`
--

DROP TABLE IF EXISTS `grp_article_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_article_notice` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileURL` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_article_notice`
--

LOCK TABLES `grp_article_notice` WRITE;
/*!40000 ALTER TABLE `grp_article_notice` DISABLE KEYS */;
INSERT INTO `grp_article_notice` VALUES (1,'N','게시글&nbsp;작성&nbsp;테스트','관리자','게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트\r<br />게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트\r<br />게시글 작성 테스트\r<br />\r<br />\r<br />\r<br />게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트\r<br />게시글 작성 테스트게시글 작성 테스트게시글 작성 테스트','2021-01-20 16:59:34',47,NULL,NULL,NULL,1,0,0),(3,'Y','게시글&nbsp;ㅇ','관리자ㅇㅇ','&lt;p>ㅇㅇ&lt;/p>\r<br />','2021-01-20 17:55:55',2,NULL,NULL,NULL,3,0,0),(4,'N','일반게시','일반인','&lt;p>11&lt;/p>\r<br />','2021-01-20 17:56:16',1,NULL,NULL,NULL,4,0,0),(7,'Y','공지사항&nbsp;전용&nbsp;게시판입니다.','관리자','&lt;p>공지 내용만 작성&lt;/p>\r<br />','2021-01-21 14:39:45',0,NULL,NULL,NULL,5,0,0);
/*!40000 ALTER TABLE `grp_article_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_article_secretary`
--

DROP TABLE IF EXISTS `grp_article_secretary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_article_secretary` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileURL` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_article_secretary`
--

LOCK TABLES `grp_article_secretary` WRITE;
/*!40000 ALTER TABLE `grp_article_secretary` DISABLE KEYS */;
INSERT INTO `grp_article_secretary` VALUES (1,'N','게시글&nbsp;접근&nbsp;권한&nbsp;테스트','관리자','&lt;p>접근가능?&lt;/p>\r<br />','2021-01-21 11:59:40',3,NULL,NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `grp_article_secretary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_article_test`
--

DROP TABLE IF EXISTS `grp_article_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_article_test` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileURL` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_article_test`
--

LOCK TABLES `grp_article_test` WRITE;
/*!40000 ALTER TABLE `grp_article_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_article_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_article_가`
--

DROP TABLE IF EXISTS `grp_article_가`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_article_가` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileURL` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_article_가`
--

LOCK TABLES `grp_article_가` WRITE;
/*!40000 ALTER TABLE `grp_article_가` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_article_가` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_board`
--

DROP TABLE IF EXISTS `grp_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_board` (
  `boardid` int NOT NULL AUTO_INCREMENT,
  `boardGroup` varchar(20) NOT NULL,
  `boardCode` varchar(20) NOT NULL,
  `boardColor` varchar(20) NOT NULL,
  `boardMaker` varchar(20) NOT NULL,
  `boardTitle` varchar(255) NOT NULL,
  `boardRead` char(1) DEFAULT '0',
  `boardWrite` char(1) DEFAULT '0',
  `boardReply` char(1) DEFAULT '0',
  `boardDownload` char(1) DEFAULT '0',
  `boardType` char(1) DEFAULT '1',
  `boardRegdate` date DEFAULT NULL,
  PRIMARY KEY (`boardid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_board`
--

LOCK TABLES `grp_board` WRITE;
/*!40000 ALTER TABLE `grp_board` DISABLE KEYS */;
INSERT INTO `grp_board` VALUES (43,'600','NOTICE','#FE5E71','관리자','공지사항 게시판','2','2','2','2','1','2021-01-20'),(44,'600','SECRETARY','#FE5E71','관리자','비서실 게시판','2','2','2','2','1','2021-01-21'),(45,'100','MANAGEMENT','#6F809A','관리자','관리부 게시판','2','2','2','2','1','2021-01-21');
/*!40000 ALTER TABLE `grp_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_buseo`
--

DROP TABLE IF EXISTS `grp_buseo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_buseo` (
  `buseo_id` varchar(5) DEFAULT NULL,
  `buseo_name` varchar(50) DEFAULT NULL,
  `buseo_grp` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_buseo`
--

LOCK TABLES `grp_buseo` WRITE;
/*!40000 ALTER TABLE `grp_buseo` DISABLE KEYS */;
INSERT INTO `grp_buseo` VALUES ('100','관리부','1'),('101','관리과','1'),('200','기획부','2'),('300','인사부','3'),('301','인사과','3'),('302','총무과','3'),('400','영업부','4'),('500','생산부','5'),('600','비서실','6');
/*!40000 ALTER TABLE `grp_buseo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_comment_b`
--

DROP TABLE IF EXISTS `grp_comment_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_comment_b` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_comment_b`
--

LOCK TABLES `grp_comment_b` WRITE;
/*!40000 ALTER TABLE `grp_comment_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_comment_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_comment_management`
--

DROP TABLE IF EXISTS `grp_comment_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_comment_management` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_comment_management`
--

LOCK TABLES `grp_comment_management` WRITE;
/*!40000 ALTER TABLE `grp_comment_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_comment_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_comment_notice`
--

DROP TABLE IF EXISTS `grp_comment_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_comment_notice` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_comment_notice`
--

LOCK TABLES `grp_comment_notice` WRITE;
/*!40000 ALTER TABLE `grp_comment_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_comment_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_comment_secretary`
--

DROP TABLE IF EXISTS `grp_comment_secretary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_comment_secretary` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_comment_secretary`
--

LOCK TABLES `grp_comment_secretary` WRITE;
/*!40000 ALTER TABLE `grp_comment_secretary` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_comment_secretary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_comment_test`
--

DROP TABLE IF EXISTS `grp_comment_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_comment_test` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_comment_test`
--

LOCK TABLES `grp_comment_test` WRITE;
/*!40000 ALTER TABLE `grp_comment_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_comment_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_comment_가`
--

DROP TABLE IF EXISTS `grp_comment_가`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_comment_가` (
  `commentid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_comment_가`
--

LOCK TABLES `grp_comment_가` WRITE;
/*!40000 ALTER TABLE `grp_comment_가` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp_comment_가` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_company`
--

DROP TABLE IF EXISTS `grp_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_company` (
  `comName` varchar(100) DEFAULT NULL,
  `comSubName` varchar(100) DEFAULT NULL,
  `comCEO` varchar(10) DEFAULT NULL,
  `comTel` varchar(15) DEFAULT NULL,
  `comURL` varchar(100) DEFAULT NULL,
  `comCopy` varchar(300) DEFAULT NULL,
  `comAuth` int DEFAULT '2',
  `comAddress` varchar(100) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_company`
--

LOCK TABLES `grp_company` WRITE;
/*!40000 ALTER TABLE `grp_company` DISABLE KEYS */;
INSERT INTO `grp_company` VALUES ('Portfolio','PF','홍길동','000-0000-0000','https://grp.portfolio.co.kr','COPYRIGHT 2021.jun, All right reserved.',2,'-');
/*!40000 ALTER TABLE `grp_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_employee`
--

DROP TABLE IF EXISTS `grp_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `empNum` varchar(30) NOT NULL,
  `empBuseoCode` varchar(20) NOT NULL,
  `empGradeCode` varchar(20) NOT NULL,
  `empName` varchar(10) NOT NULL,
  `empPwd` varchar(20) NOT NULL,
  `empStep` int DEFAULT '1',
  `empEnter` date DEFAULT NULL,
  `empRegdate` date DEFAULT NULL,
  `empConfirm` char(1) DEFAULT 'N',
  `empAuth` int DEFAULT '1',
  `empHead` char(1) DEFAULT 'N',
  `empPhoto` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_employee`
--

LOCK TABLES `grp_employee` WRITE;
/*!40000 ALTER TABLE `grp_employee` DISABLE KEYS */;
INSERT INTO `grp_employee` VALUES (1,'admin','0','0','관리자','admin',0,NULL,NULL,'Y',10,'0',NULL),(2,'202120093','200','9','기대리','1234',1,'2021-01-07','2021-01-11',NULL,NULL,NULL,NULL),(3,'2021100105','100','10','관사원','1234',1,'2021-01-11','2021-01-11',NULL,1,NULL,NULL),(4,'202110066','100','6','이부장','1234',1,'2021-01-06','2021-01-11',NULL,1,NULL,NULL),(5,'202110077','100','7','김팀장','1234',1,'2021-01-10','2021-01-11','Y',1,'N',NULL),(6,'202020067','200','6','김부장','0000',2,'2020-12-10','2021-01-11','N',1,'N',NULL),(7,'202110068','100','6','박부장','1234',1,'2021-01-07','2021-01-11','N',1,'N',NULL),(8,'202120089','200','8','기과장','1234',1,'2021-01-11','2021-01-11','N',1,'N',NULL),(9,'202160078','600','7','김비서','aaaa',1,'2021-01-11','2021-01-11','N',1,'N',NULL),(10,'2021400617','400','6','사영업','1234',1,'2021-01-02','2021-01-11','N',1,'N',NULL),(11,'2021500918','500','9','박생산','1234',1,'2021-01-06','2021-01-11','N',1,'N',NULL),(12,'2021300719','300','7','인기남','1234',1,'2021-01-03','2021-01-11','Y',2,'N',NULL),(13,'20215001012','500','10','?','1111',1,'2021-01-05','2021-01-14','N',1,'N','f3f05d7b-3777-4a53-a925-514e857c329c_'),(14,'20215001021','500','10','?','1111',1,'2021-01-06','2021-01-14','N',1,'N','64b1398b-f473-40da-83d9-33ab556645b7_'),(15,'20211001022','100','10','?','1111',1,'2021-01-01','2021-01-14','Y',2,'N','43211c97-e0dc-430a-b5aa-798fc5029b19_'),(16,'2021100623','100','6','감부장','1234',1,'2021-01-14','2021-01-14','N',1,'N',NULL),(17,'2021600924','600','9','김비서','1122',1,'2021-01-06','2021-01-14','N',1,'N','beb173e1-07dc-4b17-8731-7b6952af2c6e_'),(18,'2021100625','100','6','일이삼','1234',1,'2021-01-01','2021-01-14','N',1,'N',NULL),(19,'2021500926','500','9','김사원','1111',1,'2021-01-07','2021-01-14','N',1,'N','25ef141e-926a-4a80-86f4-030e139c812b_'),(20,'2021100627','100','6','김부장','1111',1,'2021-01-01','2021-01-14','N',1,'N','3540b3d0-6912-4c39-8c51-fd183ef5e8fe_'),(21,'2021100628','100','6','박부장','1111',1,'2021-01-04','2021-01-14','N',1,'N','af8ea676-a853-4ce1-add7-7ee6bd6216e9_'),(30,'2021100621','100','6','김사원','1111',1,'2021-01-01','2021-01-18','N',1,'N','44e3af4d-5465-4e8f-b231-7381e1e744c0_');
/*!40000 ALTER TABLE `grp_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_employee_others`
--

DROP TABLE IF EXISTS `grp_employee_others`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_employee_others` (
  `empGender` char(2) DEFAULT NULL,
  `empBirth` char(8) DEFAULT NULL,
  `empCP` char(8) DEFAULT NULL,
  `empIn` char(8) DEFAULT NULL,
  `empTel` char(8) DEFAULT NULL,
  `empRecruit` char(5) DEFAULT NULL,
  `empHope` varchar(20) DEFAULT NULL,
  `empHeight` char(3) DEFAULT NULL,
  `empWeight` char(3) DEFAULT NULL,
  `empMilitaryService` char(5) DEFAULT NULL,
  `empReligion` char(5) DEFAULT NULL,
  `empHobby` varchar(20) DEFAULT NULL,
  `empSpeciality` varchar(20) DEFAULT NULL,
  `empDisability` char(3) DEFAULT NULL,
  `empReward` char(3) DEFAULT NULL,
  `empMarried` char(3) DEFAULT NULL,
  `empLicense1` varchar(20) DEFAULT NULL,
  `empLicense2` varchar(20) DEFAULT NULL,
  `empLicense3` varchar(20) DEFAULT NULL,
  `empLicense4` varchar(20) DEFAULT NULL,
  `empLicense5` varchar(20) DEFAULT NULL,
  `empLang1` varchar(20) DEFAULT NULL,
  `empLang2` varchar(20) DEFAULT NULL,
  `empLang3` varchar(20) DEFAULT NULL,
  `empLang4` varchar(20) DEFAULT NULL,
  `empLang5` varchar(20) DEFAULT NULL,
  `empRnP1` varchar(20) DEFAULT NULL,
  `empRnP2` varchar(20) DEFAULT NULL,
  `empRnP3` varchar(20) DEFAULT NULL,
  `empRnP4` varchar(20) DEFAULT NULL,
  `empRnP5` varchar(20) DEFAULT NULL,
  `empComment` text,
  `empNum` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_employee_others`
--

LOCK TABLES `grp_employee_others` WRITE;
/*!40000 ALTER TABLE `grp_employee_others` DISABLE KEYS */;
INSERT INTO `grp_employee_others` VALUES ('남자','000000','010','02','02','공개채용','','','',NULL,'무교','','','비장애','비대상','미혼','','','','','','','','','','','','','','','','',NULL),('남자','','010','02','02','공개채용','','','',NULL,'무교','','','비장애','비대상','미혼','','','','','','','','','','','','','','','','',NULL),('남자','930101','010','02','02','공개채용','','','',NULL,'무교','','','비장애','비대상','미혼','','','','','','','','','','','','','','','','',NULL);
/*!40000 ALTER TABLE `grp_employee_others` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp_grade`
--

DROP TABLE IF EXISTS `grp_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp_grade` (
  `grade_id` varchar(10) NOT NULL,
  `grade_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp_grade`
--

LOCK TABLES `grp_grade` WRITE;
/*!40000 ALTER TABLE `grp_grade` DISABLE KEYS */;
INSERT INTO `grp_grade` VALUES ('6','부장'),('7','팀장'),('8','과장'),('9','대리'),('10','사원');
/*!40000 ALTER TABLE `grp_grade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-21 16:15:54
