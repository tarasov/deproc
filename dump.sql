-- MySQL dump 10.13  Distrib 5.1.62, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: deproc
-- ------------------------------------------------------
-- Server version	5.1.62-0ubuntu0.11.10.1

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
-- Table structure for table `absences`
--

DROP TABLE IF EXISTS `absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `absence` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absences_10d3e039` (`schedule_id`),
  KEY `absences_42ff452e` (`student_id`),
  CONSTRAINT `schedule_id_refs_id_57faa7e2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `student_id_refs_profile_ptr_id_45fe5e67` FOREIGN KEY (`student_id`) REFERENCES `students` (`profile_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absences`
--

LOCK TABLES `absences` WRITE;
/*!40000 ALTER TABLE `absences` DISABLE KEYS */;
/*!40000 ALTER TABLE `absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  `date_pub` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_42ff452e` (`student_id`),
  KEY `assessment_1079d5be` (`theme_id`),
  CONSTRAINT `student_id_refs_profile_ptr_id_2d859c6f` FOREIGN KEY (`student_id`) REFERENCES `students` (`profile_ptr_id`),
  CONSTRAINT `theme_id_refs_id_21b191e7` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add пользователь',9,'add_profile'),(26,'Can change пользователь',9,'change_profile'),(27,'Can delete пользователь',9,'delete_profile'),(28,'Can add студент',10,'add_students'),(29,'Can change студент',10,'change_students'),(30,'Can delete студент',10,'delete_students'),(31,'Can add преподователь',11,'add_teachers'),(32,'Can change преподователь',11,'change_teachers'),(33,'Can delete преподователь',11,'delete_teachers'),(34,'Can add статус',12,'add_userstatus'),(35,'Can change статус',12,'change_userstatus'),(36,'Can delete статус',12,'delete_userstatus'),(37,'Can add группа',13,'add_group'),(38,'Can change группа',13,'change_group'),(39,'Can delete группа',13,'delete_group'),(40,'Can add должность',14,'add_userpost'),(41,'Can change должность',14,'change_userpost'),(42,'Can delete должность',14,'delete_userpost'),(43,'Can add профессиональное образование',15,'add_po'),(44,'Can change профессиональное образование',15,'change_po'),(45,'Can delete профессиональное образование',15,'delete_po'),(46,'Can add специальность',16,'add_speciality'),(47,'Can change специальность',16,'change_speciality'),(48,'Can delete специальность',16,'delete_speciality'),(49,'Can add тип дисциплины',17,'add_disc_type'),(50,'Can change тип дисциплины',17,'change_disc_type'),(51,'Can delete тип дисциплины',17,'delete_disc_type'),(52,'Can add дисциплина',18,'add_discipline'),(53,'Can change дисциплина',18,'change_discipline'),(54,'Can delete дисциплина',18,'delete_discipline'),(55,'Can add учебный план',19,'add_uchplan'),(56,'Can change учебный план',19,'change_uchplan'),(57,'Can delete учебный план',19,'delete_uchplan'),(58,'Can add час учебного плана',20,'add_uchplanhour'),(59,'Can change час учебного плана',20,'change_uchplanhour'),(60,'Can delete час учебного плана',20,'delete_uchplanhour'),(61,'Can add учебный год',21,'add_year'),(62,'Can change учебный год',21,'change_year'),(63,'Can delete учебный год',21,'delete_year'),(64,'Can add группу студентов',22,'add_groups'),(65,'Can change группу студентов',22,'change_groups'),(66,'Can delete группу студентов',22,'delete_groups'),(67,'Can add студент группы',23,'add_groups_stud'),(68,'Can change студент группы',23,'change_groups_stud'),(69,'Can delete студент группы',23,'delete_groups_stud'),(70,'Can add план группы',24,'add_groups_plan'),(71,'Can change план группы',24,'change_groups_plan'),(72,'Can delete план группы',24,'delete_groups_plan'),(73,'Can add тарификация',25,'add_tariffication'),(74,'Can change тарификация',25,'change_tariffication'),(75,'Can delete тарификация',25,'delete_tariffication'),(76,'Can add кабинет',26,'add_classroom'),(77,'Can change кабинет',26,'change_classroom'),(78,'Can delete кабинет',26,'delete_classroom'),(79,'Can add день расписания',27,'add_schedule_day'),(80,'Can change день расписания',27,'change_schedule_day'),(81,'Can delete день расписания',27,'delete_schedule_day'),(82,'Can add расписание',28,'add_schedule'),(83,'Can change расписание',28,'change_schedule'),(84,'Can delete расписание',28,'delete_schedule'),(85,'Can add расписание на каждый день',29,'add_schedule_empty'),(86,'Can change расписание на каждый день',29,'change_schedule_empty'),(87,'Can delete расписание на каждый день',29,'delete_schedule_empty'),(88,'Can add расписание для преподавателя',30,'add_schedule_filled'),(89,'Can change расписание для преподавателя',30,'change_schedule_filled'),(90,'Can delete расписание для преподавателя',30,'delete_schedule_filled'),(91,'Can add пропуск',31,'add_absences'),(92,'Can change пропуск',31,'change_absences'),(93,'Can delete пропуск',31,'delete_absences'),(94,'Can add тип темы',32,'add_types_themes'),(95,'Can change тип темы',32,'change_types_themes'),(96,'Can delete тип темы',32,'delete_types_themes'),(97,'Can add тему',33,'add_themes'),(98,'Can change тему',33,'change_themes'),(99,'Can delete тему',33,'delete_themes'),(100,'Can add оценку',34,'add_assessment'),(101,'Can change оценку',34,'change_assessment'),(102,'Can delete оценку',34,'delete_assessment'),(124,'Can add пользователь',46,'add_profile'),(125,'Can change пользователь',46,'change_profile'),(126,'Can delete пользователь',46,'delete_profile'),(127,'Can add студента',37,'add_students'),(128,'Can change студента',37,'change_students'),(129,'Can delete студента',37,'delete_students'),(130,'Can add преподователя',38,'add_teachers'),(131,'Can change преподователя',38,'change_teachers'),(132,'Can delete преподователя',38,'delete_teachers'),(133,'Can add статус',36,'add_userstatus'),(134,'Can change статус',36,'change_userstatus'),(135,'Can delete статус',36,'delete_userstatus'),(136,'Can add группа',47,'add_group'),(137,'Can change группа',47,'change_group'),(138,'Can delete группа',47,'delete_group'),(139,'Can add должность',35,'add_userpost'),(140,'Can change должность',35,'change_userpost'),(141,'Can delete должность',35,'delete_userpost'),(142,'Can add профессиональное образование',48,'add_po'),(143,'Can change профессиональное образование',48,'change_po'),(144,'Can delete профессиональное образование',48,'delete_po'),(145,'Can add специальность',42,'add_speciality'),(146,'Can change специальность',42,'change_speciality'),(147,'Can delete специальность',42,'delete_speciality'),(148,'Can add тип дисциплины',45,'add_disc_type'),(149,'Can change тип дисциплины',45,'change_disc_type'),(150,'Can delete тип дисциплины',45,'delete_disc_type'),(151,'Can add дисциплина',44,'add_discipline'),(152,'Can change дисциплина',44,'change_discipline'),(153,'Can delete дисциплина',44,'delete_discipline'),(154,'Can add учебный план',43,'add_uchplan'),(155,'Can change учебный план',43,'change_uchplan'),(156,'Can delete учебный план',43,'delete_uchplan'),(157,'Can add час учебного плана',49,'add_uchplanhour'),(158,'Can change час учебного плана',49,'change_uchplanhour'),(159,'Can delete час учебного плана',49,'delete_uchplanhour'),(160,'Can add учебный год',40,'add_year'),(161,'Can change учебный год',40,'change_year'),(162,'Can delete учебный год',40,'delete_year'),(163,'Can add группу студентов',41,'add_groups'),(164,'Can change группу студентов',41,'change_groups'),(165,'Can delete группу студентов',41,'delete_groups'),(166,'Can add студент группы',50,'add_groups_stud'),(167,'Can change студент группы',50,'change_groups_stud'),(168,'Can delete студент группы',50,'delete_groups_stud'),(169,'Can add план группы',39,'add_groups_plan'),(170,'Can change план группы',39,'change_groups_plan'),(171,'Can delete план группы',39,'delete_groups_plan'),(172,'Can add тарификация',51,'add_tariffication'),(173,'Can change тарификация',51,'change_tariffication'),(174,'Can delete тарификация',51,'delete_tariffication');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (8,'admin','','','admin@admin.ru','pbkdf2_sha256$10000$4dzLIucoNoXR$f5NqmOq0zqVqn4mvdEk3BHRD6bh8SGbHOY1xQf8WOP0=',1,1,1,'2012-04-29 20:28:13','2012-04-29 19:13:48'),(9,'ruslan','Руслан','Тарасов','','pbkdf2_sha256$10000$vT6KP8iqg2jw$mwNe5EfbO2lj1WMUID0R+qKvqdByybpxawfp3SEU93o=',0,1,0,'2012-04-29 19:19:39','2012-04-29 19:19:39'),(10,'pasha','Павел','Гаврилов','','pbkdf2_sha256$10000$uSOMGBqRUeT2$nq7O5izw4ZecdMbE0QLVpsC0lRC2g0syke6a/d7UrGI=',0,1,0,'2012-04-29 19:20:35','2012-04-29 19:20:35'),(11,'vahromeev','Виталий','Вахромеев','','pbkdf2_sha256$10000$BAI8hrhG7nVQ$+zdgbiiTm7LCctlr4nPb0rmObNkIayusG8+ZM/lsC7w=',1,1,0,'2012-04-29 20:29:24','2012-04-29 19:21:25'),(12,'zhivoderova','','Живодерова','','pbkdf2_sha256$10000$7CsW60R5rXRL$0Txyngkbm7nTsp8Tz+KVkKkhaTpWvguqvEZcd/ACBkk=',0,1,0,'2012-04-29 19:22:35','2012-04-29 19:22:35');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disc_type`
--

DROP TABLE IF EXISTS `disc_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disc_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disc_type`
--

LOCK TABLES `disc_type` WRITE;
/*!40000 ALTER TABLE `disc_type` DISABLE KEYS */;
INSERT INTO `disc_type` VALUES (2,'Дисциплина');
/*!40000 ALTER TABLE `disc_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discipline_777d41c8` (`type_id`),
  CONSTRAINT `type_id_refs_id_43d4e7ea` FOREIGN KEY (`type_id`) REFERENCES `disc_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` VALUES (6,'Программное обеспечение компьютерных сетей','ПОКС',2),(7,'Технология разработки программных продуктов','ТРПП',2),(8,'Информационная безопасность','ИБ',2),(9,'Базы данных','БД',2),(10,'Физика','Физика',2);
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (236,'2012-04-29 19:17:55',8,36,'1','работник',1,''),(237,'2012-04-29 19:17:55',8,36,'2','работник',1,''),(238,'2012-04-29 19:18:00',8,35,'1','admin',1,''),(239,'2012-04-29 19:20:32',8,37,'9','Тарасов Руслан ',1,''),(240,'2012-04-29 19:21:05',8,37,'10','Гаврилов Павел ',1,''),(241,'2012-04-29 19:22:20',8,38,'11','Вахромеев Виталий ',1,''),(242,'2012-04-29 19:24:43',8,38,'12','Живодерова  ',1,''),(243,'2012-04-29 19:26:07',8,40,'2','2011-09-01 2012-06-30',1,''),(244,'2012-04-29 19:27:08',8,42,'4','Программное обеспечение вычислительной техники и автоматизированных систем 230105.0',1,''),(245,'2012-04-29 19:27:31',8,41,'11','808',1,''),(246,'2012-04-29 19:27:40',8,41,'12','809',1,''),(247,'2012-04-29 19:32:18',8,39,'7','808 / 4 курc',1,''),(248,'2012-04-29 19:32:25',8,39,'8','809 / 3 курc',1,''),(249,'2012-04-29 19:35:52',8,42,'5','Организация обслуживания в общественном питании 1.0',1,''),(250,'2012-04-29 19:36:21',8,41,'13','108',1,''),(251,'2012-04-29 19:37:04',8,41,'14','109',1,''),(252,'2012-04-29 19:37:26',8,41,'15','110',1,''),(253,'2012-04-29 19:37:35',8,41,'16','111',1,''),(254,'2012-04-29 19:40:12',8,42,'6','Реклама 324001.0',1,''),(255,'2012-04-29 19:40:38',8,41,'17','711',1,''),(256,'2012-04-29 19:40:45',8,41,'18','710',1,''),(257,'2012-04-29 19:40:53',8,41,'19','709',1,''),(258,'2012-04-29 19:52:18',8,45,'2','Дисциплина',1,''),(259,'2012-04-29 19:52:25',8,44,'6','ПОКС',1,''),(260,'2012-04-29 19:53:02',8,44,'7','ТРПП',1,''),(261,'2012-04-29 19:54:06',8,44,'8','ИБ',1,''),(262,'2012-04-29 19:54:53',8,44,'9','БД',1,''),(263,'2012-04-29 19:55:07',8,44,'10','Физика',1,''),(264,'2012-04-29 19:58:58',8,43,'11','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(265,'2012-04-29 19:59:05',8,43,'12','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(266,'2012-04-29 20:05:24',8,39,'9','711 / 1 курc',1,''),(267,'2012-04-29 20:05:32',8,39,'10','710 / 2 курc',1,''),(268,'2012-04-29 20:06:38',8,43,'13','ТРПП / Реклама / 1 семестр',1,''),(269,'2012-04-29 20:06:46',8,43,'14','ТРПП / Реклама / 2 семестр',1,''),(270,'2012-04-29 20:28:37',8,3,'11','vahromeev',2,'Изменен password и is_staff.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'пользователь','main','profile'),(10,'студент','main','students'),(11,'преподователь','main','teachers'),(12,'статус','main','userstatus'),(13,'группа','main','group'),(14,'должность','main','userpost'),(15,'профессиональное образование','main','po'),(16,'специальность','main','speciality'),(17,'тип дисциплины','main','disc_type'),(18,'дисциплина','main','discipline'),(19,'учебный план','main','uchplan'),(20,'час учебного плана','main','uchplanhour'),(21,'учебный год','main','year'),(22,'группу студентов','main','groups'),(23,'студент группы','main','groups_stud'),(24,'план группы','main','groups_plan'),(25,'тарификация','main','tariffication'),(26,'кабинет','schedule','classroom'),(27,'день расписания','schedule','schedule_day'),(28,'расписание','schedule','schedule'),(29,'расписание на каждый день','schedule','schedule_empty'),(30,'расписание для преподавателя','schedule','schedule_filled'),(31,'пропуск','schedule','absences'),(32,'тип темы','journal','types_themes'),(33,'тему','journal','themes'),(34,'оценку','journal','assessment'),(35,'должность','tariffication','userpost'),(36,'статус','tariffication','userstatus'),(37,'студент','tariffication','students'),(38,'преподователя','tariffication','teachers'),(39,'план группы','tariffication','groups_plan'),(40,'учебный год','tariffication','year'),(41,'группу студентов','tariffication','groups'),(42,'специальность','tariffication','speciality'),(43,'учебный план','tariffication','uchplan'),(44,'дисциплина','tariffication','discipline'),(45,'тип дисциплины','tariffication','disc_type'),(46,'пользователь','tariffication','profile'),(47,'группа','tariffication','group'),(48,'профессиональное образование','tariffication','po'),(49,'час учебного плана','tariffication','uchplanhour'),(50,'студент группы','tariffication','groups_stud'),(51,'тарификация','tariffication','tariffication');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0f5dd281919437a255e13a0fbea5ee2c','MmRkYTM4NzIzNzNkZDBkNDg0YmYyMDkyZjBiNjRhZjFjNGM1N2I1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQt1Lg==\n','2012-05-13 20:29:24'),('e62b37906f79bfdcace75d6047127588','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-13 20:29:00');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_ptr_id` int(11) NOT NULL,
  `describe` varchar(150) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  CONSTRAINT `group_ptr_id_refs_id_2690094b` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_status`
--

DROP TABLE IF EXISTS `group_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `userstatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`userstatus_id`),
  KEY `group_status_425ae3c4` (`group_id`),
  KEY `group_status_1f306917` (`userstatus_id`),
  CONSTRAINT `group_id_refs_group_ptr_id_23a4540f` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_ptr_id`),
  CONSTRAINT `userstatus_id_refs_id_6635e41a` FOREIGN KEY (`userstatus_id`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_status`
--

LOCK TABLES `group_status` WRITE;
/*!40000 ALTER TABLE `group_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `semestr` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `groups_1d8e9887` (`spec_id`),
  CONSTRAINT `spec_id_refs_id_2317142e` FOREIGN KEY (`spec_id`) REFERENCES `speciality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (11,4,808,'7, 8'),(12,4,809,'5, 6'),(13,5,108,'7, 8'),(14,5,109,'5, 6'),(15,5,110,'3, 4'),(16,5,111,'1, 2'),(17,6,711,'1, 2'),(18,6,710,'3, 4'),(19,6,709,'5, 6');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_plan`
--

DROP TABLE IF EXISTS `groups_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_plan_15a19819` (`year_id`),
  KEY `groups_plan_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_285979b8` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `year_id_refs_id_782d46b` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_plan`
--

LOCK TABLES `groups_plan` WRITE;
/*!40000 ALTER TABLE `groups_plan` DISABLE KEYS */;
INSERT INTO `groups_plan` VALUES (7,2,11,4),(8,2,12,3),(9,2,17,1),(10,2,18,2);
/*!40000 ALTER TABLE `groups_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_stud`
--

DROP TABLE IF EXISTS `groups_stud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_stud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_stud_425ae3c4` (`group_id`),
  KEY `groups_stud_42ff452e` (`student_id`),
  CONSTRAINT `group_id_refs_id_19713723` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `student_id_refs_profile_ptr_id_2c9906b9` FOREIGN KEY (`student_id`) REFERENCES `students` (`profile_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_stud`
--

LOCK TABLES `groups_stud` WRITE;
/*!40000 ALTER TABLE `groups_stud` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_stud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po`
--

DROP TABLE IF EXISTS `po`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po`
--

LOCK TABLES `po` WRITE;
/*!40000 ALTER TABLE `po` DISABLE KEYS */;
/*!40000 ALTER TABLE `po` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_ptr_id` int(11) NOT NULL,
  `other_name` varchar(100) DEFAULT NULL,
  `b_day` date DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `user_ptr_id_refs_id_59efa1d8` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (9,'',NULL,'',NULL),(10,'',NULL,'',NULL),(11,'',NULL,'',NULL),(12,'',NULL,'',NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `day_id` int(11) NOT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `num_less` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_5a80280f` (`plan_id`),
  KEY `schedule_2831cc73` (`day_id`),
  KEY `schedule_3fa87ba8` (`classroom_id`),
  CONSTRAINT `classroom_id_refs_id_5193473c` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `day_id_refs_id_71dbb36c` FOREIGN KEY (`day_id`) REFERENCES `schedule_day` (`id`),
  CONSTRAINT `plan_id_refs_id_a121fc8` FOREIGN KEY (`plan_id`) REFERENCES `tariffication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_day`
--

DROP TABLE IF EXISTS `schedule_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `real` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_day`
--

LOCK TABLES `schedule_day` WRITE;
/*!40000 ALTER TABLE `schedule_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_empty`
--

DROP TABLE IF EXISTS `schedule_empty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_empty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `num_less` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_empty_425ae3c4` (`group_id`),
  KEY `schedule_empty_2831cc73` (`day_id`),
  CONSTRAINT `day_id_refs_id_10e90834` FOREIGN KEY (`day_id`) REFERENCES `schedule_day` (`id`),
  CONSTRAINT `group_id_refs_id_21797e06` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_empty`
--

LOCK TABLES `schedule_empty` WRITE;
/*!40000 ALTER TABLE `schedule_empty` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_filled`
--

DROP TABLE IF EXISTS `schedule_filled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_filled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_filled_6d25d6e2` (`lesson_id`),
  KEY `schedule_filled_5a80280f` (`plan_id`),
  KEY `schedule_filled_3fa87ba8` (`classroom_id`),
  CONSTRAINT `classroom_id_refs_id_6705ee86` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `lesson_id_refs_id_6527c6e9` FOREIGN KEY (`lesson_id`) REFERENCES `schedule_empty` (`id`),
  CONSTRAINT `plan_id_refs_id_6dc6ce8a` FOREIGN KEY (`plan_id`) REFERENCES `tariffication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_filled`
--

LOCK TABLES `schedule_filled` WRITE;
/*!40000 ALTER TABLE `schedule_filled` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_filled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speciality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `num_spec` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (4,'Программное обеспечение вычислительной техники и автоматизированных систем',230105),(5,'Организация обслуживания в общественном питании',324001),(6,'Реклама',324001);
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `profile_ptr_id` int(11) NOT NULL,
  `cart` int(11) NOT NULL,
  PRIMARY KEY (`profile_ptr_id`),
  CONSTRAINT `profile_ptr_id_refs_user_ptr_id_18ce0375` FOREIGN KEY (`profile_ptr_id`) REFERENCES `profile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (9,2997),(10,2983);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariffication`
--

DROP TABLE IF EXISTS `tariffication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tariffication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `group_plan_id` int(11) NOT NULL,
  `uch_plan_hour_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tariffication_161e15c3` (`teacher_id`),
  KEY `tariffication_7327f7d1` (`group_plan_id`),
  KEY `tariffication_3ec7b602` (`uch_plan_hour_id`),
  CONSTRAINT `group_plan_id_refs_id_40a3b70` FOREIGN KEY (`group_plan_id`) REFERENCES `groups_plan` (`id`),
  CONSTRAINT `teacher_id_refs_profile_ptr_id_45d76bd0` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`profile_ptr_id`),
  CONSTRAINT `uch_plan_hour_id_refs_id_1dbd13c1` FOREIGN KEY (`uch_plan_hour_id`) REFERENCES `uch_plan_hour` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffication`
--

LOCK TABLES `tariffication` WRITE;
/*!40000 ALTER TABLE `tariffication` DISABLE KEYS */;
INSERT INTO `tariffication` VALUES (18,11,7,21),(19,11,7,22),(20,11,7,23),(21,11,7,24),(22,11,7,25),(23,11,7,26),(24,11,7,27),(25,11,7,28),(26,12,9,29),(27,12,9,30),(28,12,9,31),(29,12,9,32),(30,12,9,33),(31,12,9,34),(32,12,9,35),(33,12,9,36);
/*!40000 ALTER TABLE `tariffication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `profile_ptr_id` int(11) NOT NULL,
  `cabinet` int(11) NOT NULL,
  PRIMARY KEY (`profile_ptr_id`),
  CONSTRAINT `profile_ptr_id_refs_user_ptr_id_2470ed9a` FOREIGN KEY (`profile_ptr_id`) REFERENCES `profile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (11,207),(12,203);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `describe` varchar(255) NOT NULL,
  `tariffication_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `date_pub` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `themes_34300164` (`tariffication_id`),
  KEY `themes_777d41c8` (`type_id`),
  CONSTRAINT `tariffication_id_refs_id_33fc29cf` FOREIGN KEY (`tariffication_id`) REFERENCES `tariffication` (`id`),
  CONSTRAINT `type_id_refs_id_146df0b7` FOREIGN KEY (`type_id`) REFERENCES `types_themes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_themes`
--

DROP TABLE IF EXISTS `types_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_themes`
--

LOCK TABLES `types_themes` WRITE;
/*!40000 ALTER TABLE `types_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uch_plan`
--

DROP TABLE IF EXISTS `uch_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uch_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disc_id` int(11) NOT NULL,
  `spec_id` int(11) NOT NULL,
  `semestr` int(11) NOT NULL,
  `otch` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uch_plan_432800c5` (`disc_id`),
  KEY `uch_plan_1d8e9887` (`spec_id`),
  CONSTRAINT `disc_id_refs_id_12b66d61` FOREIGN KEY (`disc_id`) REFERENCES `discipline` (`id`),
  CONSTRAINT `spec_id_refs_id_12ccd756` FOREIGN KEY (`spec_id`) REFERENCES `speciality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan`
--

LOCK TABLES `uch_plan` WRITE;
/*!40000 ALTER TABLE `uch_plan` DISABLE KEYS */;
INSERT INTO `uch_plan` VALUES (11,6,4,7,NULL),(12,6,4,8,NULL),(13,7,6,1,NULL),(14,7,6,2,NULL);
/*!40000 ALTER TABLE `uch_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uch_plan_hour`
--

DROP TABLE IF EXISTS `uch_plan_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uch_plan_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uch_plan_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `count_hours` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uch_plan_hour_f8da33a` (`uch_plan_id`),
  CONSTRAINT `uch_plan_id_refs_id_54233f09` FOREIGN KEY (`uch_plan_id`) REFERENCES `uch_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan_hour`
--

LOCK TABLES `uch_plan_hour` WRITE;
/*!40000 ALTER TABLE `uch_plan_hour` DISABLE KEYS */;
INSERT INTO `uch_plan_hour` VALUES (21,11,'L',170),(22,11,'P',70),(23,11,'S',0),(24,11,'E',0),(25,12,'L',120),(26,12,'P',70),(27,12,'S',8),(28,12,'E',12),(29,13,'L',170),(30,13,'P',40),(31,13,'S',0),(32,13,'E',0),(33,14,'L',50),(34,14,'P',0),(35,14,'S',8),(36,14,'E',12);
/*!40000 ALTER TABLE `uch_plan_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_post_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_5f095de3` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
INSERT INTO `user_post` VALUES (1,8,'2012-04-29',NULL);
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post_status`
--

DROP TABLE IF EXISTS `user_post_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userpost_id` int(11) NOT NULL,
  `userstatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpost_id` (`userpost_id`,`userstatus_id`),
  KEY `user_post_status_38fa4dc1` (`userpost_id`),
  KEY `user_post_status_1f306917` (`userstatus_id`),
  CONSTRAINT `userpost_id_refs_id_28eaa4c1` FOREIGN KEY (`userpost_id`) REFERENCES `user_post` (`id`),
  CONSTRAINT `userstatus_id_refs_id_56f159d9` FOREIGN KEY (`userstatus_id`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post_status`
--

LOCK TABLES `user_post_status` WRITE;
/*!40000 ALTER TABLE `user_post_status` DISABLE KEYS */;
INSERT INTO `user_post_status` VALUES (1,1,2);
/*!40000 ALTER TABLE `user_post_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (1,'работник'),(2,'работник');
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (2,'2011-09-01','2012-06-30');
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-29 20:45:47
