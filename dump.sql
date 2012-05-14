-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: deproc
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
  `date_pub` datetime NOT NULL,
  `theme_of_day_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_42ff452e` (`student_id`),
  KEY `assessment_6f7f52f2` (`theme_of_day_id`),
  CONSTRAINT `student_id_refs_profile_ptr_id_2d859c6f` FOREIGN KEY (`student_id`) REFERENCES `students` (`profile_ptr_id`),
  CONSTRAINT `theme_of_day_id_refs_id_52914d51` FOREIGN KEY (`theme_of_day_id`) REFERENCES `theme_of_day` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add пользователь',9,'add_profile'),(26,'Can change пользователь',9,'change_profile'),(27,'Can delete пользователь',9,'delete_profile'),(28,'Can add студент',10,'add_students'),(29,'Can change студент',10,'change_students'),(30,'Can delete студент',10,'delete_students'),(31,'Can add преподователь',11,'add_teachers'),(32,'Can change преподователь',11,'change_teachers'),(33,'Can delete преподователь',11,'delete_teachers'),(34,'Can add статус',12,'add_userstatus'),(35,'Can change статус',12,'change_userstatus'),(36,'Can delete статус',12,'delete_userstatus'),(37,'Can add группа',13,'add_group'),(38,'Can change группа',13,'change_group'),(39,'Can delete группа',13,'delete_group'),(40,'Can add должность',14,'add_userpost'),(41,'Can change должность',14,'change_userpost'),(42,'Can delete должность',14,'delete_userpost'),(43,'Can add профессиональное образование',15,'add_po'),(44,'Can change профессиональное образование',15,'change_po'),(45,'Can delete профессиональное образование',15,'delete_po'),(46,'Can add специальность',16,'add_speciality'),(47,'Can change специальность',16,'change_speciality'),(48,'Can delete специальность',16,'delete_speciality'),(49,'Can add тип дисциплины',17,'add_disc_type'),(50,'Can change тип дисциплины',17,'change_disc_type'),(51,'Can delete тип дисциплины',17,'delete_disc_type'),(52,'Can add дисциплина',18,'add_discipline'),(53,'Can change дисциплина',18,'change_discipline'),(54,'Can delete дисциплина',18,'delete_discipline'),(55,'Can add учебный план',19,'add_uchplan'),(56,'Can change учебный план',19,'change_uchplan'),(57,'Can delete учебный план',19,'delete_uchplan'),(58,'Can add час учебного плана',20,'add_uchplanhour'),(59,'Can change час учебного плана',20,'change_uchplanhour'),(60,'Can delete час учебного плана',20,'delete_uchplanhour'),(61,'Can add учебный год',21,'add_year'),(62,'Can change учебный год',21,'change_year'),(63,'Can delete учебный год',21,'delete_year'),(64,'Can add группу студентов',22,'add_groups'),(65,'Can change группу студентов',22,'change_groups'),(66,'Can delete группу студентов',22,'delete_groups'),(67,'Can add студент группы',23,'add_groups_stud'),(68,'Can change студент группы',23,'change_groups_stud'),(69,'Can delete студент группы',23,'delete_groups_stud'),(70,'Can add план группы',24,'add_groups_plan'),(71,'Can change план группы',24,'change_groups_plan'),(72,'Can delete план группы',24,'delete_groups_plan'),(73,'Can add тарификация',25,'add_tariffication'),(74,'Can change тарификация',25,'change_tariffication'),(75,'Can delete тарификация',25,'delete_tariffication'),(76,'Can add кабинет',26,'add_classroom'),(77,'Can change кабинет',26,'change_classroom'),(78,'Can delete кабинет',26,'delete_classroom'),(79,'Can add день расписания',27,'add_schedule_day'),(80,'Can change день расписания',27,'change_schedule_day'),(81,'Can delete день расписания',27,'delete_schedule_day'),(82,'Can add расписание',28,'add_schedule'),(83,'Can change расписание',28,'change_schedule'),(84,'Can delete расписание',28,'delete_schedule'),(85,'Can add расписание на каждый день',29,'add_schedule_empty'),(86,'Can change расписание на каждый день',29,'change_schedule_empty'),(87,'Can delete расписание на каждый день',29,'delete_schedule_empty'),(88,'Can add расписание для преподавателя',30,'add_schedule_filled'),(89,'Can change расписание для преподавателя',30,'change_schedule_filled'),(90,'Can delete расписание для преподавателя',30,'delete_schedule_filled'),(91,'Can add пропуск',31,'add_absences'),(92,'Can change пропуск',31,'change_absences'),(93,'Can delete пропуск',31,'delete_absences'),(94,'Can add тип темы',32,'add_types_themes'),(95,'Can change тип темы',32,'change_types_themes'),(96,'Can delete тип темы',32,'delete_types_themes'),(97,'Can add тему',33,'add_themes'),(98,'Can change тему',33,'change_themes'),(99,'Can delete тему',33,'delete_themes'),(100,'Can add оценку',34,'add_assessment'),(101,'Can change оценку',34,'change_assessment'),(102,'Can delete оценку',34,'delete_assessment'),(124,'Can add пользователь',46,'add_profile'),(125,'Can change пользователь',46,'change_profile'),(126,'Can delete пользователь',46,'delete_profile'),(127,'Can add студента',37,'add_students'),(128,'Can change студента',37,'change_students'),(129,'Can delete студента',37,'delete_students'),(130,'Can add преподователя',38,'add_teachers'),(131,'Can change преподователя',38,'change_teachers'),(132,'Can delete преподователя',38,'delete_teachers'),(133,'Can add статус',36,'add_userstatus'),(134,'Can change статус',36,'change_userstatus'),(135,'Can delete статус',36,'delete_userstatus'),(136,'Can add группа',47,'add_group'),(137,'Can change группа',47,'change_group'),(138,'Can delete группа',47,'delete_group'),(139,'Can add должность',35,'add_userpost'),(140,'Can change должность',35,'change_userpost'),(141,'Can delete должность',35,'delete_userpost'),(142,'Can add профессиональное образование',48,'add_po'),(143,'Can change профессиональное образование',48,'change_po'),(144,'Can delete профессиональное образование',48,'delete_po'),(145,'Can add специальность',42,'add_speciality'),(146,'Can change специальность',42,'change_speciality'),(147,'Can delete специальность',42,'delete_speciality'),(148,'Can add тип дисциплины',45,'add_disc_type'),(149,'Can change тип дисциплины',45,'change_disc_type'),(150,'Can delete тип дисциплины',45,'delete_disc_type'),(151,'Can add дисциплина',44,'add_discipline'),(152,'Can change дисциплина',44,'change_discipline'),(153,'Can delete дисциплина',44,'delete_discipline'),(154,'Can add учебный план',43,'add_uchplan'),(155,'Can change учебный план',43,'change_uchplan'),(156,'Can delete учебный план',43,'delete_uchplan'),(157,'Can add час учебного плана',49,'add_uchplanhour'),(158,'Can change час учебного плана',49,'change_uchplanhour'),(159,'Can delete час учебного плана',49,'delete_uchplanhour'),(160,'Can add учебный год',40,'add_year'),(161,'Can change учебный год',40,'change_year'),(162,'Can delete учебный год',40,'delete_year'),(163,'Can add группу студентов',41,'add_groups'),(164,'Can change группу студентов',41,'change_groups'),(165,'Can delete группу студентов',41,'delete_groups'),(166,'Can add студент группы',50,'add_groups_stud'),(167,'Can change студент группы',50,'change_groups_stud'),(168,'Can delete студент группы',50,'delete_groups_stud'),(169,'Can add план группы',39,'add_groups_plan'),(170,'Can change план группы',39,'change_groups_plan'),(171,'Can delete план группы',39,'delete_groups_plan'),(172,'Can add тарификация',51,'add_tariffication'),(173,'Can change тарификация',51,'change_tariffication'),(174,'Can delete тарификация',51,'delete_tariffication'),(175,'Can add номер пары',52,'add_number_lesson'),(176,'Can change номер пары',52,'change_number_lesson'),(177,'Can delete номер пары',52,'delete_number_lesson'),(178,'Can add день',53,'add_theme_of_day'),(179,'Can change день',53,'change_theme_of_day'),(180,'Can delete день',53,'delete_theme_of_day'),(181,'Can add кабинет',54,'add_classroom'),(182,'Can change кабинет',54,'change_classroom'),(183,'Can delete кабинет',54,'delete_classroom'),(184,'Can add тип часа',55,'add_typehour'),(185,'Can change тип часа',55,'change_typehour'),(186,'Can delete тип часа',55,'delete_typehour');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (8,'admin','','','admin@admin.ru','pbkdf2_sha256$10000$4dzLIucoNoXR$f5NqmOq0zqVqn4mvdEk3BHRD6bh8SGbHOY1xQf8WOP0=',1,1,1,'2012-05-14 17:20:09','2012-04-29 19:13:48'),(9,'ruslan','Руслан','Тарасов','','pbkdf2_sha256$10000$vT6KP8iqg2jw$mwNe5EfbO2lj1WMUID0R+qKvqdByybpxawfp3SEU93o=',0,1,0,'2012-04-29 19:19:39','2012-04-29 19:19:39'),(10,'pasha','Павел','Гаврилов','','pbkdf2_sha256$10000$uSOMGBqRUeT2$nq7O5izw4ZecdMbE0QLVpsC0lRC2g0syke6a/d7UrGI=',0,1,0,'2012-04-29 19:20:35','2012-04-29 19:20:35'),(11,'vahromeev','Виталий','Вахромеев','','pbkdf2_sha256$10000$BAI8hrhG7nVQ$+zdgbiiTm7LCctlr4nPb0rmObNkIayusG8+ZM/lsC7w=',1,1,0,'2012-05-12 11:06:45','2012-04-29 19:21:25'),(12,'zhivoderova','Валентина','Живодерова','','pbkdf2_sha256$10000$7CsW60R5rXRL$0Txyngkbm7nTsp8Tz+KVkKkhaTpWvguqvEZcd/ACBkk=',0,1,0,'2012-04-29 19:22:35','2012-04-29 19:22:35'),(13,'lazareva','Юлия','Лазарева','','pbkdf2_sha256$10000$ggg2LNfXTuNY$sRXcmjtTgVu2QZO3A6oTLBZXGKJbNTpIj/BOHutNZtg=',0,1,0,'2012-05-04 08:51:37','2012-05-04 08:51:37'),(14,'gavrilova','Надежда','Гаврилова','','123',0,1,0,'2012-05-04 08:53:03','2012-05-04 08:53:03'),(15,'masalova','Евгения','Масалова','','123',1,1,0,'2012-05-07 16:56:37','2012-05-07 16:56:37'),(16,'podkolzina','Анджела','Подколзина','','123',0,1,0,'2012-05-07 16:57:30','2012-05-07 16:57:30'),(17,'anashkina','Ольга ','Анашкина','','123',1,1,0,'2012-05-11 11:24:02','2012-05-11 11:24:02'),(18,'antonov','Владимир','Антонов','','123',0,1,0,'2012-05-11 11:25:30','2012-05-11 11:25:30'),(19,'vinogradova','Оксана','Виноградова','','123',1,1,0,'2012-05-11 11:28:32','2012-05-11 11:28:32'),(20,'pahomova','Наталья','Пахомова','','123',0,1,0,'2012-05-11 11:29:15','2012-05-11 11:29:15'),(21,'slepuzhnikova','Марина','Слепужникова','','123',0,1,0,'2012-05-11 11:29:56','2012-05-11 11:29:56'),(22,'hodyuk','Михаил','Ходюк','','123',0,1,0,'2012-05-11 11:30:45','2012-05-11 11:30:45'),(23,'baklanova','Раиса','Бакланова','','123',0,1,0,'2012-05-11 11:31:26','2012-05-11 11:31:26'),(24,'barinov','Василий','Баринов','','123',1,1,0,'2012-05-11 11:32:15','2012-05-11 11:32:15'),(25,'bogdanov','Сергей','Богданов','','123',0,1,0,'2012-05-11 11:33:03','2012-05-11 11:33:03'),(26,'vinokurova','Наталья','Винокурова','','123',0,1,0,'2012-05-11 21:50:41','2012-05-11 21:50:41'),(27,'vihlyaeva','Надежда','Вихляева','','123',0,1,0,'2012-05-11 21:54:51','2012-05-11 21:54:51'),(28,'zhideeva','Светлана','Жидеева','','123',0,1,0,'2012-05-13 00:49:47','2012-05-13 00:49:47'),(29,'rachkova','Анастасия','Рачкова','','123',0,1,0,'2012-05-13 02:02:05','2012-05-13 02:02:05'),(30,'kryuchkova','Светлана','Крючкова','','123',0,1,0,'2012-05-13 18:48:07','2012-05-13 18:48:07'),(31,'kulichev','Евгений','Куличев','','123',0,1,0,'2012-05-13 18:48:59','2012-05-13 18:48:59'),(33,'sizova','Ирина','Сизова','','123',0,1,0,'2012-05-13 18:50:25','2012-05-13 18:50:25'),(34,'oborotova','Татьяна','Оборотова','','123',0,1,0,'2012-05-13 18:55:35','2012-05-13 18:55:35'),(35,'obolenskiy','Евгений','Оболенский','','123',0,1,0,'2012-05-13 20:04:33','2012-05-13 20:04:33'),(36,'sachkova','Галина','Сачкова','','123',1,1,0,'2012-05-13 20:05:12','2012-05-13 20:05:12'),(37,'sengeleicev','Юрий','Сенгилейцев','','123',0,1,0,'2012-05-13 20:05:55','2012-05-13 20:05:55'),(38,'semenenko','Любовь','Семененко','','123',0,1,0,'2012-05-13 20:06:48','2012-05-13 20:06:48'),(39,'nedoseikina','Марина','Недосекина','','123',1,1,0,'2012-05-13 20:07:26','2012-05-13 20:07:26'),(40,'gusarova','Галина','Гусарова','','123',0,1,0,'2012-05-13 20:08:19','2012-05-13 20:08:19');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES (5,301),(6,302),(7,201),(8,201),(9,216),(10,214),(11,404);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` VALUES (14,'Физическая культура','Физ-ра',2),(15,'Информатика','Информатика',2),(16,'Немецкий язык','Немецкий язык',2),(17,'Физика','Физика',2),(18,'Литература','Литература',2),(19,'Русский язык','Русский язык',2),(20,'Английский язык','Английский язык',2),(21,'Химия','Химия',2),(22,'Биология с основами экологии','Биология/Экология',2),(23,'Обществознание','Общество',2),(24,'История','История',2),(25,'Математика','Математика',2),(26,'Основы безопасности жизнедеятельности','О.Б.Ж',2),(27,'Техническая механика','Тех механика',2),(28,'Инженерная графика','Инж графика',2),(29,'Основы социологии и политологии','Осн соц и полит',2),(30,'Краеведение','Краеведение',2),(31,'Русский язык и культура речи','Рус яз и культ речи',2),(32,'Автомобили','Автомобили',2),(33,'Электротехника и электроника','Электротехника',2),(34,'Материаловедение','Материаловедение',2),(35,'Основы экономики','Осн экономики',2),(36,'Основы права','Основы права',2),(37,'Экологические основы природопользования','Эколог осн природ',2),(38,'Информационные технологии в профессиональной деятельности','Инф тех в проф деят',2),(39,'Немецкий язык профессиональный','Немец язык проф',2),(40,'Английский язык профессиональный','Англ язык проф',2),(41,'Организация обслуживания','Орг обслуживания',2),(42,'Валютно финансовые операции','Валют фин операции',2),(43,'Организация управлением малым предприятием','Орг упр мал пред',2),(44,'Иностранный туризм','Иностранный тур',2),(45,'Охрана труда','Охрана труда',2),(46,'Экономика отрасли','Экономика отр',2),(47,'Бухгалтерский учет в общественном питании','Бух уч в общест пит',2),(48,'Документационное обеспечение управления','ДОУ',2),(49,'Правовое обеспечение в профессиональной деятельности','ПОПД',2),(50,'Профессиональная эстетика','Проф эстетика',2),(51,'Организация и технология отрасли','Орг и техн отрасли',2),(52,'Кулинария и кондитерская продукция общественного питания','Кулинария',2),(53,'Безопасность жизнедеятельности','БЖ',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=782 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (236,'2012-04-29 19:17:55',8,36,'1','работник',1,''),(237,'2012-04-29 19:17:55',8,36,'2','работник',1,''),(238,'2012-04-29 19:18:00',8,35,'1','admin',1,''),(239,'2012-04-29 19:20:32',8,37,'9','Тарасов Руслан ',1,''),(240,'2012-04-29 19:21:05',8,37,'10','Гаврилов Павел ',1,''),(241,'2012-04-29 19:22:20',8,38,'11','Вахромеев Виталий ',1,''),(242,'2012-04-29 19:24:43',8,38,'12','Живодерова  ',1,''),(243,'2012-04-29 19:26:07',8,40,'2','2011-09-01 2012-06-30',1,''),(244,'2012-04-29 19:27:08',8,42,'4','Программное обеспечение вычислительной техники и автоматизированных систем 230105.0',1,''),(245,'2012-04-29 19:27:31',8,41,'11','808',1,''),(246,'2012-04-29 19:27:40',8,41,'12','809',1,''),(247,'2012-04-29 19:32:18',8,39,'7','808 / 4 курc',1,''),(248,'2012-04-29 19:32:25',8,39,'8','809 / 3 курc',1,''),(249,'2012-04-29 19:35:52',8,42,'5','Организация обслуживания в общественном питании 1.0',1,''),(250,'2012-04-29 19:36:21',8,41,'13','108',1,''),(251,'2012-04-29 19:37:04',8,41,'14','109',1,''),(252,'2012-04-29 19:37:26',8,41,'15','110',1,''),(253,'2012-04-29 19:37:35',8,41,'16','111',1,''),(254,'2012-04-29 19:40:12',8,42,'6','Реклама 324001.0',1,''),(255,'2012-04-29 19:40:38',8,41,'17','711',1,''),(256,'2012-04-29 19:40:45',8,41,'18','710',1,''),(257,'2012-04-29 19:40:53',8,41,'19','709',1,''),(258,'2012-04-29 19:52:18',8,45,'2','Дисциплина',1,''),(259,'2012-04-29 19:52:25',8,44,'6','ПОКС',1,''),(260,'2012-04-29 19:53:02',8,44,'7','ТРПП',1,''),(261,'2012-04-29 19:54:06',8,44,'8','ИБ',1,''),(262,'2012-04-29 19:54:53',8,44,'9','БД',1,''),(263,'2012-04-29 19:55:07',8,44,'10','Физика',1,''),(264,'2012-04-29 19:58:58',8,43,'11','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(265,'2012-04-29 19:59:05',8,43,'12','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(266,'2012-04-29 20:05:24',8,39,'9','711 / 1 курc',1,''),(267,'2012-04-29 20:05:32',8,39,'10','710 / 2 курc',1,''),(268,'2012-04-29 20:06:38',8,43,'13','ТРПП / Реклама / 1 семестр',1,''),(269,'2012-04-29 20:06:46',8,43,'14','ТРПП / Реклама / 2 семестр',1,''),(270,'2012-04-29 20:28:37',8,3,'11','vahromeev',2,'Изменен password и is_staff.'),(271,'2012-04-30 13:03:54',8,27,'1','2012-04-26 (False)',3,''),(272,'2012-04-30 13:11:19',8,27,'2','2012-04-26 (False)',3,''),(273,'2012-05-03 14:15:49',8,32,'1','ТИП ТЕМЫ',1,''),(274,'2012-05-03 14:16:23',8,33,'1','Лось и его разновидности',1,''),(275,'2012-05-03 14:16:42',8,34,'1','5',1,''),(276,'2012-05-03 14:39:26',8,34,'2','4',1,''),(277,'2012-05-03 14:58:31',8,26,'1','216',1,''),(278,'2012-05-03 14:58:55',8,28,'1','Вахромеев Виталий , ПОКС, 808, 2012-05-03 (False), 1',1,''),(279,'2012-05-03 17:14:42',8,28,'2','Вахромеев Виталий , ПОКС, 808, 2012-05-03, 2',1,''),(280,'2012-05-03 17:14:54',8,28,'3','Вахромеев Виталий , ПОКС, 808, 2012-05-03, 4',1,''),(281,'2012-05-04 08:51:20',8,28,'4','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 1',1,''),(282,'2012-05-04 08:53:03',8,38,'13','Лазарева Юлия ',1,''),(283,'2012-05-04 08:53:57',8,38,'14','Гаврилова Надежда ',1,''),(284,'2012-05-04 08:54:13',8,38,'12','Живодерова Валентина ',2,'Изменен first_name.'),(285,'2012-05-04 08:55:18',8,44,'11','Анг. яз',1,''),(286,'2012-05-04 08:55:30',8,44,'12','История',1,''),(287,'2012-05-04 08:55:48',8,44,'13','Общество',1,''),(288,'2012-05-04 08:56:10',8,43,'15','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(289,'2012-05-04 08:56:20',8,43,'16','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(290,'2012-05-04 08:56:31',8,43,'17','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(291,'2012-05-04 08:56:39',8,43,'18','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(292,'2012-05-04 08:57:01',8,49,'37','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(293,'2012-05-04 08:57:11',8,49,'38','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(294,'2012-05-04 08:57:22',8,49,'39','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр / L / 160 часов',1,''),(295,'2012-05-04 08:57:38',8,51,'34','Лазарева Юлия  808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(296,'2012-05-04 08:57:53',8,51,'35','Лазарева Юлия  808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(297,'2012-05-04 08:58:55',8,28,'5','Лазарева Юлия , Анг. яз, 808, 2012-05-04, 1',1,''),(298,'2012-05-04 08:59:06',8,28,'6','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 2',1,''),(299,'2012-05-04 08:59:25',8,28,'7','Живодерова Валентина , ТРПП, 711, 2012-05-04, 3',1,''),(300,'2012-05-04 09:00:48',8,26,'2','202',1,''),(301,'2012-05-04 09:00:52',8,26,'3','201',1,''),(302,'2012-05-04 09:00:58',8,26,'4','306',1,''),(303,'2012-05-04 09:01:33',8,28,'4','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 5',2,'Изменен num_less.'),(304,'2012-05-04 09:14:24',8,38,'11','Вахромеев Виталий Владимирович',2,'Изменен other_name.'),(305,'2012-05-04 09:14:46',8,38,'12','Живодерова Валентина Викторовна',2,'Изменен other_name и sex.'),(306,'2012-05-04 09:15:04',8,38,'13','Лазарева Юлия Николаевна',2,'Изменен other_name и sex.'),(307,'2012-05-04 09:15:24',8,38,'14','Гаврилова Надежда Алексеевна',2,'Изменен other_name и sex.'),(308,'2012-05-04 16:29:59',8,28,'8','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',1,''),(309,'2012-05-06 02:10:07',8,28,'9','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 2',1,''),(310,'2012-05-06 02:10:20',8,28,'10','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 3',1,''),(311,'2012-05-06 02:11:15',8,28,'11','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-05, 2',1,''),(312,'2012-05-06 02:11:51',8,28,'11','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-05, 2',3,''),(313,'2012-05-07 15:36:39',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',1,''),(314,'2012-05-07 15:36:58',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 4',2,'Изменен num_less.'),(315,'2012-05-07 15:37:19',8,28,'12','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 3',1,''),(316,'2012-05-07 16:32:30',8,28,'1','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 1',3,''),(317,'2012-05-07 16:32:30',8,28,'2','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 2',3,''),(318,'2012-05-07 16:32:30',8,28,'3','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 4',3,''),(319,'2012-05-07 16:32:30',8,28,'4','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-04, 5',3,''),(320,'2012-05-07 16:32:30',8,28,'5','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 1',3,''),(321,'2012-05-07 16:32:30',8,28,'6','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-04, 2',3,''),(322,'2012-05-07 16:32:30',8,28,'7','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 3',3,''),(323,'2012-05-07 16:32:30',8,28,'8','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',3,''),(324,'2012-05-07 16:32:30',8,28,'9','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 2',3,''),(325,'2012-05-07 16:32:30',8,28,'10','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 3',3,''),(326,'2012-05-07 16:32:30',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 4',3,''),(327,'2012-05-07 16:32:30',8,28,'12','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 3',3,''),(328,'2012-05-07 16:39:40',8,26,'1','216',3,''),(329,'2012-05-07 16:39:40',8,26,'2','202',3,''),(330,'2012-05-07 16:39:40',8,26,'3','201',3,''),(331,'2012-05-07 16:39:40',8,26,'4','306',3,''),(332,'2012-05-07 16:39:53',8,27,'3','2012-04-30 (False)',3,''),(333,'2012-05-07 16:39:53',8,27,'4','2012-05-01 (False)',3,''),(334,'2012-05-07 16:39:53',8,27,'5','2012-05-03 (False)',3,''),(335,'2012-05-07 16:39:53',8,27,'6','2012-05-02 (False)',3,''),(336,'2012-05-07 16:39:53',8,27,'7','2012-05-04 (False)',3,''),(337,'2012-05-07 16:39:53',8,27,'8','2012-05-05 (False)',3,''),(338,'2012-05-07 16:39:53',8,27,'9','2012-05-06 (False)',3,''),(339,'2012-05-07 16:39:53',8,27,'10','2012-05-10 (False)',3,''),(340,'2012-05-07 16:43:34',8,51,'18','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 170 часов',3,''),(341,'2012-05-07 16:43:34',8,51,'19','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / P / 70 часов',3,''),(342,'2012-05-07 16:43:34',8,51,'20','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / S / 0 часов',3,''),(343,'2012-05-07 16:43:34',8,51,'21','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / E / 0 часов',3,''),(344,'2012-05-07 16:43:34',8,51,'22','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',3,''),(345,'2012-05-07 16:43:34',8,51,'23','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / P / 70 часов',3,''),(346,'2012-05-07 16:43:34',8,51,'24','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / S / 8 часов',3,''),(347,'2012-05-07 16:43:34',8,51,'25','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 12 часов',3,''),(348,'2012-05-07 16:43:34',8,51,'26','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 170 часов',3,''),(349,'2012-05-07 16:43:34',8,51,'27','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / P / 40 часов',3,''),(350,'2012-05-07 16:43:34',8,51,'28','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / S / 0 часов',3,''),(351,'2012-05-07 16:43:34',8,51,'29','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / E / 0 часов',3,''),(352,'2012-05-07 16:43:34',8,51,'30','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',3,''),(353,'2012-05-07 16:43:35',8,51,'31','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / P / 0 часов',3,''),(354,'2012-05-07 16:43:35',8,51,'32','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / S / 8 часов',3,''),(355,'2012-05-07 16:43:35',8,51,'33','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / E / 12 часов',3,''),(356,'2012-05-07 16:43:35',8,51,'34','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',3,''),(357,'2012-05-07 16:43:35',8,51,'35','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',3,''),(358,'2012-05-07 16:49:15',8,42,'7','Прикладная информатика по отраслям 230701.0',1,''),(359,'2012-05-07 16:49:54',8,42,'8','Техническое обслуживание и ремонт автомобильного транспорта 190604.0',1,''),(360,'2012-05-07 16:50:14',8,42,'9','Повар 34.2',1,''),(361,'2012-05-07 16:50:33',8,42,'10','Автомеханик 30.2',1,''),(362,'2012-05-07 16:50:52',8,42,'11','Программирование в компьютерных системах 230115.0',1,''),(363,'2012-05-07 16:53:02',8,41,'20','208',1,''),(364,'2012-05-07 16:53:13',8,41,'21','209',1,''),(365,'2012-05-07 16:53:39',8,41,'22','908',1,''),(366,'2012-05-07 16:53:49',8,41,'23','910',1,''),(367,'2012-05-07 16:53:56',8,41,'24','911',1,''),(368,'2012-05-07 16:54:31',8,41,'25','410',1,''),(369,'2012-05-07 16:54:58',8,41,'26','507',1,''),(370,'2012-05-07 16:55:07',8,41,'27','508',1,''),(371,'2012-05-07 16:55:18',8,41,'28','509',1,''),(372,'2012-05-07 16:55:28',8,41,'29','510',1,''),(373,'2012-05-07 16:55:35',8,41,'30','511',1,''),(374,'2012-05-07 16:57:29',8,38,'15','Масалова Евгения Алексеевна',1,''),(375,'2012-05-07 16:59:16',8,38,'16','Подколзина Анджела Ивановна',1,''),(376,'2012-05-07 17:13:22',8,39,'11','908 / 4 курc',1,''),(377,'2012-05-07 17:13:31',8,39,'12','910 / 2 курc',1,''),(378,'2012-05-07 17:13:43',8,39,'13','208 / 4 курc',1,''),(379,'2012-05-07 17:13:57',8,39,'14','209 / 3 курc',1,''),(380,'2012-05-07 17:14:04',8,39,'15','507 / 5 курc',1,''),(381,'2012-05-07 17:14:11',8,39,'16','508 / 4 курc',1,''),(382,'2012-05-07 17:14:18',8,39,'17','509 / 3 курc',1,''),(383,'2012-05-07 17:26:15',8,39,'18','510 / 2 курc',1,''),(384,'2012-05-07 17:26:21',8,39,'19','511 / 1 курc',1,''),(385,'2012-05-07 17:51:42',8,43,'19','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(386,'2012-05-07 17:51:50',8,43,'20','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(387,'2012-05-07 17:51:57',8,43,'21','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(388,'2012-05-07 17:52:07',8,43,'22','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(389,'2012-05-07 17:52:19',8,43,'23','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(390,'2012-05-07 17:52:27',8,43,'24','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(391,'2012-05-07 18:05:28',8,43,'25','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр',1,''),(392,'2012-05-07 18:05:36',8,43,'26','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр',1,''),(393,'2012-05-07 18:06:09',8,49,'40','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',1,''),(394,'2012-05-07 18:06:17',8,49,'41','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр / L / 80 часов',1,''),(395,'2012-05-07 18:06:53',8,51,'36','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 200 часов',1,''),(396,'2012-05-07 18:07:04',8,51,'37','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',1,''),(397,'2012-05-07 18:07:35',8,51,'38','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 100 часов',1,''),(398,'2012-05-07 18:07:45',8,51,'39','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',1,''),(399,'2012-05-07 18:08:48',8,51,'40','Вахромеев Виталий Владимирович 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(400,'2012-05-07 18:09:02',8,51,'41','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(401,'2012-05-07 18:09:21',8,51,'42','Гаврилова Надежда Алексеевна 511 / 1 курc История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',1,''),(402,'2012-05-07 18:09:49',8,26,'5','301',1,''),(403,'2012-05-07 18:09:55',8,26,'6','302',1,''),(404,'2012-05-07 18:10:00',8,26,'7','201',1,''),(405,'2012-05-07 18:10:00',8,26,'8','201',1,''),(406,'2012-05-07 18:10:04',8,26,'9','216',1,''),(407,'2012-05-07 18:10:07',8,26,'10','214',1,''),(408,'2012-05-07 18:10:25',8,28,'13','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 1',1,''),(409,'2012-05-07 18:10:39',8,28,'14','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 2',1,''),(410,'2012-05-07 18:11:03',8,28,'15','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-07, 1',1,''),(411,'2012-05-07 18:11:27',8,28,'16','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-07, 2',1,''),(412,'2012-05-07 18:11:37',8,28,'17','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-07, 3',1,''),(413,'2012-05-07 18:11:48',8,28,'18','Вахромеев Виталий Владимирович, Анг. яз, 808, 2012-05-07, 4',1,''),(414,'2012-05-11 00:05:13',8,28,'19','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-07, 5',1,''),(415,'2012-05-11 00:26:13',8,49,'42','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',1,''),(416,'2012-05-11 00:27:09',8,51,'43','Вахромеев Виталий Владимирович 908 / 4 курc ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',1,''),(417,'2012-05-11 00:28:09',8,28,'20','Вахромеев Виталий Владимирович, ИБ, 908, 2012-05-07, 1',1,''),(418,'2012-05-11 00:28:19',8,28,'21','Вахромеев Виталий Владимирович, ИБ, 908, 2012-05-07, 5',1,''),(419,'2012-05-11 00:50:00',8,28,'22','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 3',1,''),(420,'2012-05-11 00:50:11',8,28,'23','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 4',1,''),(421,'2012-05-11 00:50:19',8,28,'24','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 5',1,''),(422,'2012-05-11 11:22:39',8,44,'14','Физ-ра',1,''),(423,'2012-05-11 11:23:14',8,43,'27','Физ-ра / Прикладная информатика по отраслям / 1 семестр',1,''),(424,'2012-05-11 11:23:23',8,49,'43','Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',1,''),(425,'2012-05-11 11:23:52',8,39,'20','911 / 1 курc',1,''),(426,'2012-05-11 11:25:01',8,38,'17','Анашкина Ольга  Викторовна',1,''),(427,'2012-05-11 11:25:08',8,51,'44','Анашкина Ольга  Викторовна 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',1,''),(428,'2012-05-11 11:25:26',8,49,'44','Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',1,''),(429,'2012-05-11 11:26:06',8,38,'18','Антонов Владимир Иванович',1,''),(430,'2012-05-11 11:26:12',8,51,'45','Антонов Владимир Иванович 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',1,''),(431,'2012-05-11 11:26:43',8,26,'11','404',1,''),(432,'2012-05-11 11:26:49',8,28,'25','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 1',1,''),(433,'2012-05-11 11:27:00',8,28,'26','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 3',1,''),(434,'2012-05-11 11:27:11',8,28,'27','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 5',1,''),(435,'2012-05-11 11:27:22',8,28,'28','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 2',1,''),(436,'2012-05-11 11:27:36',8,28,'29','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 4',1,''),(437,'2012-05-11 11:29:15',8,38,'19','Виноградова Оксана Владимировна',1,''),(438,'2012-05-11 11:29:55',8,38,'20','Пахомова Наталья Валерьевна',1,''),(439,'2012-05-11 11:30:44',8,38,'21','Слепужникова Марина Ивановна',1,''),(440,'2012-05-11 11:31:26',8,38,'22','Ходюк Михаил Андреевич',1,''),(441,'2012-05-11 11:32:15',8,38,'23','Бакланова Раиса Абдуловна',1,''),(442,'2012-05-11 11:33:03',8,38,'24','Баринов Василий Константинович',1,''),(443,'2012-05-11 11:33:43',8,38,'25','Богданов Сергей Григорьевич',1,''),(444,'2012-05-11 20:39:42',8,51,'36','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 200 часов',3,''),(445,'2012-05-11 20:39:42',8,51,'37','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',3,''),(446,'2012-05-11 20:39:42',8,51,'38','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 100 часов',3,''),(447,'2012-05-11 20:39:42',8,51,'39','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',3,''),(448,'2012-05-11 20:39:42',8,51,'40','Вахромеев Виталий Владимирович 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',3,''),(449,'2012-05-11 20:39:42',8,51,'41','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',3,''),(450,'2012-05-11 20:39:42',8,51,'42','Гаврилова Надежда Алексеевна 511 / 1 курc История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',3,''),(451,'2012-05-11 20:39:42',8,51,'43','Вахромеев Виталий Владимирович 908 / 4 курc ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',3,''),(452,'2012-05-11 20:41:03',8,43,'11','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',3,''),(453,'2012-05-11 20:41:03',8,43,'12','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',3,''),(454,'2012-05-11 20:41:03',8,43,'13','ТРПП / Реклама / 1 семестр',3,''),(455,'2012-05-11 20:41:03',8,43,'14','ТРПП / Реклама / 2 семестр',3,''),(456,'2012-05-11 20:41:03',8,43,'15','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',3,''),(457,'2012-05-11 20:41:03',8,43,'16','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',3,''),(458,'2012-05-11 20:41:03',8,43,'17','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',3,''),(459,'2012-05-11 20:41:04',8,43,'18','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',3,''),(460,'2012-05-11 20:41:04',8,43,'19','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',3,''),(461,'2012-05-11 20:41:04',8,43,'20','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',3,''),(462,'2012-05-11 20:41:04',8,43,'21','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',3,''),(463,'2012-05-11 20:41:04',8,43,'22','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',3,''),(464,'2012-05-11 20:41:04',8,43,'23','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',3,''),(465,'2012-05-11 20:41:04',8,43,'24','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',3,''),(466,'2012-05-11 20:41:04',8,43,'25','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр',3,''),(467,'2012-05-11 20:41:04',8,43,'26','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр',3,''),(468,'2012-05-11 20:42:50',8,44,'15','Инф-ка',1,''),(469,'2012-05-11 20:43:21',8,43,'28','Инф-ка / Прикладная информатика по отраслям / 1 семестр',1,''),(470,'2012-05-11 20:43:53',8,49,'45','Инф-ка / Прикладная информатика по отраслям / 1 семестр / P / 50 часов',1,''),(471,'2012-05-11 20:44:00',8,49,'46','Инф-ка / Прикладная информатика по отраслям / 1 семестр / K / 3 часов',1,''),(472,'2012-05-11 20:44:20',8,51,'46','Виноградова Оксана Владимировна 911 / 1 курc Инф-ка / Прикладная информатика по отраслям / 1 семестр / P / 50 часов',1,''),(473,'2012-05-11 20:44:33',8,51,'47','Виноградова Оксана Владимировна 911 / 1 курc Инф-ка / Прикладная информатика по отраслям / 1 семестр / K / 3 часов',1,''),(474,'2012-05-11 20:45:04',8,28,'25','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 1',3,''),(475,'2012-05-11 20:45:04',8,28,'26','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 3',3,''),(476,'2012-05-11 20:45:04',8,28,'27','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 5',3,''),(477,'2012-05-11 20:45:04',8,28,'28','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 2',3,''),(478,'2012-05-11 20:45:04',8,28,'29','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 4',3,''),(479,'2012-05-11 20:45:18',8,28,'30','Виноградова Оксана Владимировна, Инф-ка, 911, 2012-05-11, 1',1,''),(480,'2012-05-11 20:45:34',8,28,'31','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-11, 1',1,''),(481,'2012-05-11 20:45:46',8,28,'32','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-11, 3',1,''),(482,'2012-05-11 20:45:56',8,28,'33','Виноградова Оксана Владимировна, Инф-ка, 911, 2012-05-11, 3',1,''),(483,'2012-05-11 20:46:17',8,28,'34','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-11, 2',1,''),(484,'2012-05-11 20:46:28',8,28,'35','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-11, 2',1,''),(485,'2012-05-11 21:26:19',8,44,'6','ПОКС',3,''),(486,'2012-05-11 21:26:19',8,44,'7','ТРПП',3,''),(487,'2012-05-11 21:26:19',8,44,'8','ИБ',3,''),(488,'2012-05-11 21:26:19',8,44,'9','БД',3,''),(489,'2012-05-11 21:26:19',8,44,'10','Физика',3,''),(490,'2012-05-11 21:26:19',8,44,'11','Анг. яз',3,''),(491,'2012-05-11 21:26:19',8,44,'12','История',3,''),(492,'2012-05-11 21:26:19',8,44,'13','Общество',3,''),(493,'2012-05-11 21:27:50',8,44,'16','Нем яз',1,''),(494,'2012-05-11 21:28:05',8,44,'17','Физика',1,''),(495,'2012-05-11 21:28:32',8,44,'18','Лит-ра',1,''),(496,'2012-05-11 21:28:52',8,44,'19','Рус яз',1,''),(497,'2012-05-11 21:29:16',8,44,'20','Анг яз',1,''),(498,'2012-05-11 21:29:28',8,44,'21','Химия',1,''),(499,'2012-05-11 21:30:29',8,44,'22','Биол/экол',1,''),(500,'2012-05-11 21:30:49',8,44,'23','Общество',1,''),(501,'2012-05-11 21:31:24',8,44,'19','Русский язык',2,'Изменен short_name.'),(502,'2012-05-11 21:31:35',8,44,'20','Английский язык',2,'Изменен short_name.'),(503,'2012-05-11 21:31:44',8,44,'16','Немецкий язык',2,'Изменен short_name.'),(504,'2012-05-11 21:31:53',8,44,'15','Информатика',2,'Изменен short_name.'),(505,'2012-05-11 21:32:12',8,44,'18','Литература',2,'Изменен short_name.'),(506,'2012-05-11 21:33:05',8,44,'22','Биология/Экология',2,'Изменен short_name.'),(507,'2012-05-11 21:33:40',8,44,'24','История',1,''),(508,'2012-05-11 21:34:11',8,44,'25','Математика',1,''),(509,'2012-05-11 21:35:01',8,44,'26','О.Б.Ж',1,''),(510,'2012-05-11 21:36:18',8,43,'29','Немецкий язык / Прикладная информатика по отраслям / 1 семестр',1,''),(511,'2012-05-11 21:36:48',8,43,'30','Немецкий язык / Прикладная информатика по отраслям / 1 семестр',1,''),(512,'2012-05-11 21:37:00',8,43,'30','Физика / Прикладная информатика по отраслям / 1 семестр',2,'Изменен disc.'),(513,'2012-05-11 21:38:20',8,43,'31','Литература / Прикладная информатика по отраслям / 1 семестр',1,''),(514,'2012-05-11 21:38:29',8,43,'32','Русский язык / Прикладная информатика по отраслям / 1 семестр',1,''),(515,'2012-05-11 21:38:57',8,43,'33','Английский язык / Прикладная информатика по отраслям / 1 семестр',1,''),(516,'2012-05-11 21:39:08',8,43,'34','Химия / Прикладная информатика по отраслям / 1 семестр',1,''),(517,'2012-05-11 21:39:31',8,43,'35','Биология/Экология / Прикладная информатика по отраслям / 1 семестр',1,''),(518,'2012-05-11 21:39:39',8,43,'36','Общество / Прикладная информатика по отраслям / 1 семестр',1,''),(519,'2012-05-11 21:39:47',8,43,'37','История / Прикладная информатика по отраслям / 1 семестр',1,''),(520,'2012-05-11 21:40:12',8,43,'38','Математика / Прикладная информатика по отраслям / 1 семестр',1,''),(521,'2012-05-11 21:40:20',8,43,'39','О.Б.Ж / Прикладная информатика по отраслям / 1 семестр',1,''),(522,'2012-05-11 21:41:19',8,49,'47','Немецкий язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(523,'2012-05-11 21:42:09',8,49,'48','Немецкий язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(524,'2012-05-11 21:42:27',8,49,'49','Физика / Прикладная информатика по отраслям / 1 семестр / L / 195 часов',1,''),(525,'2012-05-11 21:42:39',8,49,'50','Физика / Прикладная информатика по отраслям / 1 семестр / K / 15 часов',1,''),(526,'2012-05-11 21:44:17',8,49,'51','Информатика / Прикладная информатика по отраслям / 1 семестр / L / 95 часов',1,''),(527,'2012-05-11 21:44:45',8,49,'52','Информатика / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(528,'2012-05-11 21:44:53',8,49,'53','Информатика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(529,'2012-05-11 21:45:08',8,49,'54','Литература / Прикладная информатика по отраслям / 1 семестр / L / 117 часов',1,''),(530,'2012-05-11 21:45:22',8,49,'55','Литература / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(531,'2012-05-11 21:45:39',8,49,'56','Русский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(532,'2012-05-11 21:45:48',8,49,'57','Русский язык / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(533,'2012-05-11 21:45:57',8,49,'58','Русский язык / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(534,'2012-05-11 21:46:30',8,49,'59','Английский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(535,'2012-05-11 21:46:39',8,49,'60','Английский язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(536,'2012-05-11 21:46:55',8,49,'61','Химия / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(537,'2012-05-11 21:47:09',8,49,'62','Химия / Прикладная информатика по отраслям / 1 семестр / P / 6 часов',1,''),(538,'2012-05-11 21:47:19',8,49,'63','Химия / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(539,'2012-05-11 21:47:33',8,49,'64','Биология/Экология / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(540,'2012-05-11 21:47:45',8,49,'65','Биология/Экология / Прикладная информатика по отраслям / 1 семестр / P / 4 часов',1,''),(541,'2012-05-11 21:47:54',8,49,'66','Биология/Экология / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(542,'2012-05-11 21:48:11',8,49,'67','Общество / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(543,'2012-05-11 21:48:20',8,49,'68','Общество / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(544,'2012-05-11 21:48:44',8,49,'69','История / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(545,'2012-05-11 21:48:55',8,49,'70','История / Прикладная информатика по отраслям / 1 семестр / K / 10 часов',1,''),(546,'2012-05-11 21:49:15',8,49,'71','Математика / Прикладная информатика по отраслям / 1 семестр / L / 290 часов',1,''),(547,'2012-05-11 21:49:27',8,49,'72','Математика / Прикладная информатика по отраслям / 1 семестр / K / 18 часов',1,''),(548,'2012-05-11 21:49:35',8,49,'73','Математика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(549,'2012-05-11 21:49:53',8,49,'74','О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / L / 68 часов',1,''),(550,'2012-05-11 21:49:59',8,49,'75','О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / K / 2 часов',1,''),(551,'2012-05-11 21:51:22',8,38,'26','Винокурова Наталья Васильевна',1,''),(552,'2012-05-11 21:51:49',8,51,'48','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(553,'2012-05-11 21:52:00',8,51,'49','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(554,'2012-05-11 21:55:40',8,38,'27','Вихляева Надежда Валентиновна',1,''),(555,'2012-05-11 21:56:07',8,51,'50','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / L / 195 часов',1,''),(556,'2012-05-11 21:56:27',8,51,'51','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / K / 15 часов',1,''),(557,'2012-05-11 21:58:40',8,51,'52','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / L / 95 часов',1,''),(558,'2012-05-11 21:58:49',8,51,'53','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(559,'2012-05-11 21:59:01',8,51,'54','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(560,'2012-05-11 23:07:37',8,28,'36','Живодерова Валентина Викторовна, Информатика, 911, 2012-05-11, 4',1,''),(561,'2012-05-11 23:07:52',8,28,'37','Вихляева Надежда Валентиновна, Физика, 911, 2012-05-11, 5',1,''),(562,'2012-05-12 23:34:16',8,28,'38','Виноградова Оксана Владимировна, Информатика, 911, 2012-05-13, 1',1,''),(563,'2012-05-12 23:34:32',8,28,'39','Живодерова Валентина Викторовна, Информатика, 911, 2012-05-13, 1',1,''),(564,'2012-05-12 23:37:12',8,28,'40','Вихляева Надежда Валентиновна, Физика, 911, 2012-05-14, 1',1,''),(565,'2012-05-12 23:37:56',8,28,'41','Винокурова Наталья Васильевна, Немецкий язык, 911, 2012-05-14, 2',1,''),(566,'2012-05-12 23:38:16',8,28,'42','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-14, 3',1,''),(567,'2012-05-12 23:38:28',8,28,'43','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-14, 3',1,''),(568,'2012-05-12 23:39:03',8,28,'44','Живодерова Валентина Викторовна, Информатика, 911, 2012-05-14, 5',1,''),(569,'2012-05-12 23:39:15',8,28,'45','Виноградова Оксана Владимировна, Информатика, 911, 2012-05-14, 5',1,''),(570,'2012-05-13 00:50:48',8,38,'28','Жидеева Светлана Михайловна',1,''),(571,'2012-05-13 00:52:33',8,51,'55','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / L / 117 часов',1,''),(572,'2012-05-13 00:53:07',8,51,'56','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(573,'2012-05-13 00:53:21',8,51,'57','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(574,'2012-05-13 00:53:32',8,51,'58','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',1,''),(575,'2012-05-13 00:53:44',8,51,'59','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(576,'2012-05-13 01:59:42',8,51,'60','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(577,'2012-05-13 01:59:58',8,51,'61','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',1,''),(578,'2012-05-13 02:00:14',8,51,'62','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(579,'2012-05-13 02:00:31',8,51,'63','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / P / 6 часов',1,''),(580,'2012-05-13 02:00:46',8,51,'64','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(581,'2012-05-13 02:01:20',8,51,'65','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',1,''),(582,'2012-05-13 02:01:32',8,51,'66','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / P / 4 часов',1,''),(583,'2012-05-13 02:01:48',8,51,'67','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(584,'2012-05-13 02:02:43',8,38,'29','Рачкова Анастасия Михайловна',1,''),(585,'2012-05-13 02:03:10',8,51,'68','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(586,'2012-05-13 02:03:26',8,51,'69','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',1,''),(587,'2012-05-13 02:03:48',8,51,'70','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',1,''),(588,'2012-05-13 02:04:01',8,51,'71','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / K / 10 часов',1,''),(589,'2012-05-13 02:04:21',8,51,'72','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / L / 290 часов',1,''),(590,'2012-05-13 02:04:35',8,51,'73','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / K / 18 часов',1,''),(591,'2012-05-13 02:04:47',8,51,'74','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',1,''),(592,'2012-05-13 02:05:00',8,51,'75','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / L / 68 часов',1,''),(593,'2012-05-13 02:05:11',8,51,'76','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / K / 2 часов',1,''),(594,'2012-05-13 12:05:56',8,39,'21','410 / 2 курc',1,''),(595,'2012-05-13 12:07:38',8,43,'40','Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(596,'2012-05-13 12:08:02',8,44,'27','Тех механика',1,''),(597,'2012-05-13 12:08:21',8,43,'41','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(598,'2012-05-13 12:08:33',8,44,'28','Инж графика',1,''),(599,'2012-05-13 12:08:50',8,43,'42','Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(600,'2012-05-13 12:09:11',8,43,'43','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(601,'2012-05-13 12:09:24',8,43,'44','Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(602,'2012-05-13 12:09:45',8,44,'29','Осн соц и полит',1,''),(603,'2012-05-13 12:10:01',8,43,'45','Осн соц и полит / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(604,'2012-05-13 12:10:01',8,43,'46','Осн соц и полит / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(605,'2012-05-13 12:10:12',8,44,'30','Краеведение',1,''),(606,'2012-05-13 12:10:41',8,43,'47','Краеведение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(607,'2012-05-13 12:11:11',8,44,'31','Рус яз и культ речи',1,''),(608,'2012-05-13 12:11:24',8,43,'48','Рус яз и культ речи / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(609,'2012-05-13 12:11:39',8,44,'32','Автомобили',1,''),(610,'2012-05-13 12:12:00',8,44,'33','Электротехника',1,''),(611,'2012-05-13 12:12:08',8,44,'34','Материаловедение',1,''),(612,'2012-05-13 12:12:20',8,44,'35','Осн экономики',1,''),(613,'2012-05-13 12:12:28',8,44,'36','Основы права',1,''),(614,'2012-05-13 12:12:50',8,44,'37','Эколог осн природ',1,''),(615,'2012-05-13 12:13:47',8,43,'49','Автомобили / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(616,'2012-05-13 12:13:59',8,43,'50','Электротехника / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(617,'2012-05-13 12:14:14',8,43,'51','Английский язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(618,'2012-05-13 12:14:29',8,43,'52','Математика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(619,'2012-05-13 12:14:40',8,43,'53','Материаловедение / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(620,'2012-05-13 12:14:52',8,43,'54','Осн экономики / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(621,'2012-05-13 12:15:04',8,43,'55','Основы права / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(622,'2012-05-13 12:15:11',8,43,'56','Эколог осн природ / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',1,''),(623,'2012-05-13 12:16:13',8,49,'76','Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(624,'2012-05-13 12:16:26',8,49,'77','Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',1,''),(625,'2012-05-13 12:16:40',8,49,'78','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 176 часов',1,''),(626,'2012-05-13 12:16:57',8,49,'79','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 14 часов',1,''),(627,'2012-05-13 12:17:06',8,49,'80','Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / E / 10 часов',1,''),(628,'2012-05-13 12:17:23',8,49,'81','Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 144 часов',1,''),(629,'2012-05-13 12:17:32',8,49,'82','Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 10 часов',1,''),(630,'2012-05-13 12:17:49',8,49,'83','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 30 часов',1,''),(631,'2012-05-13 12:18:02',8,49,'84','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 2 часов',1,''),(632,'2012-05-13 12:18:14',8,49,'85','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(633,'2012-05-13 12:18:25',8,49,'86','Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(634,'2012-05-13 12:18:43',8,49,'87','Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(635,'2012-05-13 12:18:51',8,49,'88','Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(636,'2012-05-13 12:19:24',8,51,'77','Анашкина Ольга  Викторовна 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(637,'2012-05-13 12:19:36',8,51,'78','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',1,''),(638,'2012-05-13 12:19:37',8,51,'79','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',1,''),(639,'2012-05-13 12:20:12',8,51,'80','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 176 часов',1,''),(640,'2012-05-13 12:20:24',8,51,'81','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 14 часов',1,''),(641,'2012-05-13 12:20:40',8,51,'82','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / E / 10 часов',1,''),(642,'2012-05-13 12:20:54',8,51,'83','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 144 часов',1,''),(643,'2012-05-13 12:21:21',8,51,'84','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 10 часов',1,''),(644,'2012-05-13 12:21:41',8,51,'85','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 30 часов',1,''),(645,'2012-05-13 12:21:54',8,51,'86','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 2 часов',1,''),(646,'2012-05-13 12:22:21',8,51,'87','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(647,'2012-05-13 12:22:39',8,51,'88','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(648,'2012-05-13 12:22:51',8,51,'89','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',1,''),(649,'2012-05-13 12:23:05',8,51,'90','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',1,''),(650,'2012-05-13 13:23:07',8,51,'91','Баринов Василий Константинович 410 / 2 курc Основы права / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 78 часов',3,''),(651,'2012-05-13 13:23:07',8,51,'92','Баринов Василий Константинович 410 / 2 курc Основы права / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / P / 0 часов',3,''),(652,'2012-05-13 13:23:07',8,51,'93','Баринов Василий Константинович 410 / 2 курc Основы права / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 10 часов',3,''),(653,'2012-05-13 13:23:07',8,51,'94','Баринов Василий Константинович 410 / 2 курc Основы права / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / E / 0 часов',3,''),(654,'2012-05-13 17:16:33',8,51,'44','Анашкина Ольга  Викторовна 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',3,''),(655,'2012-05-13 17:16:33',8,51,'45','Антонов Владимир Иванович 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',3,''),(656,'2012-05-13 17:16:33',8,51,'46','Виноградова Оксана Владимировна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / P / 50 часов',3,''),(657,'2012-05-13 17:16:33',8,51,'47','Виноградова Оксана Владимировна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / K / 3 часов',3,''),(658,'2012-05-13 17:16:33',8,51,'48','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(659,'2012-05-13 17:16:33',8,51,'49','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',3,''),(660,'2012-05-13 17:16:33',8,51,'50','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / L / 195 часов',3,''),(661,'2012-05-13 17:16:33',8,51,'51','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / K / 15 часов',3,''),(662,'2012-05-13 17:16:33',8,51,'52','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / L / 95 часов',3,''),(663,'2012-05-13 17:16:33',8,51,'53','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',3,''),(664,'2012-05-13 17:16:33',8,51,'54','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',3,''),(665,'2012-05-13 17:16:33',8,51,'44','Анашкина Ольга  Викторовна 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',3,''),(666,'2012-05-13 17:16:34',8,51,'55','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / L / 117 часов',3,''),(667,'2012-05-13 17:16:34',8,51,'45','Антонов Владимир Иванович 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',3,''),(668,'2012-05-13 17:16:34',8,51,'56','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(669,'2012-05-13 17:16:34',8,51,'46','Виноградова Оксана Владимировна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / P / 50 часов',3,''),(670,'2012-05-13 17:16:34',8,51,'57','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(671,'2012-05-13 17:16:34',8,51,'47','Виноградова Оксана Владимировна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / K / 3 часов',3,''),(672,'2012-05-13 17:16:34',8,51,'58','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',3,''),(673,'2012-05-13 17:16:34',8,51,'48','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(674,'2012-05-13 17:16:34',8,51,'59','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',3,''),(675,'2012-05-13 17:16:34',8,51,'49','Винокурова Наталья Васильевна 911 / 1 курc Немецкий язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',3,''),(676,'2012-05-13 17:16:34',8,51,'60','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(677,'2012-05-13 17:16:34',8,51,'50','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / L / 195 часов',3,''),(678,'2012-05-13 17:16:34',8,51,'61','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',3,''),(679,'2012-05-13 17:16:34',8,51,'51','Вихляева Надежда Валентиновна 911 / 1 курc Физика / Прикладная информатика по отраслям / 1 семестр / K / 15 часов',3,''),(680,'2012-05-13 17:16:34',8,51,'62','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(681,'2012-05-13 17:16:34',8,51,'52','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / L / 95 часов',3,''),(682,'2012-05-13 17:16:34',8,51,'63','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / P / 6 часов',3,''),(683,'2012-05-13 17:16:34',8,51,'53','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',3,''),(684,'2012-05-13 17:16:34',8,51,'64','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(685,'2012-05-13 17:16:34',8,51,'54','Живодерова Валентина Викторовна 911 / 1 курc Информатика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',3,''),(686,'2012-05-13 17:16:34',8,51,'65','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(687,'2012-05-13 17:16:35',8,51,'55','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / L / 117 часов',3,''),(688,'2012-05-13 17:16:35',8,51,'66','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / P / 4 часов',3,''),(689,'2012-05-13 17:16:35',8,51,'56','Жидеева Светлана Михайловна 911 / 1 курc Литература / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(690,'2012-05-13 17:16:35',8,51,'67','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(691,'2012-05-13 17:16:35',8,51,'57','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(692,'2012-05-13 17:16:35',8,51,'68','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',3,''),(693,'2012-05-13 17:16:35',8,51,'58','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / K / 6 часов',3,''),(694,'2012-05-13 17:16:35',8,51,'69','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(695,'2012-05-13 17:16:35',8,51,'59','Жидеева Светлана Михайловна 911 / 1 курc Русский язык / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',3,''),(696,'2012-05-13 17:16:35',8,51,'70','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',3,''),(697,'2012-05-13 17:16:35',8,51,'60','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(698,'2012-05-13 17:16:35',8,51,'71','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / K / 10 часов',3,''),(699,'2012-05-13 17:16:35',8,51,'61','Лазарева Юлия Николаевна 911 / 1 курc Английский язык / Прикладная информатика по отраслям / 1 семестр / K / 4 часов',3,''),(700,'2012-05-13 17:16:35',8,51,'72','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / L / 290 часов',3,''),(701,'2012-05-13 17:16:35',8,51,'62','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(702,'2012-05-13 17:16:35',8,51,'73','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / K / 18 часов',3,''),(703,'2012-05-13 17:16:35',8,51,'63','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / P / 6 часов',3,''),(704,'2012-05-13 17:16:35',8,51,'74','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',3,''),(705,'2012-05-13 17:16:35',8,51,'64','Пахомова Наталья Валерьевна 911 / 1 курc Химия / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(706,'2012-05-13 17:16:35',8,51,'75','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / L / 68 часов',3,''),(707,'2012-05-13 17:16:35',8,51,'65','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / L / 78 часов',3,''),(708,'2012-05-13 17:16:35',8,51,'76','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / K / 2 часов',3,''),(709,'2012-05-13 17:16:35',8,51,'66','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / P / 4 часов',3,''),(710,'2012-05-13 17:16:35',8,51,'77','Анашкина Ольга  Викторовна 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',3,''),(711,'2012-05-13 17:16:36',8,51,'67','Пахомова Наталья Валерьевна 911 / 1 курc Биология/Экология / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(712,'2012-05-13 17:16:36',8,51,'78','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',3,''),(713,'2012-05-13 17:16:36',8,51,'68','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',3,''),(714,'2012-05-13 17:16:36',8,51,'79','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',3,''),(715,'2012-05-13 17:16:36',8,51,'69','Рачкова Анастасия Михайловна 911 / 1 курc Общество / Прикладная информатика по отраслям / 1 семестр / K / 8 часов',3,''),(716,'2012-05-13 17:16:36',8,51,'80','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 176 часов',3,''),(717,'2012-05-13 17:16:36',8,51,'70','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / L / 114 часов',3,''),(718,'2012-05-13 17:16:36',8,51,'81','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 14 часов',3,''),(719,'2012-05-13 17:16:36',8,51,'71','Рачкова Анастасия Михайловна 911 / 1 курc История / Прикладная информатика по отраслям / 1 семестр / K / 10 часов',3,''),(720,'2012-05-13 17:16:36',8,51,'82','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / E / 10 часов',3,''),(721,'2012-05-13 17:16:36',8,51,'72','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / L / 290 часов',3,''),(722,'2012-05-13 17:16:36',8,51,'83','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 144 часов',3,''),(723,'2012-05-13 17:16:36',8,51,'73','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / K / 18 часов',3,''),(724,'2012-05-13 17:16:36',8,51,'84','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 10 часов',3,''),(725,'2012-05-13 17:16:36',8,51,'74','Слепужникова Марина Ивановна 911 / 1 курc Математика / Прикладная информатика по отраслям / 1 семестр / E / 10 часов',3,''),(726,'2012-05-13 17:16:36',8,51,'85','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 30 часов',3,''),(727,'2012-05-13 17:16:36',8,51,'75','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / L / 68 часов',3,''),(728,'2012-05-13 17:16:36',8,51,'86','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 2 часов',3,''),(729,'2012-05-13 17:16:36',8,51,'76','Ходюк Михаил Андреевич 911 / 1 курc О.Б.Ж / Прикладная информатика по отраслям / 1 семестр / K / 2 часов',3,''),(730,'2012-05-13 17:16:36',8,51,'87','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',3,''),(731,'2012-05-13 17:16:36',8,51,'77','Анашкина Ольга  Викторовна 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',3,''),(732,'2012-05-13 17:16:36',8,51,'88','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',3,''),(733,'2012-05-13 17:16:36',8,51,'78','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',3,''),(734,'2012-05-13 17:16:37',8,51,'89','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',3,''),(735,'2012-05-13 17:16:37',8,51,'79','Антонов Владимир Иванович 410 / 2 курc Физ-ра / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 54 часов',3,''),(736,'2012-05-13 17:16:37',8,51,'90','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',3,''),(737,'2012-05-13 17:16:37',8,51,'80','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 176 часов',3,''),(738,'2012-05-13 17:16:37',8,51,'81','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 14 часов',3,''),(739,'2012-05-13 17:16:37',8,51,'82','Бакланова Раиса Абдуловна 410 / 2 курc Тех механика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / E / 10 часов',3,''),(740,'2012-05-13 17:16:37',8,51,'83','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 144 часов',3,''),(741,'2012-05-13 17:16:37',8,51,'84','Бакланова Раиса Абдуловна 410 / 2 курc Инж графика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 10 часов',3,''),(742,'2012-05-13 17:16:37',8,51,'85','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 30 часов',3,''),(743,'2012-05-13 17:16:37',8,51,'86','Богданов Сергей Григорьевич 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 2 часов',3,''),(744,'2012-05-13 17:16:37',8,51,'87','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',3,''),(745,'2012-05-13 17:16:37',8,51,'88','Виноградова Оксана Владимировна 410 / 2 курc Информатика / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',3,''),(746,'2012-05-13 17:16:37',8,51,'89','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / L / 64 часов',3,''),(747,'2012-05-13 17:16:37',8,51,'90','Винокурова Наталья Васильевна 410 / 2 курc Немецкий язык / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр / K / 4 часов',3,''),(748,'2012-05-13 18:10:41',8,43,'46','Осн соц и полит / Техническое обслуживание и ремонт автомобильного транспорта / 3 семестр',3,''),(749,'2012-05-13 18:48:59',8,38,'30','Крючкова Светлана Геннадьевна',1,''),(750,'2012-05-13 18:49:29',8,38,'31','Куличев Евгений Николаевич',1,''),(751,'2012-05-13 18:50:51',8,38,'33','Сизова Ирина Гаруновна',1,''),(752,'2012-05-13 18:56:00',8,38,'34','Оборотова Татьяна Алексеевна',1,''),(753,'2012-05-13 19:53:14',8,43,'57','Физ-ра / Организация обслуживания в общественном питании / 5 семестр',1,''),(754,'2012-05-13 19:54:09',8,44,'38','Инф тех в проф деят',1,''),(755,'2012-05-13 19:54:26',8,44,'39','Немец язык проф',1,''),(756,'2012-05-13 19:54:46',8,44,'40','Англ язык проф',1,''),(757,'2012-05-13 19:54:56',8,44,'41','Орг обслуживания',1,''),(758,'2012-05-13 19:55:30',8,44,'42','Валют фин операции',1,''),(759,'2012-05-13 19:56:01',8,44,'43','Орг упр мал пред',1,''),(760,'2012-05-13 19:56:13',8,44,'44','Иностранный тур',1,''),(761,'2012-05-13 19:56:23',8,44,'45','Охрана труда',1,''),(762,'2012-05-13 19:56:38',8,44,'46','Экономика отр',1,''),(763,'2012-05-13 19:57:14',8,44,'47','Бух уч в общест пит',1,''),(764,'2012-05-13 19:57:49',8,44,'48','ДОУ',1,''),(765,'2012-05-13 19:57:59',8,44,'49','ПОПД',1,''),(766,'2012-05-13 20:01:53',8,44,'50','Проф эстетика',1,''),(767,'2012-05-13 20:02:30',8,44,'51','Орг и техн отрасли',1,''),(768,'2012-05-13 20:02:56',8,44,'52','Кулинария',1,''),(769,'2012-05-13 20:03:42',8,44,'53','БЖ',1,''),(770,'2012-05-13 20:05:11',8,38,'35','Оболенский Евгений Сергеевич',1,''),(771,'2012-05-13 20:05:55',8,38,'36','Сачкова Галина Сергеевна',1,''),(772,'2012-05-13 20:06:47',8,38,'37','Сенгилейцев Юрий Евгеньевич',1,''),(773,'2012-05-13 20:07:25',8,38,'38','Семененко Любовь Владиславовна',1,''),(774,'2012-05-13 20:08:18',8,38,'39','Недосекина Марина Марсельевна',1,''),(775,'2012-05-13 20:09:15',8,38,'40','Гусарова Галина Сергеевна',1,''),(776,'2012-05-14 17:36:47',8,55,'1','ЛК',1,''),(777,'2012-05-14 17:38:16',8,55,'2','ПК',1,''),(778,'2012-05-14 17:38:38',8,55,'3','КН',1,''),(779,'2012-05-14 17:39:01',8,55,'4','ЭК',1,''),(780,'2012-05-14 17:39:12',8,55,'5','КП',1,''),(781,'2012-05-14 17:40:12',8,55,'6','ПК',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'пользователь','main','profile'),(10,'студент','main','students'),(11,'преподователь','main','teachers'),(12,'статус','main','userstatus'),(13,'группа','main','group'),(14,'должность','main','userpost'),(15,'профессиональное образование','main','po'),(16,'специальность','main','speciality'),(17,'тип дисциплины','main','disc_type'),(18,'дисциплина','main','discipline'),(19,'учебный план','main','uchplan'),(20,'час учебного плана','main','uchplanhour'),(21,'учебный год','main','year'),(22,'группу студентов','main','groups'),(23,'студент группы','main','groups_stud'),(24,'план группы','main','groups_plan'),(25,'тарификация','main','tariffication'),(26,'кабинет','schedule','classroom'),(27,'день расписания','schedule','schedule_day'),(28,'расписание','schedule','schedule'),(29,'расписание на каждый день','schedule','schedule_empty'),(30,'расписание для преподавателя','schedule','schedule_filled'),(31,'пропуск','schedule','absences'),(32,'тип темы','journal','types_themes'),(33,'тему','journal','themes'),(34,'оценку','journal','assessment'),(35,'должность','tariffication','userpost'),(36,'статус','tariffication','userstatus'),(37,'студент','tariffication','students'),(38,'преподователя','tariffication','teachers'),(39,'план группы','tariffication','groups_plan'),(40,'учебный год','tariffication','year'),(41,'группу студентов','tariffication','groups'),(42,'специальность','tariffication','speciality'),(43,'учебный план','tariffication','uchplan'),(44,'дисциплина','tariffication','discipline'),(45,'тип дисциплины','tariffication','disc_type'),(46,'пользователь','tariffication','profile'),(47,'группа','tariffication','group'),(48,'профессиональное образование','tariffication','po'),(49,'час учебного плана','tariffication','uchplanhour'),(50,'студент группы','tariffication','groups_stud'),(51,'тарификация','tariffication','tariffication'),(52,'номер пары','schedule','number_lesson'),(53,'день','journal','theme_of_day'),(54,'кабинет','tariffication','classroom'),(55,'тип часа','tariffication','typehour');
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
INSERT INTO `django_session` VALUES ('0f5dd281919437a255e13a0fbea5ee2c','MmRkYTM4NzIzNzNkZDBkNDg0YmYyMDkyZjBiNjRhZjFjNGM1N2I1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQt1Lg==\n','2012-05-13 20:29:24'),('114b157d179346ac7db812088279ff49','ZDFjMGJhODhmYzE0YWMyMjViMzYyNTkxNzE3ODliOTQyYWNlYmQzZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQhVCV9tZXNzYWdlc3EFXXEGKGNkamFuZ28uY29udHJpYi5tZXNz\nYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBymBcQh9cQkoVQpleHRyYV90YWdzcQpYAAAAAFUH\nbWVzc2FnZXELWJ8AAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0JjRgdGC0L7RgNC40Y8iINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3Q\nsC5xDFUFbGV2ZWxxDUsUdWJoBymBcQ59cQ8oVQpleHRyYV90YWdzcRBYAAAAAFUHbWVzc2FnZXER\nWE8AAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0J7QsdGJ0LXRgdGC0LLQviIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0ucRJVBWxldmVscRNLFHViaAcpgXEUfXEVKFUKZXh0\ncmFfdGFnc3EWWAAAAABVB21lc3NhZ2VxF1hHAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCQ\n0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQ\ntSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+\n0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA3INGB0LXQvNC10YHR\ngtGAIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLR\niyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQ\nvdGL0Lkg0L/Qu9Cw0L0ucRhVBWxldmVscRlLFHViaAcpgXEafXEbKFUKZXh0cmFfdGFnc3EcWAAA\nAABVB21lc3NhZ2VxHVhHAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCQ0L3Qsy4g0Y/QtyAv\nINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQtSDQstGL0YfQuNGB\n0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+0LzQsNGC0LjQt9C4\n0YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg\n0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC\n0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw\n0L0ucR5VBWxldmVscR9LFHViaAcpgXEgfXEhKFUKZXh0cmFfdGFnc3EiWAAAAABVB21lc3NhZ2Vx\nI1hJAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCY0YHRgtC+0YDQuNGPIC8g0J/RgNC+0LPR\ngNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3QuNC1INCy0YvRh9C40YHQu9C40YLQtdC7\n0YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC0L7QvNCw0YLQuNC30LjRgNC+0LLQsNC9\n0L3Ri9GFINGB0LjRgdGC0LXQvCAvIDEg0YHQtdC80LXRgdGC0YAiINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQ\nsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRg9GH0LXQsdC90YvQuSDQv9C70LDQvS5xJFUFbGV2\nZWxxJUsUdWJoBymBcSZ9cScoVQpleHRyYV90YWdzcShYAAAAAFUHbWVzc2FnZXEpWPQAAADRg9GH\n0LXQsdC90YvQuSDQv9C70LDQvSAi0JjRgdGC0L7RgNC40Y8gLyDQn9GA0L7Qs9GA0LDQvNC80L3Q\nvtC1INC+0LHQtdGB0L/QtdGH0LXQvdC40LUg0LLRi9GH0LjRgdC70LjRgtC10LvRjNC90L7QuSDR\ngtC10YXQvdC40LrQuCDQuCDQsNCy0YLQvtC80LDRgtC40LfQuNGA0L7QstCw0L3QvdGL0YUg0YHQ\nuNGB0YLQtdC8IC8gMiDRgdC10LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7Q\nsdCw0LLQu9C10L0ucSpVBWxldmVscStLFHViaAcpgXEsfXEtKFUKZXh0cmFfdGFnc3EuWAAAAABV\nB21lc3NhZ2VxL1hyAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0JDQvdCz\nLiDRj9C3IC8g0J/RgNC+0LPRgNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3QuNC1INCy\n0YvRh9C40YHQu9C40YLQtdC70YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC0L7QvNCw\n0YLQuNC30LjRgNC+0LLQsNC90L3Ri9GFINGB0LjRgdGC0LXQvCAvIDcg0YHQtdC80LXRgdGC0YAg\nLyBMIC8gMTIwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQ\ntdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQ\nvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C70LDQvdCwLnEwVQVsZXZlbHExSxR1\nYmgHKYFxMn1xMyhVCmV4dHJhX3RhZ3NxNFgAAAAAVQdtZXNzYWdlcTVYcQEAANGH0LDRgSDRg9GH\n0LXQsdC90L7Qs9C+INC/0LvQsNC90LAgItCQ0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQ\nvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQtSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5\nINGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDR\ngdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHRgtGAIC8gTCAvIDcwINGH0LDRgdC+0LIiINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+\n0LPQviDQv9C70LDQvdCwLnE2VQVsZXZlbHE3SxR1YmgHKYFxOH1xOShVCmV4dHJhX3RhZ3NxOlgA\nAAAAVQdtZXNzYWdlcTtYdAEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAgItCY\n0YHRgtC+0YDQuNGPIC8g0J/RgNC+0LPRgNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3Q\nuNC1INCy0YvRh9C40YHQu9C40YLQtdC70YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC\n0L7QvNCw0YLQuNC30LjRgNC+0LLQsNC90L3Ri9GFINGB0LjRgdGC0LXQvCAvIDEg0YHQtdC80LXR\ngdGC0YAgLyBMIC8gMTYwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQ\nsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC1\n0YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C70LDQvdCwLnE8VQVsZXZl\nbHE9SxR1YmgHKYFxPn1xPyhVCmV4dHJhX3RhZ3NxQFgAAAAAVQdtZXNzYWdlcUFYhQEAANGC0LDR\ngNC40YTQuNC60LDRhtC40Y8gItCb0LDQt9Cw0YDQtdCy0LAg0K7Qu9C40Y8gIDgwOCAvIDQg0LrR\ng9GAYyDQkNC90LMuINGP0LcgLyDQn9GA0L7Qs9GA0LDQvNC80L3QvtC1INC+0LHQtdGB0L/QtdGH\n0LXQvdC40LUg0LLRi9GH0LjRgdC70LjRgtC10LvRjNC90L7QuSDRgtC10YXQvdC40LrQuCDQuCDQ\nsNCy0YLQvtC80LDRgtC40LfQuNGA0L7QstCw0L3QvdGL0YUg0YHQuNGB0YLQtdC8IC8gNyDRgdC1\n0LzQtdGB0YLRgCAvIEwgLyAxMjAg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucUJVBWxldmVscUNLFHVi\naAcpgXFEfXFFKFUKZXh0cmFfdGFnc3FGWAAAAABVB21lc3NhZ2VxR1gwAQAA0YLQsNGA0LjRhNC4\n0LrQsNGG0LjRjyAi0JvQsNC30LDRgNC10LLQsCDQrtC70LjRjyAgODA4IC8gNCDQutGD0YBjINCQ\n0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQ\ntSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+\n0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHR\ngtGAIC8gTCAvIDcwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LnFIVQVsZXZlbHFJSxR1YmgHKYFxSn1xSyhVCmV4dHJhX3RhZ3NxTFgAAAAAVQdtZXNz\nYWdlcU1YzQAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQm9Cw0LfQsNGA0LXQstCwINCu0LvQuNGP\nICwg0JDQvdCzLiDRj9C3LCA4MDgsIDIwMTItMDUtMDQsIDEiINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy\n0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgNCw0YHQv9C40YHQsNC90LjQtS5xTlUFbGV2ZWxxT0sU\ndWJoBymBcVB9cVEoVQpleHRyYV90YWdzcVJYAAAAAFUHbWVzc2FnZXFTWNEAAADRgNCw0YHQv9C4\n0YHQsNC90LjQtSAi0JLQsNGF0YDQvtC80LXQtdCyINCS0LjRgtCw0LvQuNC5ICwg0J/QntCa0KEs\nIDgwOCwgMjAxMi0wNS0wNCwgMiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C1\n0L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+\n0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnFUVQVsZXZlbHFVSxR1YmgHKYFxVn1xVyhVCmV4\ndHJhX3RhZ3NxWFgAAAAAVQdtZXNzYWdlcVlYhQAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQltC4\n0LLQvtC00LXRgNC+0LLQsCDQktCw0LvQtdC90YLQuNC90LAgLCDQotCg0J/QnywgNzExLCAyMDEy\nLTA1LTA0LCAzIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS5xWlUFbGV2\nZWxxW0sUdWJoBymBcVx9cV0oVQpleHRyYV90YWdzcV5YAAAAAFUHbWVzc2FnZXFfWIgAAADQutCw\n0LHQuNC90LXRgiAiMjAyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g\n0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC4\n0L0g0LrQsNCx0LjQvdC10YIucWBVBWxldmVscWFLFHViaAcpgXFifXFjKFUKZXh0cmFfdGFnc3Fk\nWAAAAABVB21lc3NhZ2VxZViIAAAA0LrQsNCx0LjQvdC10YIgIjIwMSIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7Q\nsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC60LDQsdC40L3QtdGCLnFmVQVsZXZlbHFnSxR1\nYmgHKYFxaH1xaShVCmV4dHJhX3RhZ3NxalgAAAAAVQdtZXNzYWdlcWtYiAAAANC60LDQsdC40L3Q\ntdGCICIzMDYiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQutCw\n0LHQuNC90LXRgi5xbFUFbGV2ZWxxbUsUdWJoBymBcW59cW8oVQpleHRyYV90YWdzcXBYAAAAAFUH\nbWVzc2FnZXFxWH0AAADRgNCw0YHQv9C40YHQsNC90LjQtSAi0JLQsNGF0YDQvtC80LXQtdCyINCS\n0LjRgtCw0LvQuNC5ICwg0J/QntCa0KEsIDgwOCwgMjAxMi0wNS0wNCwgNSIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC40LfQvNC10L3QtdC9LnFyVQVsZXZlbHFzSxR1YmgHKYFxdH1xdShVCmV4dHJh\nX3RhZ3NxdlgAAAAAVQdtZXNzYWdlcXdYfQAAANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQ\nktCw0YXRgNC+0LzQtdC10LIg0JLQuNGC0LDQu9C40Lkg0JLQu9Cw0LTQuNC80LjRgNC+0LLQuNGH\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0ucXhVBWxldmVscXlLFHViaAcp\ngXF6fXF7KFUKZXh0cmFfdGFnc3F8WAAAAABVB21lc3NhZ2VxfVh/AAAA0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8gItCW0LjQstC+0LTQtdGA0L7QstCwINCS0LDQu9C10L3RgtC40L3QsCDQktC4\n0LrRgtC+0YDQvtCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LnF+\nVQVsZXZlbHF/SxR1YmgHKYFxgH1xgShVCmV4dHJhX3RhZ3NxglgAAAAAVQdtZXNzYWdlcYNYcQAA\nANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQm9Cw0LfQsNGA0LXQstCwINCu0LvQuNGPINCd\n0LjQutC+0LvQsNC10LLQvdCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0u\ncYRVBWxldmVscYVLFHViaAcpgXGGfXGHKFUKZXh0cmFfdGFnc3GIWAAAAABVB21lc3NhZ2VxiVh5\nAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCT0LDQstGA0LjQu9C+0LLQsCDQndCw0LTQ\ntdC20LTQsCDQkNC70LXQutGB0LXQtdCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQ\nvNC10L3QtdC9LnGKVQVsZXZlbHGLSxR1YmgHKYFxjH1xjShVCmV4dHJhX3RhZ3NxjlgAAAAAVQdt\nZXNzYWdlcY9YKwAAANCf0LDRgNC+0LvRjCDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS5x\nkFUFbGV2ZWxxkUsZdWJldS4=\n','2012-05-18 09:15:43'),('22a1aed379cafc6e4d819e7626af8f04','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-25 11:01:37'),('4691c60308a43b861b34dca1b690cbc7','ZDRiMzhjNDQ0NmFlNDMyMjc5NTc0NGU2M2MwZWM4MWRkMjJhYTgzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2012-05-28 17:20:09'),('4aea3198e6c225e423c72e4f949534e8','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-14 13:01:59'),('58727e6379d3e8d3128be32b6b1fe392','ODAwNWJlNTBjNjVmZDM0MWRhYTkwMmQ5OGFkODY3ZGNhMzU0Y2NiNzqAAn1xAShVCV9tZXNzYWdl\nc3ECXXEDKGNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBCmB\ncQV9cQYoVQpleHRyYV90YWdzcQdYAAAAAFUHbWVzc2FnZXEIWNMAAADQv9GA0LXQv9C+0LTQvtCy\n0LDRgtC10LvRjyAi0J7QsdC+0YDQvtGC0L7QstCwINCi0LDRgtGM0Y/QvdCwINCQ0LvQtdC60YHQ\ntdC10LLQvdCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC2\n0LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0L/R\ngNC10L/QvtC00L7QstCw0YLQtdC70Y8ucQlVBWxldmVscQpLFHViaAQpgXELfXEMKFUKZXh0cmFf\ndGFnc3ENWAAAAABVB21lc3NhZ2VxDlgSAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCk0LjQ\nty3RgNCwIC8g0J7RgNCz0LDQvdC40LfQsNGG0LjRjyDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40Y8g\n0LIg0L7QsdGJ0LXRgdGC0LLQtdC90L3QvtC8INC/0LjRgtCw0L3QuNC4IC8gNSDRgdC10LzQtdGB\n0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy\n0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGD0YfQtdCx\n0L3Ri9C5INC/0LvQsNC9LnEPVQVsZXZlbHEQSxR1YmgEKYFxEX1xEihVCmV4dHJhX3RhZ3NxE1gA\nAAAAVQdtZXNzYWdlcRRYswAAANC00LjRgdGG0LjQv9C70LjQvdCwICLQmNC90YQg0YLQtdGFINCy\nINC/0YDQvtGEINC00LXRj9GCIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQ\nvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7Q\ntNC40L0g0LTQuNGB0YbQuNC/0LvQuNC90LAucRVVBWxldmVscRZLFHViaAQpgXEXfXEYKFUKZXh0\ncmFfdGFnc3EZWAAAAABVB21lc3NhZ2VxGlitAAAA0LTQuNGB0YbQuNC/0LvQuNC90LAgItCd0LXQ\nvNC10YYg0Y/Qt9GL0Log0L/RgNC+0YQiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQ\ntSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3QsC5xG1UFbGV2ZWxxHEsUdWJoBCmBcR19cR4o\nVQpleHRyYV90YWdzcR9YAAAAAFUHbWVzc2FnZXEgWKsAAADQtNC40YHRhtC40L/Qu9C40L3QsCAi\n0JDQvdCz0Lsg0Y/Qt9GL0Log0L/RgNC+0YQiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQ\nsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC1\n0YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3QsC5xIVUFbGV2ZWxxIksUdWJoBCmBcSN9\ncSQoVQpleHRyYV90YWdzcSVYAAAAAFUHbWVzc2FnZXEmWLAAAADQtNC40YHRhtC40L/Qu9C40L3Q\nsCAi0J7RgNCzINC+0LHRgdC70YPQttC40LLQsNC90LjRjyIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INC00LjRgdGG0LjQv9C70LjQvdCwLnEnVQVsZXZlbHEoSxR1\nYmgEKYFxKX1xKihVCmV4dHJhX3RhZ3NxK1gAAAAAVQdtZXNzYWdlcSxYswAAANC00LjRgdGG0LjQ\nv9C70LjQvdCwICLQktCw0LvRjtGCINGE0LjQvSDQvtC/0LXRgNCw0YbQuNC4IiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg\n0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/0LvQuNC90LAucS1V\nBWxldmVscS5LFHViaAQpgXEvfXEwKFUKZXh0cmFfdGFnc3ExWAAAAABVB21lc3NhZ2VxMliuAAAA\n0LTQuNGB0YbQuNC/0LvQuNC90LAgItCe0YDQsyDRg9C/0YAg0LzQsNC7INC/0YDQtdC0IiDQsdGL\n0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQ\ntdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/0LvQuNC9\n0LAucTNVBWxldmVscTRLFHViaAQpgXE1fXE2KFUKZXh0cmFfdGFnc3E3WAAAAABVB21lc3NhZ2Vx\nOFiuAAAA0LTQuNGB0YbQuNC/0LvQuNC90LAgItCY0L3QvtGB0YLRgNCw0L3QvdGL0Lkg0YLRg9GA\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQ\nvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/\n0LvQuNC90LAucTlVBWxldmVscTpLFHViaAQpgXE7fXE8KFUKZXh0cmFfdGFnc3E9WAAAAABVB21l\nc3NhZ2VxPlioAAAA0LTQuNGB0YbQuNC/0LvQuNC90LAgItCe0YXRgNCw0L3QsCDRgtGA0YPQtNCw\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQ\nvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/\n0LvQuNC90LAucT9VBWxldmVscUBLFHViaAQpgXFBfXFCKFUKZXh0cmFfdGFnc3FDWAAAAABVB21l\nc3NhZ2VxRFiqAAAA0LTQuNGB0YbQuNC/0LvQuNC90LAgItCt0LrQvtC90L7QvNC40LrQsCDQvtGC\n0YAiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGL\nINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC4\n0L/Qu9C40L3QsC5xRVUFbGV2ZWxxRksUdWJoBCmBcUd9cUgoVQpleHRyYV90YWdzcUlYAAAAAFUH\nbWVzc2FnZXFKWLMAAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0JHRg9GFINGD0Ycg0LIg0L7QsdGJ\n0LXRgdGCINC/0LjRgiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd\n0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9\nINC00LjRgdGG0LjQv9C70LjQvdCwLnFLVQVsZXZlbHFMSxR1YmgEKYFxTX1xTihVCmV4dHJhX3Rh\nZ3NxT1gAAAAAVQdtZXNzYWdlcVBYlwAAANC00LjRgdGG0LjQv9C70LjQvdCwICLQlNCe0KMiINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7Q\nttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C4\n0L3QsC5xUVUFbGV2ZWxxUksUdWJoBCmBcVN9cVQoVQpleHRyYV90YWdzcVVYAAAAAFUHbWVzc2Fn\nZXFWWJkAAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0J/QntCf0JQiINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQ\nsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3QsC5xV1UFbGV2ZWxx\nWEsUdWJoBCmBcVl9cVooVQpleHRyYV90YWdzcVtYAAAAAFUHbWVzc2FnZXFcWKoAAADQtNC40YHR\nhtC40L/Qu9C40L3QsCAi0J/RgNC+0YQg0Y3RgdGC0LXRgtC40LrQsCIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7Q\nsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC00LjRgdGG0LjQv9C70LjQvdCwLnFdVQVsZXZl\nbHFeSxR1YmgEKYFxX31xYChVCmV4dHJhX3RhZ3NxYVgAAAAAVQdtZXNzYWdlcWJYsgAAANC00LjR\ngdGG0LjQv9C70LjQvdCwICLQntGA0LMg0Lgg0YLQtdGF0L0g0L7RgtGA0LDRgdC70LgiINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3Q\nsC5xY1UFbGV2ZWxxZEsUdWJoBCmBcWV9cWYoVQpleHRyYV90YWdzcWdYAAAAAFUHbWVzc2FnZXFo\nWKMAAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0JrRg9C70LjQvdCw0YDQuNGPIiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg\n0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0LTQuNGB0YbQuNC/0LvQuNC90LAucWlV\nBWxldmVscWpLFHViaAQpgXFrfXFsKFUKZXh0cmFfdGFnc3FtWAAAAABVB21lc3NhZ2VxbliVAAAA\n0LTQuNGB0YbQuNC/0LvQuNC90LAgItCR0JYiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQ\nsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC1\n0YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3QsC5xb1UFbGV2ZWxxcEsUdWJoBCmBcXF9\ncXIoVQpleHRyYV90YWdzcXNYAAAAAFUHbWVzc2FnZXF0WNMAAADQv9GA0LXQv9C+0LTQvtCy0LDR\ngtC10LvRjyAi0J7QsdC+0LvQtdC90YHQutC40Lkg0JXQstCz0LXQvdC40Lkg0KHQtdGA0LPQtdC1\n0LLQuNGHIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg\n0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0L/RgNC1\n0L/QvtC00L7QstCw0YLQtdC70Y8ucXVVBWxldmVscXZLFHViaAQpgXF3fXF4KFUKZXh0cmFfdGFn\nc3F5WAAAAABVB21lc3NhZ2VxeljLAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCh0LDR\nh9C60L7QstCwINCT0LDQu9C40L3QsCDQodC10YDQs9C10LXQstC90LAiINCx0YvQuyDRg9GB0L/Q\ntdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+\n0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjy5x\ne1UFbGV2ZWxxfEsUdWJoBCmBcX19cX4oVQpleHRyYV90YWdzcX9YAAAAAFUHbWVzc2FnZXGAWNEA\nAADQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjyAi0KHQtdC90LPQuNC70LXQudGG0LXQsiDQrtGA\n0LjQuSDQldCy0LPQtdC90YzQtdCy0LjRhyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw\n0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXR\nidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnGBVQVsZXZlbHGCSxR1YmgE\nKYFxg31xhChVCmV4dHJhX3RhZ3NxhVgAAAAAVQdtZXNzYWdlcYZY1wAAANC/0YDQtdC/0L7QtNC+\n0LLQsNGC0LXQu9GPICLQodC10LzQtdC90LXQvdC60L4g0JvRjtCx0L7QstGMINCS0LvQsNC00LjR\ngdC70LDQstC+0LLQvdCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g\n0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC4\n0L0g0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8ucYdVBWxldmVscYhLFHViaAQpgXGJfXGKKFUK\nZXh0cmFfdGFnc3GLWAAAAABVB21lc3NhZ2VxjFjVAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC7\n0Y8gItCd0LXQtNC+0YHQtdC60LjQvdCwINCc0LDRgNC40L3QsCDQnNCw0YDRgdC10LvRjNC10LLQ\nvdCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLR\niyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0L/RgNC10L/Q\nvtC00L7QstCw0YLQtdC70Y8ucY1VBWxldmVscY5LFHViaAQpgXGPfXGQKFUKZXh0cmFfdGFnc3GR\nWAAAAABVB21lc3NhZ2VxkljNAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCT0YPRgdCw\n0YDQvtCy0LAg0JPQsNC70LjQvdCwINCh0LXRgNCz0LXQtdCy0L3QsCIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7Q\nsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnGT\nVQVsZXZlbHGUSxR1YmVVDV9hdXRoX3VzZXJfaWRxlYoBCFUSX2F1dGhfdXNlcl9iYWNrZW5kcZZV\nKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcZd1Lg==\n','2012-05-27 20:09:15'),('726e150a856a3fcb40e73ee172911ae1','YmNjZGU3ZGJhZDkyNzM1Y2ZjYmM1NDVlZWMwMDYzYzhiY2NlYmUzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-22 00:22:03'),('72b3d2c131a0537f55f8fb772f2f803b','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-25 11:01:38'),('9e2f53fa3d59c6bbde647b9701987f1f','YmNjZGU3ZGJhZDkyNzM1Y2ZjYmM1NDVlZWMwMDYzYzhiY2NlYmUzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-14 13:01:59'),('a1e44e9fc98da76d8cd739c0092e1458','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-17 17:31:09'),('a9da73c40bd5b8fa740d3de5107727a4','ZWI5ZjI4MzdiMDY5NjhkMGE1MzNhMTI0ZGIwYjg4NmFmNDQ0Yzg4YTqAAn1xAShVCV9tZXNzYWdl\nc3ECXXEDKGNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBCmB\ncQV9cQYoVQpleHRyYV90YWdzcQdYAAAAAFUHbWVzc2FnZXEIWOMAAADRgNCw0YHQv9C40YHQsNC9\n0LjQtSAi0JDQvdCw0YjQutC40L3QsCDQntC70YzQs9CwICDQktC40LrRgtC+0YDQvtCy0L3QsCwg\n0KTQuNC3LdGA0LAsIDkxMSwgMjAxMi0wNS0wNywgMyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEJVQVsZXZlbHEKSxR1YmgE\nKYFxC31xDChVCmV4dHJhX3RhZ3NxDVgAAAAAVQdtZXNzYWdlcQ5Y4wAAANGA0LDRgdC/0LjRgdCw\n0L3QuNC1ICLQkNC90LDRiNC60LjQvdCwINCe0LvRjNCz0LAgINCS0LjQutGC0L7RgNC+0LLQvdCw\nLCDQpNC40Lct0YDQsCwgOTExLCAyMDEyLTA1LTA3LCA1IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g\n0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC4\n0YLRjCDQtdGJ0LUg0L7QtNC40L0g0YDQsNGB0L/QuNGB0LDQvdC40LUucQ9VBWxldmVscRBLFHVi\naAQpgXERfXESKFUKZXh0cmFfdGFnc3ETWAAAAABVB21lc3NhZ2VxFFjiAAAA0YDQsNGB0L/QuNGB\n0LDQvdC40LUgItCQ0L3RgtC+0L3QvtCyINCS0LvQsNC00LjQvNC40YAg0JjQstCw0L3QvtCy0LjR\nhywg0KTQuNC3LdGA0LAsIDkxMSwgMjAxMi0wNS0wNywgMiIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEVVQVsZXZlbHEWSxR1\nYmgEKYFxF31xGChVCmV4dHJhX3RhZ3NxGVgAAAAAVQdtZXNzYWdlcRpYkAAAANGA0LDRgdC/0LjR\ngdCw0L3QuNC1ICLQkNC90YLQvtC90L7QsiDQktC70LDQtNC40LzQuNGAINCY0LLQsNC90L7QstC4\n0YcsINCk0LjQty3RgNCwLCA5MTEsIDIwMTItMDUtMDcsIDQiINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQtNC+0LHQsNCy0LvQtdC9LnEbVQVsZXZlbHEcSxR1YmgEKYFxHX1xHihVCmV4dHJhX3RhZ3Nx\nH1gAAAAAVQdtZXNzYWdlcSBY2QAAANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQktC40L3Q\nvtCz0YDQsNC00L7QstCwINCe0LrRgdCw0L3QsCDQktC70LDQtNC40LzQuNGA0L7QstC90LAiINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7Q\nttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQv9GA0LXQv9C+0LTQvtCy\n0LDRgtC10LvRjy5xIVUFbGV2ZWxxIksUdWJoBCmBcSN9cSQoVQpleHRyYV90YWdzcSVYAAAAAFUH\nbWVzc2FnZXEmWNEAAADQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjyAi0J/QsNGF0L7QvNC+0LLQ\nsCDQndCw0YLQsNC70YzRjyDQktCw0LvQtdGA0YzQtdCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQ\nvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw\n0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnEnVQVs\nZXZlbHEoSxR1YmgEKYFxKX1xKihVCmV4dHJhX3RhZ3NxK1gAAAAAVQdtZXNzYWdlcSxY0wAAANC/\n0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQodC70LXQv9GD0LbQvdC40LrQvtCy0LAg0JzQsNGA\n0LjQvdCwINCY0LLQsNC90L7QstC90LAiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQ\ntSDQvtC00LjQvSDQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjy5xLVUFbGV2ZWxxLksUdWJoBCmB\ncS99cTAoVQpleHRyYV90YWdzcTFYAAAAAFUHbWVzc2FnZXEyWMcAAADQv9GA0LXQv9C+0LTQvtCy\n0LDRgtC10LvRjyAi0KXQvtC00Y7QuiDQnNC40YXQsNC40Lsg0JDQvdC00YDQtdC10LLQuNGHIiDQ\nsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+\n0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8ucTNVBWxldmVscTRLFHViaAQpgXE1fXE2KFUKZXh0cmFfdGFnc3E3WAAAAABV\nB21lc3NhZ2VxOFjNAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCR0LDQutC70LDQvdC+\n0LLQsCDQoNCw0LjRgdCwINCQ0LHQtNGD0LvQvtCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnE5VQVsZXZl\nbHE6SxR1YmgEKYFxO31xPChVCmV4dHJhX3RhZ3NxPVgAAAAAVQdtZXNzYWdlcT5Y1wAAANC/0YDQ\ntdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQkdCw0YDQuNC90L7QsiDQktCw0YHQuNC70LjQuSDQmtC+\n0L3RgdGC0LDQvdGC0LjQvdC+0LLQuNGHIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQ\nstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ\n0LUg0L7QtNC40L0g0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8ucT9VBWxldmVscUBLFHViaAQp\ngXFBfXFCKFUKZXh0cmFfdGFnc3FDWAAAAABVB21lc3NhZ2VxRFjRAAAA0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8gItCR0L7Qs9C00LDQvdC+0LIg0KHQtdGA0LPQtdC5INCT0YDQuNCz0L7RgNGM\n0LXQstC40YciINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQv9GA\n0LXQv9C+0LTQvtCy0LDRgtC10LvRjy5xRVUFbGV2ZWxxRksUdWJlVQ1fYXV0aF91c2VyX2lkcUeK\nAQhVEl9hdXRoX3VzZXJfYmFja2VuZHFIVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1v\nZGVsQmFja2VuZHFJdS4=\n','2012-05-25 11:33:43'),('e62b37906f79bfdcace75d6047127588','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-13 20:29:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (11,4,808,'7, 8'),(12,4,809,'5, 6'),(13,5,108,'7, 8'),(14,5,109,'5, 6'),(15,5,110,'3, 4'),(16,5,111,'1, 2'),(17,6,711,'1, 2'),(18,6,710,'3, 4'),(19,6,709,'5, 6'),(20,9,208,'7, 8'),(21,9,209,'5, 6'),(22,7,908,'7, 8'),(23,7,910,'3, 4'),(24,7,911,'1, 2'),(25,8,410,'3, 4'),(26,8,507,'9, 10'),(27,8,508,'7, 8'),(28,8,509,'5, 6'),(29,8,510,'3, 4'),(30,8,511,'1, 2');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_plan`
--

LOCK TABLES `groups_plan` WRITE;
/*!40000 ALTER TABLE `groups_plan` DISABLE KEYS */;
INSERT INTO `groups_plan` VALUES (7,2,11,4),(8,2,12,3),(9,2,17,1),(10,2,18,2),(11,2,22,4),(12,2,23,2),(13,2,20,4),(14,2,21,3),(15,2,26,5),(16,2,27,4),(17,2,28,3),(18,2,29,2),(19,2,30,1),(20,2,24,1),(21,2,25,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `profile` VALUES (9,'',NULL,'',NULL),(10,'',NULL,'',NULL),(11,'Владимирович',NULL,'',NULL),(12,'Викторовна',NULL,'','B'),(13,'Николаевна',NULL,'','B'),(14,'Алексеевна',NULL,'','B'),(15,'Алексеевна',NULL,'','B'),(16,'Ивановна',NULL,'','B'),(17,'Викторовна',NULL,'','W'),(18,'Иванович',NULL,'','M'),(19,'Владимировна',NULL,'','W'),(20,'Валерьевна',NULL,'','W'),(21,'Ивановна',NULL,'','W'),(22,'Андреевич',NULL,'','M'),(23,'Абдуловна',NULL,'','W'),(24,'Константинович',NULL,'','M'),(25,'Григорьевич',NULL,'','M'),(26,'Васильевна',NULL,'','W'),(27,'Валентиновна',NULL,'','W'),(28,'Михайловна',NULL,'','W'),(29,'Михайловна',NULL,'','W'),(30,'Геннадьевна',NULL,'','W'),(31,'Николаевич',NULL,'','M'),(33,'Гаруновна',NULL,'','W'),(34,'Алексеевна',NULL,'','W'),(35,'Сергеевич',NULL,'','M'),(36,'Сергеевна',NULL,'','W'),(37,'Евгеньевич',NULL,'','M'),(38,'Владиславовна',NULL,'','W'),(39,'Марсельевна',NULL,'','W'),(40,'Сергеевна',NULL,'','W');
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
  `hour_type` int(11) NOT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`),
  KEY `schedule_5a80280f` (`plan_id`),
  KEY `schedule_2831cc73` (`day_id`),
  KEY `schedule_3fa87ba8` (`classroom_id`),
  CONSTRAINT `classroom_id_refs_id_5193473c` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `day_id_refs_id_71dbb36c` FOREIGN KEY (`day_id`) REFERENCES `schedule_day` (`id`),
  CONSTRAINT `plan_id_refs_id_a121fc8` FOREIGN KEY (`plan_id`) REFERENCES `tariffication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (71,91,16,NULL,2,2,NULL),(72,95,16,NULL,1,2,NULL),(73,95,16,NULL,2,2,NULL),(74,95,16,NULL,3,2,NULL),(75,103,16,NULL,1,2,NULL),(76,103,16,NULL,3,2,NULL),(77,219,16,NULL,4,2,NULL),(78,151,17,NULL,1,2,NULL),(79,136,17,NULL,2,2,NULL),(80,113,17,NULL,3,2,NULL),(81,154,17,NULL,4,2,NULL),(82,119,17,NULL,5,2,NULL),(83,207,17,NULL,1,2,NULL),(84,95,17,NULL,2,2,NULL),(85,103,17,NULL,2,2,NULL),(86,196,17,NULL,3,2,NULL),(87,161,17,NULL,3,2,NULL),(88,196,17,NULL,4,2,NULL),(89,177,17,NULL,4,2,NULL),(90,217,17,NULL,5,2,NULL),(91,183,16,NULL,5,2,NULL),(92,143,18,NULL,1,2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_day`
--

LOCK TABLES `schedule_day` WRITE;
/*!40000 ALTER TABLE `schedule_day` DISABLE KEYS */;
INSERT INTO `schedule_day` VALUES (11,'2012-05-04',0),(12,'2012-05-07',0),(13,'2012-05-10',0),(14,'2012-05-11',0),(15,'2012-05-12',0),(16,'2012-05-13',0),(17,'2012-05-14',0),(18,'2012-05-15',0),(19,'2012-05-16',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'schedule','0001_initial','2012-05-07 16:38:17'),(2,'tariffication','0001_initial','2012-05-07 17:22:49'),(3,'journal','0001_initial','2012-05-07 17:22:49'),(4,'schedule','0002_auto__add_field_schedule_hour_type','2012-05-11 20:39:18'),(5,'schedule','0003_auto__add_field_schedule_comment','2012-05-11 20:39:18'),(6,'journal','0002_add_field_Assessment_day','2012-05-11 23:56:03'),(7,'journal','0003_auto__chg_field_assessment_day','2012-05-11 23:56:03'),(8,'tariffication','0002_auto__add_classroom__add_typehour__del_field_groups_stud_student__add_','2012-05-13 22:36:01'),(9,'tariffication','0003_auto__chg_field_teachers_cabinet','2012-05-13 22:36:03'),(10,'journal','0006_auto__del_field_assessment_theme__add_field_assessment_theme_of_day__d','2012-05-13 22:36:06'),(11,'tariffication','0004_auto__chg_field_typehour_name','2012-05-14 01:33:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (4,'Программное обеспечение вычислительной техники и автоматизированных систем',230105),(5,'Организация обслуживания в общественном питании',324001),(6,'Реклама',324001),(7,'Прикладная информатика по отраслям',230701),(8,'Техническое обслуживание и ремонт автомобильного транспорта',190604),(9,'Повар',34.2),(10,'Автомеханик',30.2),(11,'Программирование в компьютерных системах',230115);
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
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffication`
--

LOCK TABLES `tariffication` WRITE;
/*!40000 ALTER TABLE `tariffication` DISABLE KEYS */;
INSERT INTO `tariffication` VALUES (91,17,20,93),(92,17,20,94),(93,17,20,95),(94,17,20,96),(95,17,21,97),(96,17,21,98),(97,17,21,99),(98,17,21,100),(99,18,20,101),(100,18,20,102),(101,18,20,103),(102,18,20,104),(103,18,21,105),(104,18,21,106),(105,18,21,107),(106,18,21,108),(107,19,20,109),(108,19,20,110),(109,19,20,111),(110,19,20,112),(111,12,20,113),(112,12,20,114),(113,12,20,115),(114,12,20,116),(115,26,20,117),(116,26,20,118),(117,26,20,119),(118,26,20,120),(119,27,20,121),(120,27,20,122),(121,27,20,123),(122,27,20,124),(123,28,20,125),(124,28,20,126),(125,28,20,127),(126,28,20,128),(127,28,20,129),(128,28,20,130),(129,28,20,131),(130,28,20,132),(131,13,20,133),(132,13,20,134),(133,13,20,135),(134,13,20,136),(135,20,20,137),(136,20,20,138),(137,20,20,139),(138,20,20,140),(139,20,20,141),(140,20,20,142),(141,20,20,143),(142,20,20,144),(143,29,20,145),(144,29,20,146),(145,29,20,147),(146,29,20,148),(147,29,20,149),(148,29,20,150),(149,29,20,151),(150,29,20,152),(151,21,20,153),(152,21,20,154),(153,21,20,155),(154,21,20,156),(155,22,20,157),(156,22,20,158),(157,22,20,159),(158,22,20,160),(159,23,21,161),(160,23,21,162),(161,23,21,163),(162,23,21,164),(163,23,21,165),(164,23,21,166),(165,23,21,167),(166,23,21,168),(167,25,21,169),(168,25,21,170),(169,25,21,171),(170,25,21,172),(171,19,21,173),(172,19,21,174),(173,19,21,175),(174,19,21,176),(175,19,21,177),(176,19,21,178),(177,19,21,179),(178,19,21,180),(179,14,21,181),(180,14,21,182),(181,14,21,183),(182,14,21,184),(183,14,21,185),(184,14,21,186),(185,14,21,187),(186,14,21,188),(187,30,21,189),(188,30,21,190),(189,30,21,191),(190,30,21,192),(191,31,21,193),(192,31,21,194),(193,31,21,195),(194,31,21,196),(195,31,21,197),(196,31,21,198),(197,31,21,199),(198,31,21,200),(199,13,21,201),(200,13,21,202),(201,13,21,203),(202,13,21,204),(203,15,21,205),(204,15,21,206),(205,15,21,207),(206,15,21,208),(207,34,21,209),(208,34,21,210),(209,34,21,211),(210,34,21,212),(211,34,21,213),(212,34,21,214),(213,34,21,215),(214,34,21,216),(215,29,21,217),(216,29,21,218),(217,29,21,219),(218,29,21,220),(219,33,21,221),(220,33,21,222),(221,33,21,223),(222,33,21,224);
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
  `cabinet_id` int(11),
  PRIMARY KEY (`profile_ptr_id`),
  KEY `teachers_2fca0f9f` (`cabinet_id`),
  CONSTRAINT `cabinet_id_refs_id_31642ec6` FOREIGN KEY (`cabinet_id`) REFERENCES `classroom` (`id`),
  CONSTRAINT `profile_ptr_id_refs_user_ptr_id_2470ed9a` FOREIGN KEY (`profile_ptr_id`) REFERENCES `profile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (22,101),(31,101),(30,102),(28,105),(35,107),(36,107),(37,111),(12,203),(39,204),(13,205),(11,207),(25,209),(29,210),(19,215),(40,301),(38,303),(26,304),(16,305),(14,306),(23,308),(24,309),(34,401),(20,402),(17,404),(18,404),(15,405),(21,407),(33,408),(27,409);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_of_day`
--

DROP TABLE IF EXISTS `theme_of_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_of_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_id` int(11) NOT NULL,
  `describe` varchar(255) NOT NULL,
  `day_of_schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_of_day_2831cc73` (`day_id`),
  KEY `theme_of_day_2a91ef6d` (`day_of_schedule_id`),
  CONSTRAINT `day_id_refs_id_62c8b2e0` FOREIGN KEY (`day_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `day_of_schedule_id_refs_id_62c8b2e0` FOREIGN KEY (`day_of_schedule_id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_of_day`
--

LOCK TABLES `theme_of_day` WRITE;
/*!40000 ALTER TABLE `theme_of_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme_of_day` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typehour`
--

DROP TABLE IF EXISTS `typehour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typehour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `short_name` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typehour`
--

LOCK TABLES `typehour` WRITE;
/*!40000 ALTER TABLE `typehour` DISABLE KEYS */;
INSERT INTO `typehour` VALUES (1,'Лекция','ЛК'),(2,'Практика','ПК'),(3,'Консультация','КН'),(4,'Экзамен','ЭК'),(5,'Курсовое проектирование','КП'),(6,'Проверка курсового проекта','ПК');
/*!40000 ALTER TABLE `typehour` ENABLE KEYS */;
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
INSERT INTO `types_themes` VALUES (1,'ТИП ТЕМЫ');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan`
--

LOCK TABLES `uch_plan` WRITE;
/*!40000 ALTER TABLE `uch_plan` DISABLE KEYS */;
INSERT INTO `uch_plan` VALUES (27,14,7,1,'Z'),(28,15,7,1,'Z'),(29,16,7,1,'Z'),(30,17,7,1,'Z'),(31,18,7,1,'Z'),(32,19,7,1,'E'),(33,20,7,1,'Z'),(34,21,7,1,'Z'),(35,22,7,1,'Z'),(36,23,7,1,'Z'),(37,24,7,1,'Z'),(38,25,7,1,'E'),(39,26,7,1,'Z'),(40,14,8,3,'Z'),(41,27,8,3,'E'),(42,28,8,3,'Z'),(43,15,8,3,'Z'),(44,16,8,3,'Z'),(45,29,8,3,'Z'),(47,30,8,3,'Z'),(48,31,8,3,'Z'),(49,32,8,3,'E'),(50,33,8,3,'E'),(51,20,8,3,'Z'),(52,25,8,3,'Z'),(53,34,8,3,'E'),(54,35,8,3,'Z'),(55,36,8,3,'Z'),(56,37,8,3,'Z'),(57,14,5,5,'Z');
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
  `type_hour_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uch_plan_hour_f8da33a` (`uch_plan_id`),
  KEY `uch_plan_hour_a61604` (`type_hour_id`),
  CONSTRAINT `type_hour_id_refs_id_1a1cedc9` FOREIGN KEY (`type_hour_id`) REFERENCES `typehour` (`id`),
  CONSTRAINT `uch_plan_id_refs_id_54233f09` FOREIGN KEY (`uch_plan_id`) REFERENCES `uch_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan_hour`
--

LOCK TABLES `uch_plan_hour` WRITE;
/*!40000 ALTER TABLE `uch_plan_hour` DISABLE KEYS */;
INSERT INTO `uch_plan_hour` VALUES (43,27,'L',110,1),(44,27,'L',107,1),(45,28,'P',50,2),(46,28,'K',3,3),(47,29,'L',78,1),(48,29,'K',4,3),(49,30,'L',195,1),(50,30,'K',15,3),(51,28,'L',95,1),(52,28,'K',6,3),(53,28,'E',10,4),(54,31,'L',117,1),(55,31,'K',8,3),(56,32,'L',78,1),(57,32,'K',6,3),(58,32,'E',10,4),(59,33,'L',78,1),(60,33,'K',4,3),(61,34,'L',78,1),(62,34,'P',6,2),(63,34,'K',8,3),(64,35,'L',78,1),(65,35,'P',4,2),(66,35,'K',8,3),(67,36,'L',114,1),(68,36,'K',8,3),(69,37,'L',114,1),(70,37,'K',10,3),(71,38,'L',290,1),(72,38,'K',18,3),(73,38,'E',10,4),(74,39,'L',68,1),(75,39,'K',2,3),(76,40,'L',64,1),(77,40,'L',54,1),(78,41,'L',176,1),(79,41,'K',14,3),(80,41,'E',10,4),(81,42,'L',144,1),(82,42,'K',10,3),(83,43,'L',30,1),(84,43,'K',2,3),(85,43,'L',64,1),(86,43,'K',4,3),(87,44,'L',64,1),(88,44,'K',4,3),(89,55,'L',78,1),(90,55,'P',0,2),(91,55,'K',10,3),(92,55,'E',0,4),(93,27,'L',107,1),(94,27,'P',0,2),(95,27,'K',0,3),(96,27,'E',0,4),(97,40,'L',64,1),(98,40,'P',0,2),(99,40,'K',0,3),(100,40,'E',0,4),(101,27,'L',110,1),(102,27,'P',0,2),(103,27,'K',0,3),(104,27,'E',0,4),(105,40,'L',54,1),(106,40,'P',0,2),(107,40,'K',0,3),(108,40,'E',0,4),(109,27,'L',0,1),(110,27,'P',50,2),(111,27,'K',3,3),(112,27,'E',0,4),(113,28,'L',95,1),(114,28,'P',0,2),(115,28,'K',6,3),(116,28,'E',10,4),(117,29,'L',78,1),(118,29,'P',0,2),(119,29,'K',4,3),(120,29,'E',0,4),(121,30,'L',195,1),(122,30,'P',0,2),(123,30,'K',15,3),(124,30,'E',0,4),(125,31,'L',117,1),(126,31,'P',0,2),(127,31,'K',8,3),(128,31,'E',0,4),(129,32,'L',78,1),(130,32,'P',0,2),(131,32,'K',6,3),(132,32,'E',10,4),(133,33,'L',78,1),(134,33,'P',0,2),(135,33,'K',4,3),(136,33,'E',0,4),(137,34,'L',78,1),(138,34,'P',6,2),(139,34,'K',8,3),(140,34,'E',0,4),(141,35,'L',78,1),(142,35,'P',4,2),(143,35,'K',8,3),(144,35,'E',0,4),(145,36,'L',114,1),(146,36,'P',0,2),(147,36,'K',8,3),(148,36,'E',0,4),(149,37,'L',114,1),(150,37,'P',0,2),(151,37,'K',10,3),(152,37,'E',0,4),(153,38,'L',290,1),(154,38,'P',0,2),(155,38,'K',18,3),(156,38,'E',10,4),(157,35,'L',68,1),(158,35,'P',0,2),(159,35,'K',2,3),(160,35,'E',0,4),(161,41,'L',176,1),(162,41,'P',0,2),(163,41,'K',14,3),(164,41,'E',10,4),(165,42,'L',144,1),(166,42,'P',0,2),(167,42,'K',10,3),(168,42,'E',0,4),(169,43,'L',30,1),(170,43,'P',0,2),(171,43,'K',2,3),(172,43,'E',0,4),(173,43,'L',64,1),(174,43,'P',0,2),(175,43,'K',4,3),(176,43,'E',0,4),(177,44,'L',64,1),(178,44,'P',0,2),(179,44,'K',4,3),(180,44,'E',0,4),(181,45,'L',32,1),(182,45,'P',0,2),(183,45,'K',2,3),(184,45,'E',0,4),(185,47,'L',32,1),(186,47,'P',0,2),(187,47,'K',2,3),(188,47,'E',0,4),(189,48,'L',64,1),(190,48,'P',0,2),(191,48,'K',6,3),(192,48,'E',0,4),(193,49,'L',144,1),(194,49,'P',0,2),(195,49,'K',14,3),(196,49,'E',10,4),(197,50,'L',144,1),(198,50,'P',30,2),(199,50,'K',14,3),(200,50,'E',10,4),(201,51,'L',64,1),(202,51,'P',0,2),(203,51,'K',4,3),(204,51,'E',0,4),(205,52,'L',48,1),(206,52,'P',0,2),(207,52,'K',12,3),(208,52,'E',0,4),(209,53,'L',80,1),(210,53,'P',0,2),(211,53,'K',6,3),(212,53,'E',10,4),(213,54,'L',32,1),(214,54,'P',0,2),(215,54,'K',2,3),(216,54,'E',0,4),(217,55,'L',32,1),(218,55,'P',0,2),(219,55,'K',2,3),(220,55,'E',0,4),(221,56,'L',32,1),(222,56,'P',0,2),(223,56,'K',2,3),(224,56,'E',0,4);
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

-- Dump completed on 2012-05-14 17:44:15
