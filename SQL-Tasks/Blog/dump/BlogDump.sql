CREATE DATABASE  IF NOT EXISTS `blog_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blog_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `authorid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`authorid`),
  UNIQUE KEY `idautors_UNIQUE` (`authorid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Andri'),(2,'Anton'),(3,'Ivan'),(4,'Alex'),(5,'Vova'),(6,'Sun'),(7,'Bob'),(8,'Ric'),(9,'Morty'),(10,'You');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(10000) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `authors_authorid` int(11) NOT NULL,
  PRIMARY KEY (`postid`),
  UNIQUE KEY `idposts_UNIQUE` (`postid`),
  KEY `fk_posts_authors1_idx` (`authors_authorid`),
  CONSTRAINT `fk_posts_authors` FOREIGN KEY (`authors_authorid`) REFERENCES `authors` (`authorid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Lorem Ipsum','S1Post','2017-10-30',1),(2,'Newer','2Post','2017-10-31',1),(3,'NewrBefore','S4Title','2017-10-30',2),(4,'wakawaaka','4Title','2016-10-30',2),(5,'Nikoly','s5Title','2017-11-03',4),(6,'Mi1234','s6Posts','2015-11-01',8),(7,'Mey','7Posts','2017-11-03',10),(8,'Mekanization','8Title','2016-10-31',4),(9,'Jon deer','9Post','2016-10-12',7),(10,'cd bash','10tenPosts','2016-11-01',8);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags_map`
--

DROP TABLE IF EXISTS `posts_tags_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags_map` (
  `posts_postid` int(11) NOT NULL,
  `tags_tagid` int(11) NOT NULL,
  PRIMARY KEY (`posts_postid`,`tags_tagid`),
  UNIQUE KEY `posts_postid_tags_tagidUNIQUE` (`posts_postid`,`tags_tagid`),
  KEY `fk_posts_has_tags_tags1_idx` (`tags_tagid`),
  KEY `fk_posts_has_tags_posts_idx` (`posts_postid`),
  CONSTRAINT `fk_posts_has_tags_posts` FOREIGN KEY (`posts_postid`) REFERENCES `posts` (`postid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_has_tags_tags1` FOREIGN KEY (`tags_tagid`) REFERENCES `tags` (`tagid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags_map`
--

LOCK TABLES `posts_tags_map` WRITE;
/*!40000 ALTER TABLE `posts_tags_map` DISABLE KEYS */;
INSERT INTO `posts_tags_map` VALUES (4,1),(6,2),(1,3),(2,3),(1,4),(9,4),(1,6),(5,6),(6,6),(9,6),(8,7),(1,8),(1,9);
/*!40000 ALTER TABLE `posts_tags_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `tag_UNIQUE` (`tag`),
  UNIQUE KEY `idtags_UNIQUE` (`tagid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (5,'bitcoin'),(4,'cola'),(6,'cow'),(3,'diet'),(1,'funny'),(8,'Iphone'),(10,'kek'),(9,'mad'),(2,'not a funny'),(7,'rainbow');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blog_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-03  8:49:52
