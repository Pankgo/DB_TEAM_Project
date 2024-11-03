-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공급`
--

DROP TABLE IF EXISTS `공급`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공급` (
  `재료_재료명` varchar(45) NOT NULL,
  `공급업체_공급업체번호` int NOT NULL,
  `공급주문날짜` date DEFAULT NULL,
  `공급재료량` int DEFAULT NULL,
  `공급재료가격` int DEFAULT NULL,
  PRIMARY KEY (`재료_재료명`,`공급업체_공급업체번호`),
  KEY `fk_재료_has_공급업체_공급업체1_idx` (`공급업체_공급업체번호`),
  KEY `fk_재료_has_공급업체_재료1_idx` (`재료_재료명`),
  CONSTRAINT `fk_재료_has_공급업체_공급업체1` FOREIGN KEY (`공급업체_공급업체번호`) REFERENCES `공급업체` (`공급업체번호`),
  CONSTRAINT `fk_재료_has_공급업체_재료1` FOREIGN KEY (`재료_재료명`) REFERENCES `재료` (`재료명`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공급`
--

LOCK TABLES `공급` WRITE;
/*!40000 ALTER TABLE `공급` DISABLE KEYS */;
/*!40000 ALTER TABLE `공급` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `공급업체`
--

DROP TABLE IF EXISTS `공급업체`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `공급업체` (
  `공급업체번호` int NOT NULL AUTO_INCREMENT,
  `공급업체이름` varchar(45) DEFAULT NULL,
  `공급업체주소` varchar(45) DEFAULT NULL,
  `공급업체전화번호` varchar(45) DEFAULT NULL,
  `공급업체담당자` varchar(45) DEFAULT NULL,
  `공급업체납품재료` varchar(45) DEFAULT NULL,
  `공급업체납품단위` varchar(45) DEFAULT NULL,
  `공급업체납품가격` int DEFAULT NULL,
  `공급업체납기일` date DEFAULT NULL,
  `계약일수` int DEFAULT NULL,
  `공급업체col` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`공급업체번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `공급업체`
--

LOCK TABLES `공급업체` WRITE;
/*!40000 ALTER TABLE `공급업체` DISABLE KEYS */;
/*!40000 ALTER TABLE `공급업체` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `댓글`
--

DROP TABLE IF EXISTS `댓글`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `댓글` (
  `댓글번호` int NOT NULL AUTO_INCREMENT,
  `내용` varchar(45) DEFAULT NULL,
  `작성일자` date DEFAULT NULL,
  `제휴매장게시판_글번호` int NOT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  PRIMARY KEY (`댓글번호`),
  KEY `fk_댓글_제휴매장게시판1_idx` (`제휴매장게시판_글번호`),
  KEY `fk_댓글_회원1_idx` (`회원_아이디`),
  CONSTRAINT `fk_댓글_제휴매장게시판1` FOREIGN KEY (`제휴매장게시판_글번호`) REFERENCES `제휴매장게시판` (`글번호`),
  CONSTRAINT `fk_댓글_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `댓글`
--

LOCK TABLES `댓글` WRITE;
/*!40000 ALTER TABLE `댓글` DISABLE KEYS */;
/*!40000 ALTER TABLE `댓글` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `리뷰`
--

DROP TABLE IF EXISTS `리뷰`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `리뷰` (
  `리뷰식별번호` int NOT NULL AUTO_INCREMENT,
  `평점` int DEFAULT NULL,
  `내용` varchar(45) DEFAULT NULL,
  `제휴매장이름` varchar(45) DEFAULT NULL,
  `작성날짜` date DEFAULT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  `제휴매장_사업자번호` int NOT NULL,
  PRIMARY KEY (`리뷰식별번호`),
  KEY `fk_리뷰_회원1_idx` (`회원_아이디`),
  KEY `fk_리뷰_제휴매장1_idx` (`제휴매장_사업자번호`),
  CONSTRAINT `fk_리뷰_제휴매장1` FOREIGN KEY (`제휴매장_사업자번호`) REFERENCES `제휴매장` (`사업자번호`),
  CONSTRAINT `fk_리뷰_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `리뷰`
--

LOCK TABLES `리뷰` WRITE;
/*!40000 ALTER TABLE `리뷰` DISABLE KEYS */;
/*!40000 ALTER TABLE `리뷰` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `메뉴주문`
--

DROP TABLE IF EXISTS `메뉴주문`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `메뉴주문` (
  `주문식별번호` int NOT NULL AUTO_INCREMENT,
  `제휴매장이름` varchar(45) DEFAULT NULL,
  `제휴매장중복체크` varchar(45) DEFAULT NULL,
  `주문날짜` date DEFAULT NULL,
  `주문방식` varchar(45) DEFAULT NULL,
  `포인트사용금액` int DEFAULT NULL,
  `포인트적립금액` int DEFAULT NULL,
  `전체총수량` int DEFAULT NULL,
  `할인률` int DEFAULT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  `분기_분기번호` varchar(45) NOT NULL,
  `제휴매장_사업자번호` int NOT NULL,
  `원본총금액` int DEFAULT NULL,
  `전체총금액_할인` int DEFAULT NULL,
  `전체총금액_포인트` int DEFAULT NULL,
  PRIMARY KEY (`주문식별번호`),
  KEY `fk_메뉴주문_회원1_idx` (`회원_아이디`),
  KEY `fk_메뉴주문_분기1_idx` (`분기_분기번호`),
  KEY `fk_메뉴주문_제휴매장1_idx` (`제휴매장_사업자번호`),
  CONSTRAINT `fk_메뉴주문_분기1` FOREIGN KEY (`분기_분기번호`) REFERENCES `분기` (`분기번호`),
  CONSTRAINT `fk_메뉴주문_제휴매장1` FOREIGN KEY (`제휴매장_사업자번호`) REFERENCES `제휴매장` (`사업자번호`),
  CONSTRAINT `fk_메뉴주문_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `메뉴주문`
--

LOCK TABLES `메뉴주문` WRITE;
/*!40000 ALTER TABLE `메뉴주문` DISABLE KEYS */;
INSERT INTO `메뉴주문` VALUES (11,'동서분식',NULL,'2023-12-16','카드',0,0,3,5,'20191598','2023-4',1111,4500,4275,4500),(12,'',NULL,'2023-12-16',NULL,0,0,3,0,'20191598','2023-4',999999999,4500,4500,4500),(13,'',NULL,'2023-12-16','카드',0,0,3,0,'20191598','2023-4',999999999,4500,4500,4500),(14,'',NULL,'2023-12-16','카드',0,0,3,0,'20191598','2023-4',999999999,4500,4500,4500),(15,'',NULL,'2023-12-16','현금',0,0,3,0,'20191598','2023-4',999999999,4500,4500,4500),(16,'',NULL,'2023-12-16',NULL,0,0,3,0,'20191598','2023-4',999999999,4500,4500,4500),(17,'',NULL,'2023-12-16',NULL,0,0,3,0,'20191598','2023-4',999999999,4500,4500,4500),(18,'',NULL,'2023-12-16','현금',0,0,1,0,'bb','2023-4',999999999,1500,1500,1500),(19,'동서분식',NULL,'2023-12-16','현금',0,0,1,5,'bb','2023-4',1111,1500,1425,1500),(20,'동서분식',NULL,'2023-12-16','카드',0,0,1,5,'bb','2023-4',1111,1500,1425,1500),(21,'',NULL,'2023-12-16','카드',0,0,1,0,'bb','2023-4',999999999,1500,1500,1500),(22,'',NULL,'2023-12-16','카드',0,0,1,0,'bb','2023-4',999999999,1500,1500,1500),(23,'동서분식',NULL,'2023-12-16',NULL,0,0,4,5,'bb','2023-4',1111,6000,5700,6000),(24,'',NULL,'2023-12-16','현금',0,0,4,0,'bb','2023-4',999999999,8000,8000,8000),(25,'',NULL,'2023-12-16','현금',500,0,3,0,'bb','2023-4',999999999,4500,4500,4000),(26,'',NULL,'2023-12-16','현금',0,0,1,0,'bb','2023-4',999999999,1500,1500,1500),(27,'',NULL,'2023-12-16','카드',0,0,4,0,'bb','2023-4',999999999,6000,6000,6000),(28,'',NULL,'2023-12-16','카드',0,0,2,0,'bb','2023-4',999999999,3000,3000,3000),(29,'',NULL,'2023-12-16','카드',0,0,3,0,'bb','2023-4',999999999,4500,4500,4500),(30,'',NULL,'2023-12-16','카드',0,0,3,0,'bb','2023-4',999999999,6000,6000,6000),(31,'',NULL,'2023-12-16','카드',0,0,6,0,'bb','2023-4',999999999,11000,11000,11000),(32,'',NULL,'2023-12-16','카드',0,0,3,0,'bb','2023-4',999999999,4500,4500,4500),(33,'',NULL,'2023-12-16','카드',0,180,3,0,'bb','2023-4',999999999,6000,6000,6000),(34,'동서파트너',NULL,'2023-12-17','카드',0,0,1,5,'partner','2023-4',4444,1500,1425,1500),(35,'동서파트너',NULL,'2023-12-17','카드',0,0,1,5,'partner','2023-4',4444,1500,1425,1500),(36,'동서파트너',NULL,'2023-12-17','카드',0,0,1,5,'partner','2023-4',4444,1500,1425,1500),(37,'동서파트너',NULL,'2023-12-17','카드',0,0,1,5,'partner','2023-4',4444,2000,1900,2000),(38,'',NULL,'2023-12-17',NULL,0,0,1,0,'tt','2023-4',999999999,1500,1500,1500),(39,'동서분식',NULL,'2023-12-17',NULL,0,0,3,5,'tt','2023-4',1111,5500,5225,5500),(40,'동서분식',NULL,'2023-12-17',NULL,0,0,2,5,'tt','2023-4',1111,3000,2850,3000);
/*!40000 ALTER TABLE `메뉴주문` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `메뉴주문내역`
--

DROP TABLE IF EXISTS `메뉴주문내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `메뉴주문내역` (
  `메뉴주문내역식별번호` int NOT NULL AUTO_INCREMENT,
  `메뉴총금액` int DEFAULT NULL,
  `메뉴총수량` int DEFAULT NULL,
  `환불여부` varchar(45) DEFAULT NULL,
  `메뉴주문_주문식별번호` int NOT NULL,
  `메뉴항목_메뉴항목번호` int NOT NULL,
  PRIMARY KEY (`메뉴주문내역식별번호`,`메뉴주문_주문식별번호`,`메뉴항목_메뉴항목번호`),
  KEY `fk_메뉴주문내역_메뉴주문1_idx` (`메뉴주문_주문식별번호`),
  KEY `fk_메뉴주문내역_메뉴항목1_idx` (`메뉴항목_메뉴항목번호`),
  CONSTRAINT `fk_메뉴주문내역_메뉴주문1` FOREIGN KEY (`메뉴주문_주문식별번호`) REFERENCES `메뉴주문` (`주문식별번호`),
  CONSTRAINT `fk_메뉴주문내역_메뉴항목1` FOREIGN KEY (`메뉴항목_메뉴항목번호`) REFERENCES `메뉴항목` (`메뉴항목번호`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `메뉴주문내역`
--

LOCK TABLES `메뉴주문내역` WRITE;
/*!40000 ALTER TABLE `메뉴주문내역` DISABLE KEYS */;
INSERT INTO `메뉴주문내역` VALUES (13,4500,3,'false',11,501),(14,4500,3,'false',12,501),(15,4500,3,'false',13,501),(16,4500,3,'false',14,501),(17,4500,3,'false',15,501),(18,4500,3,'false',16,501),(19,4500,3,'false',17,501),(20,1500,1,'false',18,501),(21,1500,1,'false',19,501),(22,1500,1,'false',20,501),(23,1500,1,'false',21,501),(24,1500,1,'false',22,501),(25,6000,4,'false',23,501),(26,8000,4,'false',24,502),(27,4500,3,'false',25,501),(28,1500,1,'false',26,501),(29,6000,4,'false',27,501),(30,3000,2,'false',28,501),(31,4500,3,'false',29,501),(32,6000,3,'false',30,502),(33,3000,2,'false',31,501),(34,8000,4,'false',31,502),(35,4500,3,'false',32,501),(36,6000,3,'false',33,502),(37,1500,1,'false',36,501),(38,2000,1,'false',37,502),(39,1500,1,'false',38,501),(40,1500,1,'false',39,501),(41,4000,2,'false',39,502),(42,3000,2,'false',40,501);
/*!40000 ALTER TABLE `메뉴주문내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `메뉴통계`
--

DROP TABLE IF EXISTS `메뉴통계`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `메뉴통계` (
  `메뉴통계식별번호` int NOT NULL AUTO_INCREMENT,
  `판매횟수` int DEFAULT NULL,
  `메뉴항목_메뉴항목번호` int NOT NULL,
  `분기_분기번호` varchar(45) NOT NULL,
  PRIMARY KEY (`메뉴통계식별번호`),
  KEY `fk_메뉴통계_메뉴항목1_idx` (`메뉴항목_메뉴항목번호`),
  KEY `fk_메뉴통계_분기1_idx` (`분기_분기번호`),
  CONSTRAINT `fk_메뉴통계_메뉴항목1` FOREIGN KEY (`메뉴항목_메뉴항목번호`) REFERENCES `메뉴항목` (`메뉴항목번호`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_메뉴통계_분기1` FOREIGN KEY (`분기_분기번호`) REFERENCES `분기` (`분기번호`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `메뉴통계`
--

LOCK TABLES `메뉴통계` WRITE;
/*!40000 ALTER TABLE `메뉴통계` DISABLE KEYS */;
INSERT INTO `메뉴통계` VALUES (1,50,501,'2022-1'),(2,50,501,'2022-2'),(3,50,501,'2022-3'),(4,50,501,'2022-4'),(5,50,501,'2023-1'),(6,50,501,'2023-2'),(7,50,501,'2023-3'),(8,112,501,'2023-4'),(9,131,502,'2023-4'),(10,200,503,'2023-4'),(11,50,504,'2023-4');
/*!40000 ALTER TABLE `메뉴통계` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `메뉴항목`
--

DROP TABLE IF EXISTS `메뉴항목`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `메뉴항목` (
  `메뉴항목번호` int NOT NULL AUTO_INCREMENT,
  `메뉴이름` varchar(45) DEFAULT NULL,
  `메뉴가격` int DEFAULT NULL,
  `특별메뉴` varchar(45) DEFAULT NULL,
  `분류명` varchar(45) DEFAULT NULL,
  `계절설정` varchar(45) DEFAULT NULL,
  `총판매갯수` int DEFAULT NULL,
  `등록날짜` date DEFAULT NULL,
  PRIMARY KEY (`메뉴항목번호`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `메뉴항목`
--

LOCK TABLES `메뉴항목` WRITE;
/*!40000 ALTER TABLE `메뉴항목` DISABLE KEYS */;
INSERT INTO `메뉴항목` VALUES (501,'아메리카노',1500,'없음','커피','없음',462,'2022-01-01'),(502,'카페라떼',2000,'없음','커피','없음',131,'2023-12-01'),(503,'초코라떼',3000,'있음','음료','없음',200,'2023-12-01'),(504,'녹차라떼',2500,'없음','음료','없음',50,'2023-12-01');
/*!40000 ALTER TABLE `메뉴항목` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `메뉴홍보`
--

DROP TABLE IF EXISTS `메뉴홍보`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `메뉴홍보` (
  `홍보식별번호` int NOT NULL AUTO_INCREMENT,
  `홍보내용` varchar(45) DEFAULT NULL,
  `홍보날짜` date DEFAULT NULL,
  `홍보분류` varchar(45) DEFAULT NULL,
  `메뉴항목_메뉴항목번호` int NOT NULL,
  PRIMARY KEY (`홍보식별번호`),
  KEY `fk_메뉴홍보_메뉴항목1_idx` (`메뉴항목_메뉴항목번호`),
  CONSTRAINT `fk_메뉴홍보_메뉴항목1` FOREIGN KEY (`메뉴항목_메뉴항목번호`) REFERENCES `메뉴항목` (`메뉴항목번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `메뉴홍보`
--

LOCK TABLES `메뉴홍보` WRITE;
/*!40000 ALTER TABLE `메뉴홍보` DISABLE KEYS */;
/*!40000 ALTER TABLE `메뉴홍보` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `분기`
--

DROP TABLE IF EXISTS `분기`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `분기` (
  `분기번호` varchar(45) NOT NULL,
  `분기일수` int DEFAULT NULL,
  `분기시작일` date DEFAULT NULL,
  `분기종료일` date DEFAULT NULL,
  PRIMARY KEY (`분기번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `분기`
--

LOCK TABLES `분기` WRITE;
/*!40000 ALTER TABLE `분기` DISABLE KEYS */;
INSERT INTO `분기` VALUES ('2022-1',-1,'2022-01-02','2022-04-02'),('2022-2',-1,'2022-04-03','2022-07-02'),('2022-3',-1,'2022-07-03','2022-10-01'),('2022-4',-1,'2022-10-02','2022-12-31'),('2023-1',-1,'2023-01-01','2023-04-01'),('2023-2',-1,'2023-04-02','2023-07-01'),('2023-3',-1,'2023-07-02','2023-09-30'),('2023-4',15,'2023-10-01','2023-12-30');
/*!40000 ALTER TABLE `분기` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `장바구니`
--

DROP TABLE IF EXISTS `장바구니`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `장바구니` (
  `메뉴항목_메뉴항목번호` int NOT NULL,
  `장바구니식별_장바구니식별번호` int NOT NULL,
  `장바구니총수량` int DEFAULT NULL,
  `장바구니총금액` int DEFAULT NULL,
  PRIMARY KEY (`메뉴항목_메뉴항목번호`,`장바구니식별_장바구니식별번호`),
  KEY `fk_장바구니_메뉴항목1_idx` (`메뉴항목_메뉴항목번호`),
  KEY `fk_장바구니_장바구니식별1_idx` (`장바구니식별_장바구니식별번호`),
  CONSTRAINT `fk_장바구니_메뉴항목1` FOREIGN KEY (`메뉴항목_메뉴항목번호`) REFERENCES `메뉴항목` (`메뉴항목번호`),
  CONSTRAINT `fk_장바구니_장바구니식별1` FOREIGN KEY (`장바구니식별_장바구니식별번호`) REFERENCES `장바구니식별` (`장바구니식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `장바구니`
--

LOCK TABLES `장바구니` WRITE;
/*!40000 ALTER TABLE `장바구니` DISABLE KEYS */;
INSERT INTO `장바구니` VALUES (501,3,1,1500),(501,5,3,4500),(502,5,2,4000);
/*!40000 ALTER TABLE `장바구니` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `장바구니식별`
--

DROP TABLE IF EXISTS `장바구니식별`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `장바구니식별` (
  `장바구니식별번호` int NOT NULL AUTO_INCREMENT,
  `회원_아이디` varchar(45) NOT NULL,
  PRIMARY KEY (`장바구니식별번호`),
  KEY `fk_장바구니식별_회원1_idx` (`회원_아이디`),
  CONSTRAINT `fk_장바구니식별_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `장바구니식별`
--

LOCK TABLES `장바구니식별` WRITE;
/*!40000 ALTER TABLE `장바구니식별` DISABLE KEYS */;
INSERT INTO `장바구니식별` VALUES (1,'20191598'),(5,'a'),(2,'bb'),(3,'partner'),(4,'tt');
/*!40000 ALTER TABLE `장바구니식별` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `재료`
--

DROP TABLE IF EXISTS `재료`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `재료` (
  `재료명` varchar(45) NOT NULL,
  `재료재고량` int DEFAULT NULL,
  PRIMARY KEY (`재료명`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `재료`
--

LOCK TABLES `재료` WRITE;
/*!40000 ALTER TABLE `재료` DISABLE KEYS */;
/*!40000 ALTER TABLE `재료` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `제휴매장`
--

DROP TABLE IF EXISTS `제휴매장`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `제휴매장` (
  `사업자번호` int NOT NULL,
  `제휴매장이름` varchar(45) DEFAULT NULL,
  `제휴매장주소` varchar(45) DEFAULT NULL,
  `제휴매장담당자` varchar(45) DEFAULT NULL,
  `제휴매장전화번호` varchar(45) DEFAULT NULL,
  `제휴매장분류` varchar(45) DEFAULT NULL,
  `제휴매장계약활성` varchar(45) DEFAULT NULL,
  `제휴매장재계약유무` varchar(45) DEFAULT NULL,
  `제휴매장리뷰갯수` int DEFAULT NULL,
  `제휴매장요청유무` varchar(45) DEFAULT NULL,
  `제휴매장평점` int DEFAULT NULL,
  `총계약일수` int DEFAULT NULL,
  `연속1등급횟수` int DEFAULT NULL,
  `계약해지사유` varchar(45) DEFAULT NULL,
  `지급혜택여부` varchar(45) DEFAULT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  PRIMARY KEY (`사업자번호`),
  KEY `fk_제휴매장_회원1_idx` (`회원_아이디`),
  CONSTRAINT `fk_제휴매장_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `제휴매장`
--

LOCK TABLES `제휴매장` WRITE;
/*!40000 ALTER TABLE `제휴매장` DISABLE KEYS */;
INSERT INTO `제휴매장` VALUES (1111,'동서분식','부산시','a','010-5555-5555','한식','False','False',0,'True',0,0,0,'없음','False','tt'),(2222,'동서중식','부산시','a','010-3333-5555','중식','True','False',0,'False',0,710,0,'없음','False','bb'),(3333,'동서양식','부산시','a','010-7878-8888','양식','True','False',0,'False',0,710,4,'없음','True','a'),(4444,'동서파트너','부산시','partner','010-8888-8888','한식','True','False',0,'False',0,0,0,'없음','False','partner'),(999999999,'빈 매장','undefiend','undefiend','undefiend','undefiend','undefiend','undefiend',0,'undefiend',0,0,0,'undefiend','undefiend','a');
/*!40000 ALTER TABLE `제휴매장` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `제휴매장게시판`
--

DROP TABLE IF EXISTS `제휴매장게시판`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `제휴매장게시판` (
  `글번호` int NOT NULL AUTO_INCREMENT,
  `제목` varchar(45) DEFAULT NULL,
  `내용` varchar(45) DEFAULT NULL,
  `작성일자` date DEFAULT NULL,
  `추천수` int DEFAULT NULL,
  `제휴매장이름` varchar(45) DEFAULT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  `제휴매장_사업자번호` int NOT NULL,
  PRIMARY KEY (`글번호`),
  KEY `fk_제휴매장게시판_회원1_idx` (`회원_아이디`),
  KEY `fk_제휴매장게시판_제휴매장1_idx` (`제휴매장_사업자번호`),
  CONSTRAINT `fk_제휴매장게시판_제휴매장1` FOREIGN KEY (`제휴매장_사업자번호`) REFERENCES `제휴매장` (`사업자번호`),
  CONSTRAINT `fk_제휴매장게시판_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `제휴매장게시판`
--

LOCK TABLES `제휴매장게시판` WRITE;
/*!40000 ALTER TABLE `제휴매장게시판` DISABLE KEYS */;
INSERT INTO `제휴매장게시판` VALUES (1,'여기좋습니다','이 제휴매장 좋습니다.','2023-12-15',100,'동서한식','bb',1111),(2,'ㄴㅁㅇㄹ','ㅁㄴㅇㄹ','2023-12-16',0,'동서분식','20191598',1111);
/*!40000 ALTER TABLE `제휴매장게시판` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `제휴매장메시지`
--

DROP TABLE IF EXISTS `제휴매장메시지`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `제휴매장메시지` (
  `메시지식별번호` int NOT NULL AUTO_INCREMENT,
  `메시지내용` varchar(45) DEFAULT NULL,
  `작성날짜` date DEFAULT NULL,
  `제휴매장분기별등급_분기별등급식별번호` int NOT NULL,
  `제휴매장_사업자번호` int NOT NULL,
  PRIMARY KEY (`메시지식별번호`),
  KEY `fk_제휴매장메시지_제휴매장분기별등급1_idx` (`제휴매장분기별등급_분기별등급식별번호`),
  KEY `fk_제휴매장메시지_제휴매장1_idx` (`제휴매장_사업자번호`),
  CONSTRAINT `fk_제휴매장메시지_제휴매장1` FOREIGN KEY (`제휴매장_사업자번호`) REFERENCES `제휴매장` (`사업자번호`),
  CONSTRAINT `fk_제휴매장메시지_제휴매장분기별등급1` FOREIGN KEY (`제휴매장분기별등급_분기별등급식별번호`) REFERENCES `제휴매장분기별등급` (`분기별등급식별번호`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `제휴매장메시지`
--

LOCK TABLES `제휴매장메시지` WRITE;
/*!40000 ALTER TABLE `제휴매장메시지` DISABLE KEYS */;
INSERT INTO `제휴매장메시지` VALUES (1,'sdafsdf','2023-12-12',5,2222),(2,'fdg','2023-12-12',5,2222),(3,'dfsg','2023-12-12',5,2222),(4,'잘했씁니다.','2023-12-17',11,4444);
/*!40000 ALTER TABLE `제휴매장메시지` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `제휴매장분기별등급`
--

DROP TABLE IF EXISTS `제휴매장분기별등급`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `제휴매장분기별등급` (
  `분기별등급식별번호` int NOT NULL AUTO_INCREMENT,
  `분기별총수익` int DEFAULT NULL,
  `분기별지급액` int DEFAULT NULL,
  `분기별등급` varchar(45) DEFAULT NULL,
  `분기별등급_하락방지적용` varchar(45) DEFAULT NULL,
  `분기별등급지급률` int DEFAULT NULL,
  `관리자부여등급혜택여부` varchar(45) DEFAULT NULL,
  `협의내용` varchar(45) DEFAULT NULL,
  `특별승급대상자여부` varchar(45) DEFAULT NULL,
  `제휴매장_사업자번호` int NOT NULL,
  `분기_분기번호` varchar(45) NOT NULL,
  PRIMARY KEY (`분기별등급식별번호`),
  KEY `fk_제휴매장분기별등급_제휴매장1_idx` (`제휴매장_사업자번호`),
  KEY `fk_제휴매장분기별등급_분기1_idx` (`분기_분기번호`),
  CONSTRAINT `fk_제휴매장분기별등급_분기1` FOREIGN KEY (`분기_분기번호`) REFERENCES `분기` (`분기번호`),
  CONSTRAINT `fk_제휴매장분기별등급_제휴매장1` FOREIGN KEY (`제휴매장_사업자번호`) REFERENCES `제휴매장` (`사업자번호`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `제휴매장분기별등급`
--

LOCK TABLES `제휴매장분기별등급` WRITE;
/*!40000 ALTER TABLE `제휴매장분기별등급` DISABLE KEYS */;
INSERT INTO `제휴매장분기별등급` VALUES (1,5200000,260000,'1등급','없음',5,'False','없음','False',2222,'2022-1'),(2,5100000,255000,'1등급','없음',5,'False','없음','False',2222,'2022-2'),(3,5400000,270000,'1등급','없음',5,'False','없음','False',2222,'2022-3'),(4,5300000,265000,'1등급','없음',5,'False','없음','False',2222,'2022-4'),(5,4800000,240000,'2등급','1등급',5,'False','없음','False',2222,'2023-1'),(6,5100000,5100000,'1등급','없음',5,'False','없음','False',3333,'2022-1'),(7,5100000,5100000,'1등급','없음',5,'False','없음','False',3333,'2022-2'),(8,5100000,5100000,'1등급','없음',5,'False','없음','False',3333,'2022-3'),(9,5100000,5100000,'1등급','없음',5,'False','없음','True',3333,'2022-4'),(10,1500000,0,'3등급','없음',0,'False','없음','False',4444,'2023-3'),(11,3003500,90105,'2등급','없음',3,'False','없음','False',4444,'2023-4');
/*!40000 ALTER TABLE `제휴매장분기별등급` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `조합법`
--

DROP TABLE IF EXISTS `조합법`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `조합법` (
  `재료_재료명` varchar(45) NOT NULL,
  `메뉴항목_메뉴항목번호` int NOT NULL,
  `필요재료량` int DEFAULT NULL,
  PRIMARY KEY (`재료_재료명`,`메뉴항목_메뉴항목번호`),
  KEY `fk_재료_has_메뉴항목_메뉴항목1_idx` (`메뉴항목_메뉴항목번호`),
  KEY `fk_재료_has_메뉴항목_재료1_idx` (`재료_재료명`),
  CONSTRAINT `fk_재료_has_메뉴항목_메뉴항목1` FOREIGN KEY (`메뉴항목_메뉴항목번호`) REFERENCES `메뉴항목` (`메뉴항목번호`),
  CONSTRAINT `fk_재료_has_메뉴항목_재료1` FOREIGN KEY (`재료_재료명`) REFERENCES `재료` (`재료명`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `조합법`
--

LOCK TABLES `조합법` WRITE;
/*!40000 ALTER TABLE `조합법` DISABLE KEYS */;
/*!40000 ALTER TABLE `조합법` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `직원정보`
--

DROP TABLE IF EXISTS `직원정보`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `직원정보` (
  `직원식별번호` int NOT NULL AUTO_INCREMENT,
  `입사일` date DEFAULT NULL,
  `계약일수` int DEFAULT NULL,
  `시급` int DEFAULT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  PRIMARY KEY (`직원식별번호`),
  KEY `fk_직원정보_회원1_idx` (`회원_아이디`),
  CONSTRAINT `fk_직원정보_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `직원정보`
--

LOCK TABLES `직원정보` WRITE;
/*!40000 ALTER TABLE `직원정보` DISABLE KEYS */;
/*!40000 ALTER TABLE `직원정보` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `직원휴가기록부`
--

DROP TABLE IF EXISTS `직원휴가기록부`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `직원휴가기록부` (
  `휴가식별번호` int NOT NULL AUTO_INCREMENT,
  `소지휴가수` int DEFAULT NULL,
  `소비휴가수` int DEFAULT NULL,
  `직원정보_직원식별번호` int NOT NULL,
  PRIMARY KEY (`휴가식별번호`),
  KEY `fk_직원휴가기록부_직원정보1_idx` (`직원정보_직원식별번호`),
  CONSTRAINT `fk_직원휴가기록부_직원정보1` FOREIGN KEY (`직원정보_직원식별번호`) REFERENCES `직원정보` (`직원식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `직원휴가기록부`
--

LOCK TABLES `직원휴가기록부` WRITE;
/*!40000 ALTER TABLE `직원휴가기록부` DISABLE KEYS */;
/*!40000 ALTER TABLE `직원휴가기록부` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `출퇴근기록부`
--

DROP TABLE IF EXISTS `출퇴근기록부`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `출퇴근기록부` (
  `출퇴근기록식별번호` int NOT NULL AUTO_INCREMENT,
  `날짜` date DEFAULT NULL,
  `출근시간` varchar(45) DEFAULT NULL,
  `퇴근시간` varchar(45) DEFAULT NULL,
  `총근무시간` int DEFAULT NULL,
  `비고` varchar(45) DEFAULT NULL,
  `직원정보_직원식별번호` int NOT NULL,
  PRIMARY KEY (`출퇴근기록식별번호`),
  KEY `fk_출퇴근기록부_직원정보1_idx` (`직원정보_직원식별번호`),
  CONSTRAINT `fk_출퇴근기록부_직원정보1` FOREIGN KEY (`직원정보_직원식별번호`) REFERENCES `직원정보` (`직원식별번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `출퇴근기록부`
--

LOCK TABLES `출퇴근기록부` WRITE;
/*!40000 ALTER TABLE `출퇴근기록부` DISABLE KEYS */;
/*!40000 ALTER TABLE `출퇴근기록부` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `포인트내역`
--

DROP TABLE IF EXISTS `포인트내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `포인트내역` (
  `포인트내역식별번호` int NOT NULL AUTO_INCREMENT,
  `포인트금액` int DEFAULT NULL,
  `사용날짜` date DEFAULT NULL,
  `구분` varchar(45) DEFAULT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  PRIMARY KEY (`포인트내역식별번호`),
  KEY `fk_포인트내역_회원1_idx` (`회원_아이디`),
  CONSTRAINT `fk_포인트내역_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `포인트내역`
--

LOCK TABLES `포인트내역` WRITE;
/*!40000 ALTER TABLE `포인트내역` DISABLE KEYS */;
INSERT INTO `포인트내역` VALUES (11,0,'2023-12-16','적립','20191598'),(12,0,'2023-12-16','적립','20191598'),(13,0,'2023-12-16','적립','20191598'),(14,0,'2023-12-16','적립','20191598'),(15,0,'2023-12-16','적립','20191598'),(16,0,'2023-12-16','적립','20191598'),(17,0,'2023-12-16','적립','20191598'),(18,0,'2023-12-16','적립','bb'),(19,0,'2023-12-16','적립','bb'),(20,0,'2023-12-16','적립','bb'),(21,0,'2023-12-16','사용','bb'),(22,0,'2023-12-16','사용','bb'),(23,0,'2023-12-16','적립','bb'),(24,0,'2023-12-16','적립','bb'),(25,500,'2023-12-16','사용','bb'),(26,0,'2023-12-16','적립','bb'),(27,0,'2023-12-16','적립','bb'),(28,0,'2023-12-16','적립','bb'),(29,0,'2023-12-16','적립','bb'),(30,0,'2023-12-16','적립','bb'),(31,0,'2023-12-16','적립','bb'),(32,0,'2023-12-16','적립','bb'),(33,180,'2023-12-16','적립','bb'),(34,0,'2023-12-17','적립','partner'),(35,0,'2023-12-17','적립','partner'),(36,0,'2023-12-17','적립','partner'),(37,0,'2023-12-17','적립','partner'),(38,0,'2023-12-17','적립','tt'),(39,2000,'2023-12-17','게시판적립','tt'),(40,0,'2023-12-17','적립','tt'),(41,0,'2023-12-17','적립','tt');
/*!40000 ALTER TABLE `포인트내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원`
--

DROP TABLE IF EXISTS `회원`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `회원` (
  `아이디` varchar(45) NOT NULL,
  `비밀번호` varchar(45) DEFAULT NULL,
  `이름` varchar(45) DEFAULT NULL,
  `전화번호` varchar(45) DEFAULT NULL,
  `포인트` int DEFAULT NULL,
  `가입날짜` date DEFAULT NULL,
  `출석수` int DEFAULT NULL,
  `회원구분` varchar(45) DEFAULT NULL,
  `로그인날짜` date DEFAULT NULL,
  `휴먼계정여부` varchar(45) DEFAULT NULL,
  `이번분기포인트` int DEFAULT NULL,
  PRIMARY KEY (`아이디`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원`
--

LOCK TABLES `회원` WRITE;
/*!40000 ALTER TABLE `회원` DISABLE KEYS */;
INSERT INTO `회원` VALUES ('20191598','20191598','조현호','010-1111-4444',0,'2023-12-12',0,'회원','2023-12-17','False',0),('a','a','a','010-4444-2222',0,'2023-12-12',0,'회원','2023-12-17','False',0),('admin','admin','관리자','010-1111-1111',0,'2023-12-12',0,'관리자','2023-12-17','False',0),('bb','bb','bvbvbvvbvvvb','010-7777-8888',4680,'2023-12-16',0,'회원','2023-12-17','False',0),('partner','partner','제휴매장담당자','010-8888-8888',0,'2023-12-12',0,'회원','2023-12-17','False',0),('tt','tt','TT','101-444-444',2000,'2023-12-17',NULL,'회원','2023-12-17','False',0);
/*!40000 ALTER TABLE `회원` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원등급`
--

DROP TABLE IF EXISTS `회원등급`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `회원등급` (
  `등급명` varchar(45) NOT NULL,
  `포인트지급률` int DEFAULT NULL,
  `기준주문횟수` int DEFAULT NULL,
  `기준주문금액` int DEFAULT NULL,
  PRIMARY KEY (`등급명`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원등급`
--

LOCK TABLES `회원등급` WRITE;
/*!40000 ALTER TABLE `회원등급` DISABLE KEYS */;
INSERT INTO `회원등급` VALUES ('골드',5,40,100000),('브론즈',0,0,0),('실버',3,20,50000);
/*!40000 ALTER TABLE `회원등급` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `회원등급결정`
--

DROP TABLE IF EXISTS `회원등급결정`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `회원등급결정` (
  `분기별등급식별번호` int NOT NULL AUTO_INCREMENT,
  `누적사용금액` int DEFAULT NULL,
  `누적주문횟수` int DEFAULT NULL,
  `분기_분기번호` varchar(45) NOT NULL,
  `회원등급_등급명` varchar(45) NOT NULL,
  `회원_아이디` varchar(45) NOT NULL,
  PRIMARY KEY (`분기별등급식별번호`),
  KEY `fk_회원등급결정_분기1_idx` (`분기_분기번호`),
  KEY `fk_회원등급결정_회원등급1_idx` (`회원등급_등급명`),
  KEY `fk_회원등급결정_회원1_idx` (`회원_아이디`),
  CONSTRAINT `fk_회원등급결정_분기1` FOREIGN KEY (`분기_분기번호`) REFERENCES `분기` (`분기번호`),
  CONSTRAINT `fk_회원등급결정_회원1` FOREIGN KEY (`회원_아이디`) REFERENCES `회원` (`아이디`),
  CONSTRAINT `fk_회원등급결정_회원등급1` FOREIGN KEY (`회원등급_등급명`) REFERENCES `회원등급` (`등급명`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `회원등급결정`
--

LOCK TABLES `회원등급결정` WRITE;
/*!40000 ALTER TABLE `회원등급결정` DISABLE KEYS */;
INSERT INTO `회원등급결정` VALUES (1,30500,9,'2023-4','브론즈','20191598'),(2,68500,16,'2023-4','실버','bb'),(3,3500,2,'2023-4','브론즈','partner'),(4,10000,3,'2023-4','브론즈','tt');
/*!40000 ALTER TABLE `회원등급결정` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 20:16:21
