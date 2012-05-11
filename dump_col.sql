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
  `theme_id` int(11) NOT NULL,
  `date_pub` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_42ff452e` (`student_id`),
  KEY `assessment_1079d5be` (`theme_id`),
  CONSTRAINT `student_id_refs_profile_ptr_id_2d859c6f` FOREIGN KEY (`student_id`) REFERENCES `students` (`profile_ptr_id`),
  CONSTRAINT `theme_id_refs_id_21b191e7` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add пользователь',9,'add_profile'),(26,'Can change пользователь',9,'change_profile'),(27,'Can delete пользователь',9,'delete_profile'),(28,'Can add студент',10,'add_students'),(29,'Can change студент',10,'change_students'),(30,'Can delete студент',10,'delete_students'),(31,'Can add преподователь',11,'add_teachers'),(32,'Can change преподователь',11,'change_teachers'),(33,'Can delete преподователь',11,'delete_teachers'),(34,'Can add статус',12,'add_userstatus'),(35,'Can change статус',12,'change_userstatus'),(36,'Can delete статус',12,'delete_userstatus'),(37,'Can add группа',13,'add_group'),(38,'Can change группа',13,'change_group'),(39,'Can delete группа',13,'delete_group'),(40,'Can add должность',14,'add_userpost'),(41,'Can change должность',14,'change_userpost'),(42,'Can delete должность',14,'delete_userpost'),(43,'Can add профессиональное образование',15,'add_po'),(44,'Can change профессиональное образование',15,'change_po'),(45,'Can delete профессиональное образование',15,'delete_po'),(46,'Can add специальность',16,'add_speciality'),(47,'Can change специальность',16,'change_speciality'),(48,'Can delete специальность',16,'delete_speciality'),(49,'Can add тип дисциплины',17,'add_disc_type'),(50,'Can change тип дисциплины',17,'change_disc_type'),(51,'Can delete тип дисциплины',17,'delete_disc_type'),(52,'Can add дисциплина',18,'add_discipline'),(53,'Can change дисциплина',18,'change_discipline'),(54,'Can delete дисциплина',18,'delete_discipline'),(55,'Can add учебный план',19,'add_uchplan'),(56,'Can change учебный план',19,'change_uchplan'),(57,'Can delete учебный план',19,'delete_uchplan'),(58,'Can add час учебного плана',20,'add_uchplanhour'),(59,'Can change час учебного плана',20,'change_uchplanhour'),(60,'Can delete час учебного плана',20,'delete_uchplanhour'),(61,'Can add учебный год',21,'add_year'),(62,'Can change учебный год',21,'change_year'),(63,'Can delete учебный год',21,'delete_year'),(64,'Can add группу студентов',22,'add_groups'),(65,'Can change группу студентов',22,'change_groups'),(66,'Can delete группу студентов',22,'delete_groups'),(67,'Can add студент группы',23,'add_groups_stud'),(68,'Can change студент группы',23,'change_groups_stud'),(69,'Can delete студент группы',23,'delete_groups_stud'),(70,'Can add план группы',24,'add_groups_plan'),(71,'Can change план группы',24,'change_groups_plan'),(72,'Can delete план группы',24,'delete_groups_plan'),(73,'Can add тарификация',25,'add_tariffication'),(74,'Can change тарификация',25,'change_tariffication'),(75,'Can delete тарификация',25,'delete_tariffication'),(76,'Can add кабинет',26,'add_classroom'),(77,'Can change кабинет',26,'change_classroom'),(78,'Can delete кабинет',26,'delete_classroom'),(79,'Can add день расписания',27,'add_schedule_day'),(80,'Can change день расписания',27,'change_schedule_day'),(81,'Can delete день расписания',27,'delete_schedule_day'),(82,'Can add расписание',28,'add_schedule'),(83,'Can change расписание',28,'change_schedule'),(84,'Can delete расписание',28,'delete_schedule'),(85,'Can add расписание на каждый день',29,'add_schedule_empty'),(86,'Can change расписание на каждый день',29,'change_schedule_empty'),(87,'Can delete расписание на каждый день',29,'delete_schedule_empty'),(88,'Can add расписание для преподавателя',30,'add_schedule_filled'),(89,'Can change расписание для преподавателя',30,'change_schedule_filled'),(90,'Can delete расписание для преподавателя',30,'delete_schedule_filled'),(91,'Can add пропуск',31,'add_absences'),(92,'Can change пропуск',31,'change_absences'),(93,'Can delete пропуск',31,'delete_absences'),(94,'Can add тип темы',32,'add_types_themes'),(95,'Can change тип темы',32,'change_types_themes'),(96,'Can delete тип темы',32,'delete_types_themes'),(97,'Can add тему',33,'add_themes'),(98,'Can change тему',33,'change_themes'),(99,'Can delete тему',33,'delete_themes'),(100,'Can add оценку',34,'add_assessment'),(101,'Can change оценку',34,'change_assessment'),(102,'Can delete оценку',34,'delete_assessment'),(124,'Can add пользователь',46,'add_profile'),(125,'Can change пользователь',46,'change_profile'),(126,'Can delete пользователь',46,'delete_profile'),(127,'Can add студента',37,'add_students'),(128,'Can change студента',37,'change_students'),(129,'Can delete студента',37,'delete_students'),(130,'Can add преподователя',38,'add_teachers'),(131,'Can change преподователя',38,'change_teachers'),(132,'Can delete преподователя',38,'delete_teachers'),(133,'Can add статус',36,'add_userstatus'),(134,'Can change статус',36,'change_userstatus'),(135,'Can delete статус',36,'delete_userstatus'),(136,'Can add группа',47,'add_group'),(137,'Can change группа',47,'change_group'),(138,'Can delete группа',47,'delete_group'),(139,'Can add должность',35,'add_userpost'),(140,'Can change должность',35,'change_userpost'),(141,'Can delete должность',35,'delete_userpost'),(142,'Can add профессиональное образование',48,'add_po'),(143,'Can change профессиональное образование',48,'change_po'),(144,'Can delete профессиональное образование',48,'delete_po'),(145,'Can add специальность',42,'add_speciality'),(146,'Can change специальность',42,'change_speciality'),(147,'Can delete специальность',42,'delete_speciality'),(148,'Can add тип дисциплины',45,'add_disc_type'),(149,'Can change тип дисциплины',45,'change_disc_type'),(150,'Can delete тип дисциплины',45,'delete_disc_type'),(151,'Can add дисциплина',44,'add_discipline'),(152,'Can change дисциплина',44,'change_discipline'),(153,'Can delete дисциплина',44,'delete_discipline'),(154,'Can add учебный план',43,'add_uchplan'),(155,'Can change учебный план',43,'change_uchplan'),(156,'Can delete учебный план',43,'delete_uchplan'),(157,'Can add час учебного плана',49,'add_uchplanhour'),(158,'Can change час учебного плана',49,'change_uchplanhour'),(159,'Can delete час учебного плана',49,'delete_uchplanhour'),(160,'Can add учебный год',40,'add_year'),(161,'Can change учебный год',40,'change_year'),(162,'Can delete учебный год',40,'delete_year'),(163,'Can add группу студентов',41,'add_groups'),(164,'Can change группу студентов',41,'change_groups'),(165,'Can delete группу студентов',41,'delete_groups'),(166,'Can add студент группы',50,'add_groups_stud'),(167,'Can change студент группы',50,'change_groups_stud'),(168,'Can delete студент группы',50,'delete_groups_stud'),(169,'Can add план группы',39,'add_groups_plan'),(170,'Can change план группы',39,'change_groups_plan'),(171,'Can delete план группы',39,'delete_groups_plan'),(172,'Can add тарификация',51,'add_tariffication'),(173,'Can change тарификация',51,'change_tariffication'),(174,'Can delete тарификация',51,'delete_tariffication'),(175,'Can add номер пары',52,'add_number_lesson'),(176,'Can change номер пары',52,'change_number_lesson'),(177,'Can delete номер пары',52,'delete_number_lesson');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (8,'admin','','','admin@admin.ru','pbkdf2_sha256$10000$4dzLIucoNoXR$f5NqmOq0zqVqn4mvdEk3BHRD6bh8SGbHOY1xQf8WOP0=',1,1,1,'2012-05-11 11:01:50','2012-04-29 19:13:48'),(9,'ruslan','Руслан','Тарасов','','pbkdf2_sha256$10000$vT6KP8iqg2jw$mwNe5EfbO2lj1WMUID0R+qKvqdByybpxawfp3SEU93o=',0,1,0,'2012-04-29 19:19:39','2012-04-29 19:19:39'),(10,'pasha','Павел','Гаврилов','','pbkdf2_sha256$10000$uSOMGBqRUeT2$nq7O5izw4ZecdMbE0QLVpsC0lRC2g0syke6a/d7UrGI=',0,1,0,'2012-04-29 19:20:35','2012-04-29 19:20:35'),(11,'vahromeev','Виталий','Вахромеев','','pbkdf2_sha256$10000$BAI8hrhG7nVQ$+zdgbiiTm7LCctlr4nPb0rmObNkIayusG8+ZM/lsC7w=',1,1,0,'2012-04-29 20:29:24','2012-04-29 19:21:25'),(12,'zhivoderova','Валентина','Живодерова','','pbkdf2_sha256$10000$7CsW60R5rXRL$0Txyngkbm7nTsp8Tz+KVkKkhaTpWvguqvEZcd/ACBkk=',0,1,0,'2012-04-29 19:22:35','2012-04-29 19:22:35'),(13,'lazareva','Юлия','Лазарева','','pbkdf2_sha256$10000$ggg2LNfXTuNY$sRXcmjtTgVu2QZO3A6oTLBZXGKJbNTpIj/BOHutNZtg=',0,1,0,'2012-05-04 08:51:37','2012-05-04 08:51:37'),(14,'gavrilova','Надежда','Гаврилова','','123',0,1,0,'2012-05-04 08:53:03','2012-05-04 08:53:03'),(15,'masalova','Евгения','Масалова','','123',1,1,0,'2012-05-07 16:56:37','2012-05-07 16:56:37'),(16,'podkolzina','Анджела','Подколзина','','123',0,1,0,'2012-05-07 16:57:30','2012-05-07 16:57:30'),(17,'anashkina','Ольга ','Анашкина','','123',1,1,0,'2012-05-11 11:24:02','2012-05-11 11:24:02'),(18,'antonov','Владимир','Антонов','','123',0,1,0,'2012-05-11 11:25:30','2012-05-11 11:25:30'),(19,'vinogradova','Оксана','Виноградова','','123',1,1,0,'2012-05-11 11:28:32','2012-05-11 11:28:32'),(20,'pahomova','Наталья','Пахомова','','123',0,1,0,'2012-05-11 11:29:15','2012-05-11 11:29:15'),(21,'slepuzhnikova','Марина','Слепужникова','','123',0,1,0,'2012-05-11 11:29:56','2012-05-11 11:29:56'),(22,'hodyuk','Михаил','Ходюк','','123',0,1,0,'2012-05-11 11:30:45','2012-05-11 11:30:45'),(23,'baklanova','Раиса','Бакланова','','123',0,1,0,'2012-05-11 11:31:26','2012-05-11 11:31:26'),(24,'barinov','Василий','Баринов','','123',1,1,0,'2012-05-11 11:32:15','2012-05-11 11:32:15'),(25,'bogdanov','Сергей','Богданов','','123',0,1,0,'2012-05-11 11:33:03','2012-05-11 11:33:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` VALUES (6,'Программное обеспечение компьютерных сетей','ПОКС',2),(7,'Технология разработки программных продуктов','ТРПП',2),(8,'Информационная безопасность','ИБ',2),(9,'Базы данных','БД',2),(10,'Физика','Физика',2),(11,'Английский язык','Анг. яз',2),(12,'История','История',2),(13,'Обществознание','Общество',2),(14,'Физическая культура','Физ-ра',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (236,'2012-04-29 19:17:55',8,36,'1','работник',1,''),(237,'2012-04-29 19:17:55',8,36,'2','работник',1,''),(238,'2012-04-29 19:18:00',8,35,'1','admin',1,''),(239,'2012-04-29 19:20:32',8,37,'9','Тарасов Руслан ',1,''),(240,'2012-04-29 19:21:05',8,37,'10','Гаврилов Павел ',1,''),(241,'2012-04-29 19:22:20',8,38,'11','Вахромеев Виталий ',1,''),(242,'2012-04-29 19:24:43',8,38,'12','Живодерова  ',1,''),(243,'2012-04-29 19:26:07',8,40,'2','2011-09-01 2012-06-30',1,''),(244,'2012-04-29 19:27:08',8,42,'4','Программное обеспечение вычислительной техники и автоматизированных систем 230105.0',1,''),(245,'2012-04-29 19:27:31',8,41,'11','808',1,''),(246,'2012-04-29 19:27:40',8,41,'12','809',1,''),(247,'2012-04-29 19:32:18',8,39,'7','808 / 4 курc',1,''),(248,'2012-04-29 19:32:25',8,39,'8','809 / 3 курc',1,''),(249,'2012-04-29 19:35:52',8,42,'5','Организация обслуживания в общественном питании 1.0',1,''),(250,'2012-04-29 19:36:21',8,41,'13','108',1,''),(251,'2012-04-29 19:37:04',8,41,'14','109',1,''),(252,'2012-04-29 19:37:26',8,41,'15','110',1,''),(253,'2012-04-29 19:37:35',8,41,'16','111',1,''),(254,'2012-04-29 19:40:12',8,42,'6','Реклама 324001.0',1,''),(255,'2012-04-29 19:40:38',8,41,'17','711',1,''),(256,'2012-04-29 19:40:45',8,41,'18','710',1,''),(257,'2012-04-29 19:40:53',8,41,'19','709',1,''),(258,'2012-04-29 19:52:18',8,45,'2','Дисциплина',1,''),(259,'2012-04-29 19:52:25',8,44,'6','ПОКС',1,''),(260,'2012-04-29 19:53:02',8,44,'7','ТРПП',1,''),(261,'2012-04-29 19:54:06',8,44,'8','ИБ',1,''),(262,'2012-04-29 19:54:53',8,44,'9','БД',1,''),(263,'2012-04-29 19:55:07',8,44,'10','Физика',1,''),(264,'2012-04-29 19:58:58',8,43,'11','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(265,'2012-04-29 19:59:05',8,43,'12','ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(266,'2012-04-29 20:05:24',8,39,'9','711 / 1 курc',1,''),(267,'2012-04-29 20:05:32',8,39,'10','710 / 2 курc',1,''),(268,'2012-04-29 20:06:38',8,43,'13','ТРПП / Реклама / 1 семестр',1,''),(269,'2012-04-29 20:06:46',8,43,'14','ТРПП / Реклама / 2 семестр',1,''),(270,'2012-04-29 20:28:37',8,3,'11','vahromeev',2,'Изменен password и is_staff.'),(271,'2012-04-30 13:03:54',8,27,'1','2012-04-26 (False)',3,''),(272,'2012-04-30 13:11:19',8,27,'2','2012-04-26 (False)',3,''),(273,'2012-05-03 14:15:49',8,32,'1','ТИП ТЕМЫ',1,''),(274,'2012-05-03 14:16:23',8,33,'1','Лось и его разновидности',1,''),(275,'2012-05-03 14:16:42',8,34,'1','5',1,''),(276,'2012-05-03 14:39:26',8,34,'2','4',1,''),(277,'2012-05-03 14:58:31',8,26,'1','216',1,''),(278,'2012-05-03 14:58:55',8,28,'1','Вахромеев Виталий , ПОКС, 808, 2012-05-03 (False), 1',1,''),(279,'2012-05-03 17:14:42',8,28,'2','Вахромеев Виталий , ПОКС, 808, 2012-05-03, 2',1,''),(280,'2012-05-03 17:14:54',8,28,'3','Вахромеев Виталий , ПОКС, 808, 2012-05-03, 4',1,''),(281,'2012-05-04 08:51:20',8,28,'4','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 1',1,''),(282,'2012-05-04 08:53:03',8,38,'13','Лазарева Юлия ',1,''),(283,'2012-05-04 08:53:57',8,38,'14','Гаврилова Надежда ',1,''),(284,'2012-05-04 08:54:13',8,38,'12','Живодерова Валентина ',2,'Изменен first_name.'),(285,'2012-05-04 08:55:18',8,44,'11','Анг. яз',1,''),(286,'2012-05-04 08:55:30',8,44,'12','История',1,''),(287,'2012-05-04 08:55:48',8,44,'13','Общество',1,''),(288,'2012-05-04 08:56:10',8,43,'15','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(289,'2012-05-04 08:56:20',8,43,'16','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(290,'2012-05-04 08:56:31',8,43,'17','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(291,'2012-05-04 08:56:39',8,43,'18','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(292,'2012-05-04 08:57:01',8,49,'37','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(293,'2012-05-04 08:57:11',8,49,'38','Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(294,'2012-05-04 08:57:22',8,49,'39','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр / L / 160 часов',1,''),(295,'2012-05-04 08:57:38',8,51,'34','Лазарева Юлия  808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(296,'2012-05-04 08:57:53',8,51,'35','Лазарева Юлия  808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(297,'2012-05-04 08:58:55',8,28,'5','Лазарева Юлия , Анг. яз, 808, 2012-05-04, 1',1,''),(298,'2012-05-04 08:59:06',8,28,'6','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 2',1,''),(299,'2012-05-04 08:59:25',8,28,'7','Живодерова Валентина , ТРПП, 711, 2012-05-04, 3',1,''),(300,'2012-05-04 09:00:48',8,26,'2','202',1,''),(301,'2012-05-04 09:00:52',8,26,'3','201',1,''),(302,'2012-05-04 09:00:58',8,26,'4','306',1,''),(303,'2012-05-04 09:01:33',8,28,'4','Вахромеев Виталий , ПОКС, 808, 2012-05-04, 5',2,'Изменен num_less.'),(304,'2012-05-04 09:14:24',8,38,'11','Вахромеев Виталий Владимирович',2,'Изменен other_name.'),(305,'2012-05-04 09:14:46',8,38,'12','Живодерова Валентина Викторовна',2,'Изменен other_name и sex.'),(306,'2012-05-04 09:15:04',8,38,'13','Лазарева Юлия Николаевна',2,'Изменен other_name и sex.'),(307,'2012-05-04 09:15:24',8,38,'14','Гаврилова Надежда Алексеевна',2,'Изменен other_name и sex.'),(308,'2012-05-04 16:29:59',8,28,'8','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',1,''),(309,'2012-05-06 02:10:07',8,28,'9','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 2',1,''),(310,'2012-05-06 02:10:20',8,28,'10','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 3',1,''),(311,'2012-05-06 02:11:15',8,28,'11','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-05, 2',1,''),(312,'2012-05-06 02:11:51',8,28,'11','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-05, 2',3,''),(313,'2012-05-07 15:36:39',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',1,''),(314,'2012-05-07 15:36:58',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 4',2,'Изменен num_less.'),(315,'2012-05-07 15:37:19',8,28,'12','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 3',1,''),(316,'2012-05-07 16:32:30',8,28,'1','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 1',3,''),(317,'2012-05-07 16:32:30',8,28,'2','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 2',3,''),(318,'2012-05-07 16:32:30',8,28,'3','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-03, 4',3,''),(319,'2012-05-07 16:32:30',8,28,'4','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-04, 5',3,''),(320,'2012-05-07 16:32:30',8,28,'5','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 1',3,''),(321,'2012-05-07 16:32:30',8,28,'6','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-04, 2',3,''),(322,'2012-05-07 16:32:30',8,28,'7','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 3',3,''),(323,'2012-05-07 16:32:30',8,28,'8','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 5',3,''),(324,'2012-05-07 16:32:30',8,28,'9','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 2',3,''),(325,'2012-05-07 16:32:30',8,28,'10','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-05, 3',3,''),(326,'2012-05-07 16:32:30',8,28,'11','Живодерова Валентина Викторовна, ТРПП, 711, 2012-05-04, 4',3,''),(327,'2012-05-07 16:32:30',8,28,'12','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-04, 3',3,''),(328,'2012-05-07 16:39:40',8,26,'1','216',3,''),(329,'2012-05-07 16:39:40',8,26,'2','202',3,''),(330,'2012-05-07 16:39:40',8,26,'3','201',3,''),(331,'2012-05-07 16:39:40',8,26,'4','306',3,''),(332,'2012-05-07 16:39:53',8,27,'3','2012-04-30 (False)',3,''),(333,'2012-05-07 16:39:53',8,27,'4','2012-05-01 (False)',3,''),(334,'2012-05-07 16:39:53',8,27,'5','2012-05-03 (False)',3,''),(335,'2012-05-07 16:39:53',8,27,'6','2012-05-02 (False)',3,''),(336,'2012-05-07 16:39:53',8,27,'7','2012-05-04 (False)',3,''),(337,'2012-05-07 16:39:53',8,27,'8','2012-05-05 (False)',3,''),(338,'2012-05-07 16:39:53',8,27,'9','2012-05-06 (False)',3,''),(339,'2012-05-07 16:39:53',8,27,'10','2012-05-10 (False)',3,''),(340,'2012-05-07 16:43:34',8,51,'18','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 170 часов',3,''),(341,'2012-05-07 16:43:34',8,51,'19','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / P / 70 часов',3,''),(342,'2012-05-07 16:43:34',8,51,'20','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / S / 0 часов',3,''),(343,'2012-05-07 16:43:34',8,51,'21','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / E / 0 часов',3,''),(344,'2012-05-07 16:43:34',8,51,'22','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',3,''),(345,'2012-05-07 16:43:34',8,51,'23','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / P / 70 часов',3,''),(346,'2012-05-07 16:43:34',8,51,'24','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / S / 8 часов',3,''),(347,'2012-05-07 16:43:34',8,51,'25','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 12 часов',3,''),(348,'2012-05-07 16:43:34',8,51,'26','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 170 часов',3,''),(349,'2012-05-07 16:43:34',8,51,'27','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / P / 40 часов',3,''),(350,'2012-05-07 16:43:34',8,51,'28','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / S / 0 часов',3,''),(351,'2012-05-07 16:43:34',8,51,'29','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / E / 0 часов',3,''),(352,'2012-05-07 16:43:34',8,51,'30','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',3,''),(353,'2012-05-07 16:43:35',8,51,'31','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / P / 0 часов',3,''),(354,'2012-05-07 16:43:35',8,51,'32','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / S / 8 часов',3,''),(355,'2012-05-07 16:43:35',8,51,'33','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / E / 12 часов',3,''),(356,'2012-05-07 16:43:35',8,51,'34','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',3,''),(357,'2012-05-07 16:43:35',8,51,'35','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',3,''),(358,'2012-05-07 16:49:15',8,42,'7','Прикладная информатика по отраслям 230701.0',1,''),(359,'2012-05-07 16:49:54',8,42,'8','Техническое обслуживание и ремонт автомобильного транспорта 190604.0',1,''),(360,'2012-05-07 16:50:14',8,42,'9','Повар 34.2',1,''),(361,'2012-05-07 16:50:33',8,42,'10','Автомеханик 30.2',1,''),(362,'2012-05-07 16:50:52',8,42,'11','Программирование в компьютерных системах 230115.0',1,''),(363,'2012-05-07 16:53:02',8,41,'20','208',1,''),(364,'2012-05-07 16:53:13',8,41,'21','209',1,''),(365,'2012-05-07 16:53:39',8,41,'22','908',1,''),(366,'2012-05-07 16:53:49',8,41,'23','910',1,''),(367,'2012-05-07 16:53:56',8,41,'24','911',1,''),(368,'2012-05-07 16:54:31',8,41,'25','410',1,''),(369,'2012-05-07 16:54:58',8,41,'26','507',1,''),(370,'2012-05-07 16:55:07',8,41,'27','508',1,''),(371,'2012-05-07 16:55:18',8,41,'28','509',1,''),(372,'2012-05-07 16:55:28',8,41,'29','510',1,''),(373,'2012-05-07 16:55:35',8,41,'30','511',1,''),(374,'2012-05-07 16:57:29',8,38,'15','Масалова Евгения Алексеевна',1,''),(375,'2012-05-07 16:59:16',8,38,'16','Подколзина Анджела Ивановна',1,''),(376,'2012-05-07 17:13:22',8,39,'11','908 / 4 курc',1,''),(377,'2012-05-07 17:13:31',8,39,'12','910 / 2 курc',1,''),(378,'2012-05-07 17:13:43',8,39,'13','208 / 4 курc',1,''),(379,'2012-05-07 17:13:57',8,39,'14','209 / 3 курc',1,''),(380,'2012-05-07 17:14:04',8,39,'15','507 / 5 курc',1,''),(381,'2012-05-07 17:14:11',8,39,'16','508 / 4 курc',1,''),(382,'2012-05-07 17:14:18',8,39,'17','509 / 3 курc',1,''),(383,'2012-05-07 17:26:15',8,39,'18','510 / 2 курc',1,''),(384,'2012-05-07 17:26:21',8,39,'19','511 / 1 курc',1,''),(385,'2012-05-07 17:51:42',8,43,'19','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(386,'2012-05-07 17:51:50',8,43,'20','Физика / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(387,'2012-05-07 17:51:57',8,43,'21','История / Программное обеспечение вычислительной техники и автоматизированных систем / 1 семестр',1,''),(388,'2012-05-07 17:52:07',8,43,'22','История / Программное обеспечение вычислительной техники и автоматизированных систем / 2 семестр',1,''),(389,'2012-05-07 17:52:19',8,43,'23','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр',1,''),(390,'2012-05-07 17:52:27',8,43,'24','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр',1,''),(391,'2012-05-07 18:05:28',8,43,'25','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр',1,''),(392,'2012-05-07 18:05:36',8,43,'26','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр',1,''),(393,'2012-05-07 18:06:09',8,49,'40','История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',1,''),(394,'2012-05-07 18:06:17',8,49,'41','История / Техническое обслуживание и ремонт автомобильного транспорта / 2 семестр / L / 80 часов',1,''),(395,'2012-05-07 18:06:53',8,51,'36','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 200 часов',1,''),(396,'2012-05-07 18:07:04',8,51,'37','Вахромеев Виталий Владимирович 808 / 4 курc ПОКС / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 120 часов',1,''),(397,'2012-05-07 18:07:35',8,51,'38','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 1 семестр / L / 100 часов',1,''),(398,'2012-05-07 18:07:45',8,51,'39','Живодерова Валентина Викторовна 711 / 1 курc ТРПП / Реклама / 2 семестр / L / 50 часов',1,''),(399,'2012-05-07 18:08:48',8,51,'40','Вахромеев Виталий Владимирович 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 7 семестр / L / 120 часов',1,''),(400,'2012-05-07 18:09:02',8,51,'41','Лазарева Юлия Николаевна 808 / 4 курc Анг. яз / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / L / 70 часов',1,''),(401,'2012-05-07 18:09:21',8,51,'42','Гаврилова Надежда Алексеевна 511 / 1 курc История / Техническое обслуживание и ремонт автомобильного транспорта / 1 семестр / L / 100 часов',1,''),(402,'2012-05-07 18:09:49',8,26,'5','301',1,''),(403,'2012-05-07 18:09:55',8,26,'6','302',1,''),(404,'2012-05-07 18:10:00',8,26,'7','201',1,''),(405,'2012-05-07 18:10:00',8,26,'8','201',1,''),(406,'2012-05-07 18:10:04',8,26,'9','216',1,''),(407,'2012-05-07 18:10:07',8,26,'10','214',1,''),(408,'2012-05-07 18:10:25',8,28,'13','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 1',1,''),(409,'2012-05-07 18:10:39',8,28,'14','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 2',1,''),(410,'2012-05-07 18:11:03',8,28,'15','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-07, 1',1,''),(411,'2012-05-07 18:11:27',8,28,'16','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-07, 2',1,''),(412,'2012-05-07 18:11:37',8,28,'17','Вахромеев Виталий Владимирович, ПОКС, 808, 2012-05-07, 3',1,''),(413,'2012-05-07 18:11:48',8,28,'18','Вахромеев Виталий Владимирович, Анг. яз, 808, 2012-05-07, 4',1,''),(414,'2012-05-11 00:05:13',8,28,'19','Лазарева Юлия Николаевна, Анг. яз, 808, 2012-05-07, 5',1,''),(415,'2012-05-11 00:26:13',8,49,'42','ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',1,''),(416,'2012-05-11 00:27:09',8,51,'43','Вахромеев Виталий Владимирович 908 / 4 курc ИБ / Программное обеспечение вычислительной техники и автоматизированных систем / 8 семестр / E / 10 часов',1,''),(417,'2012-05-11 00:28:09',8,28,'20','Вахромеев Виталий Владимирович, ИБ, 908, 2012-05-07, 1',1,''),(418,'2012-05-11 00:28:19',8,28,'21','Вахромеев Виталий Владимирович, ИБ, 908, 2012-05-07, 5',1,''),(419,'2012-05-11 00:50:00',8,28,'22','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 3',1,''),(420,'2012-05-11 00:50:11',8,28,'23','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 4',1,''),(421,'2012-05-11 00:50:19',8,28,'24','Гаврилова Надежда Алексеевна, История, 511, 2012-05-07, 5',1,''),(422,'2012-05-11 11:22:39',8,44,'14','Физ-ра',1,''),(423,'2012-05-11 11:23:14',8,43,'27','Физ-ра / Прикладная информатика по отраслям / 1 семестр',1,''),(424,'2012-05-11 11:23:23',8,49,'43','Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',1,''),(425,'2012-05-11 11:23:52',8,39,'20','911 / 1 курc',1,''),(426,'2012-05-11 11:25:01',8,38,'17','Анашкина Ольга  Викторовна',1,''),(427,'2012-05-11 11:25:08',8,51,'44','Анашкина Ольга  Викторовна 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 110 часов',1,''),(428,'2012-05-11 11:25:26',8,49,'44','Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',1,''),(429,'2012-05-11 11:26:06',8,38,'18','Антонов Владимир Иванович',1,''),(430,'2012-05-11 11:26:12',8,51,'45','Антонов Владимир Иванович 911 / 1 курc Физ-ра / Прикладная информатика по отраслям / 1 семестр / L / 107 часов',1,''),(431,'2012-05-11 11:26:43',8,26,'11','404',1,''),(432,'2012-05-11 11:26:49',8,28,'25','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 1',1,''),(433,'2012-05-11 11:27:00',8,28,'26','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 3',1,''),(434,'2012-05-11 11:27:11',8,28,'27','Анашкина Ольга  Викторовна, Физ-ра, 911, 2012-05-07, 5',1,''),(435,'2012-05-11 11:27:22',8,28,'28','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 2',1,''),(436,'2012-05-11 11:27:36',8,28,'29','Антонов Владимир Иванович, Физ-ра, 911, 2012-05-07, 4',1,''),(437,'2012-05-11 11:29:15',8,38,'19','Виноградова Оксана Владимировна',1,''),(438,'2012-05-11 11:29:55',8,38,'20','Пахомова Наталья Валерьевна',1,''),(439,'2012-05-11 11:30:44',8,38,'21','Слепужникова Марина Ивановна',1,''),(440,'2012-05-11 11:31:26',8,38,'22','Ходюк Михаил Андреевич',1,''),(441,'2012-05-11 11:32:15',8,38,'23','Бакланова Раиса Абдуловна',1,''),(442,'2012-05-11 11:33:03',8,38,'24','Баринов Василий Константинович',1,''),(443,'2012-05-11 11:33:43',8,38,'25','Богданов Сергей Григорьевич',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'пользователь','main','profile'),(10,'студент','main','students'),(11,'преподователь','main','teachers'),(12,'статус','main','userstatus'),(13,'группа','main','group'),(14,'должность','main','userpost'),(15,'профессиональное образование','main','po'),(16,'специальность','main','speciality'),(17,'тип дисциплины','main','disc_type'),(18,'дисциплина','main','discipline'),(19,'учебный план','main','uchplan'),(20,'час учебного плана','main','uchplanhour'),(21,'учебный год','main','year'),(22,'группу студентов','main','groups'),(23,'студент группы','main','groups_stud'),(24,'план группы','main','groups_plan'),(25,'тарификация','main','tariffication'),(26,'кабинет','schedule','classroom'),(27,'день расписания','schedule','schedule_day'),(28,'расписание','schedule','schedule'),(29,'расписание на каждый день','schedule','schedule_empty'),(30,'расписание для преподавателя','schedule','schedule_filled'),(31,'пропуск','schedule','absences'),(32,'тип темы','journal','types_themes'),(33,'тему','journal','themes'),(34,'оценку','journal','assessment'),(35,'должность','tariffication','userpost'),(36,'статус','tariffication','userstatus'),(37,'студент','tariffication','students'),(38,'преподователя','tariffication','teachers'),(39,'план группы','tariffication','groups_plan'),(40,'учебный год','tariffication','year'),(41,'группу студентов','tariffication','groups'),(42,'специальность','tariffication','speciality'),(43,'учебный план','tariffication','uchplan'),(44,'дисциплина','tariffication','discipline'),(45,'тип дисциплины','tariffication','disc_type'),(46,'пользователь','tariffication','profile'),(47,'группа','tariffication','group'),(48,'профессиональное образование','tariffication','po'),(49,'час учебного плана','tariffication','uchplanhour'),(50,'студент группы','tariffication','groups_stud'),(51,'тарификация','tariffication','tariffication'),(52,'номер пары','schedule','number_lesson');
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
INSERT INTO `django_session` VALUES ('0f5dd281919437a255e13a0fbea5ee2c','MmRkYTM4NzIzNzNkZDBkNDg0YmYyMDkyZjBiNjRhZjFjNGM1N2I1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQt1Lg==\n','2012-05-13 20:29:24'),('114b157d179346ac7db812088279ff49','ZDFjMGJhODhmYzE0YWMyMjViMzYyNTkxNzE3ODliOTQyYWNlYmQzZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQhVCV9tZXNzYWdlc3EFXXEGKGNkamFuZ28uY29udHJpYi5tZXNz\nYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBymBcQh9cQkoVQpleHRyYV90YWdzcQpYAAAAAFUH\nbWVzc2FnZXELWJ8AAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0JjRgdGC0L7RgNC40Y8iINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQtNC40YHRhtC40L/Qu9C40L3Q\nsC5xDFUFbGV2ZWxxDUsUdWJoBymBcQ59cQ8oVQpleHRyYV90YWdzcRBYAAAAAFUHbWVzc2FnZXER\nWE8AAADQtNC40YHRhtC40L/Qu9C40L3QsCAi0J7QsdGJ0LXRgdGC0LLQviIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0ucRJVBWxldmVscRNLFHViaAcpgXEUfXEVKFUKZXh0\ncmFfdGFnc3EWWAAAAABVB21lc3NhZ2VxF1hHAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCQ\n0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQ\ntSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+\n0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA3INGB0LXQvNC10YHR\ngtGAIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLR\niyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQ\nvdGL0Lkg0L/Qu9Cw0L0ucRhVBWxldmVscRlLFHViaAcpgXEafXEbKFUKZXh0cmFfdGFnc3EcWAAA\nAABVB21lc3NhZ2VxHVhHAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCQ0L3Qsy4g0Y/QtyAv\nINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQtSDQstGL0YfQuNGB\n0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+0LzQsNGC0LjQt9C4\n0YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHRgtGAIiDQsdGL0Lsg\n0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC\n0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw\n0L0ucR5VBWxldmVscR9LFHViaAcpgXEgfXEhKFUKZXh0cmFfdGFnc3EiWAAAAABVB21lc3NhZ2Vx\nI1hJAQAA0YPRh9C10LHQvdGL0Lkg0L/Qu9Cw0L0gItCY0YHRgtC+0YDQuNGPIC8g0J/RgNC+0LPR\ngNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3QuNC1INCy0YvRh9C40YHQu9C40YLQtdC7\n0YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC0L7QvNCw0YLQuNC30LjRgNC+0LLQsNC9\n0L3Ri9GFINGB0LjRgdGC0LXQvCAvIDEg0YHQtdC80LXRgdGC0YAiINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQ\nsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRg9GH0LXQsdC90YvQuSDQv9C70LDQvS5xJFUFbGV2\nZWxxJUsUdWJoBymBcSZ9cScoVQpleHRyYV90YWdzcShYAAAAAFUHbWVzc2FnZXEpWPQAAADRg9GH\n0LXQsdC90YvQuSDQv9C70LDQvSAi0JjRgdGC0L7RgNC40Y8gLyDQn9GA0L7Qs9GA0LDQvNC80L3Q\nvtC1INC+0LHQtdGB0L/QtdGH0LXQvdC40LUg0LLRi9GH0LjRgdC70LjRgtC10LvRjNC90L7QuSDR\ngtC10YXQvdC40LrQuCDQuCDQsNCy0YLQvtC80LDRgtC40LfQuNGA0L7QstCw0L3QvdGL0YUg0YHQ\nuNGB0YLQtdC8IC8gMiDRgdC10LzQtdGB0YLRgCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7Q\nsdCw0LLQu9C10L0ucSpVBWxldmVscStLFHViaAcpgXEsfXEtKFUKZXh0cmFfdGFnc3EuWAAAAABV\nB21lc3NhZ2VxL1hyAQAA0YfQsNGBINGD0YfQtdCx0L3QvtCz0L4g0L/Qu9Cw0L3QsCAi0JDQvdCz\nLiDRj9C3IC8g0J/RgNC+0LPRgNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3QuNC1INCy\n0YvRh9C40YHQu9C40YLQtdC70YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC0L7QvNCw\n0YLQuNC30LjRgNC+0LLQsNC90L3Ri9GFINGB0LjRgdGC0LXQvCAvIDcg0YHQtdC80LXRgdGC0YAg\nLyBMIC8gMTIwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQ\ntdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQ\nvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C70LDQvdCwLnEwVQVsZXZlbHExSxR1\nYmgHKYFxMn1xMyhVCmV4dHJhX3RhZ3NxNFgAAAAAVQdtZXNzYWdlcTVYcQEAANGH0LDRgSDRg9GH\n0LXQsdC90L7Qs9C+INC/0LvQsNC90LAgItCQ0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQ\nvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQtSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5\nINGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDR\ngdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHRgtGAIC8gTCAvIDcwINGH0LDRgdC+0LIiINCx0YvQ\nuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+\n0LPQviDQv9C70LDQvdCwLnE2VQVsZXZlbHE3SxR1YmgHKYFxOH1xOShVCmV4dHJhX3RhZ3NxOlgA\nAAAAVQdtZXNzYWdlcTtYdAEAANGH0LDRgSDRg9GH0LXQsdC90L7Qs9C+INC/0LvQsNC90LAgItCY\n0YHRgtC+0YDQuNGPIC8g0J/RgNC+0LPRgNCw0LzQvNC90L7QtSDQvtCx0LXRgdC/0LXRh9C10L3Q\nuNC1INCy0YvRh9C40YHQu9C40YLQtdC70YzQvdC+0Lkg0YLQtdGF0L3QuNC60Lgg0Lgg0LDQstGC\n0L7QvNCw0YLQuNC30LjRgNC+0LLQsNC90L3Ri9GFINGB0LjRgdGC0LXQvCAvIDEg0YHQtdC80LXR\ngdGC0YAgLyBMIC8gMTYwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQ\nsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC1\n0YnQtSDQvtC00LjQvSDRh9Cw0YEg0YPRh9C10LHQvdC+0LPQviDQv9C70LDQvdCwLnE8VQVsZXZl\nbHE9SxR1YmgHKYFxPn1xPyhVCmV4dHJhX3RhZ3NxQFgAAAAAVQdtZXNzYWdlcUFYhQEAANGC0LDR\ngNC40YTQuNC60LDRhtC40Y8gItCb0LDQt9Cw0YDQtdCy0LAg0K7Qu9C40Y8gIDgwOCAvIDQg0LrR\ng9GAYyDQkNC90LMuINGP0LcgLyDQn9GA0L7Qs9GA0LDQvNC80L3QvtC1INC+0LHQtdGB0L/QtdGH\n0LXQvdC40LUg0LLRi9GH0LjRgdC70LjRgtC10LvRjNC90L7QuSDRgtC10YXQvdC40LrQuCDQuCDQ\nsNCy0YLQvtC80LDRgtC40LfQuNGA0L7QstCw0L3QvdGL0YUg0YHQuNGB0YLQtdC8IC8gNyDRgdC1\n0LzQtdGB0YLRgCAvIEwgLyAxMjAg0YfQsNGB0L7QsiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGC0LDRgNC40YTQuNC60LDRhtC40Y8ucUJVBWxldmVscUNLFHVi\naAcpgXFEfXFFKFUKZXh0cmFfdGFnc3FGWAAAAABVB21lc3NhZ2VxR1gwAQAA0YLQsNGA0LjRhNC4\n0LrQsNGG0LjRjyAi0JvQsNC30LDRgNC10LLQsCDQrtC70LjRjyAgODA4IC8gNCDQutGD0YBjINCQ\n0L3Qsy4g0Y/QtyAvINCf0YDQvtCz0YDQsNC80LzQvdC+0LUg0L7QsdC10YHQv9C10YfQtdC90LjQ\ntSDQstGL0YfQuNGB0LvQuNGC0LXQu9GM0L3QvtC5INGC0LXRhdC90LjQutC4INC4INCw0LLRgtC+\n0LzQsNGC0LjQt9C40YDQvtCy0LDQvdC90YvRhSDRgdC40YHRgtC10LwgLyA4INGB0LXQvNC10YHR\ngtGAIC8gTCAvIDcwINGH0LDRgdC+0LIiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LnFIVQVsZXZlbHFJSxR1YmgHKYFxSn1xSyhVCmV4dHJhX3RhZ3NxTFgAAAAAVQdtZXNz\nYWdlcU1YzQAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQm9Cw0LfQsNGA0LXQstCwINCu0LvQuNGP\nICwg0JDQvdCzLiDRj9C3LCA4MDgsIDIwMTItMDUtMDQsIDEiINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy\n0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgNCw0YHQv9C40YHQsNC90LjQtS5xTlUFbGV2ZWxxT0sU\ndWJoBymBcVB9cVEoVQpleHRyYV90YWdzcVJYAAAAAFUHbWVzc2FnZXFTWNEAAADRgNCw0YHQv9C4\n0YHQsNC90LjQtSAi0JLQsNGF0YDQvtC80LXQtdCyINCS0LjRgtCw0LvQuNC5ICwg0J/QntCa0KEs\nIDgwOCwgMjAxMi0wNS0wNCwgMiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C1\n0L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC0Ywg0LXRidC1INC+\n0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnFUVQVsZXZlbHFVSxR1YmgHKYFxVn1xVyhVCmV4\ndHJhX3RhZ3NxWFgAAAAAVQdtZXNzYWdlcVlYhQAAANGA0LDRgdC/0LjRgdCw0L3QuNC1ICLQltC4\n0LLQvtC00LXRgNC+0LLQsCDQktCw0LvQtdC90YLQuNC90LAgLCDQotCg0J/QnywgNzExLCAyMDEy\nLTA1LTA0LCAzIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS5xWlUFbGV2\nZWxxW0sUdWJoBymBcVx9cV0oVQpleHRyYV90YWdzcV5YAAAAAFUHbWVzc2FnZXFfWIgAAADQutCw\n0LHQuNC90LXRgiAiMjAyIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g\n0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC4\n0L0g0LrQsNCx0LjQvdC10YIucWBVBWxldmVscWFLFHViaAcpgXFifXFjKFUKZXh0cmFfdGFnc3Fk\nWAAAAABVB21lc3NhZ2VxZViIAAAA0LrQsNCx0LjQvdC10YIgIjIwMSIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7Q\nsdCw0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC60LDQsdC40L3QtdGCLnFmVQVsZXZlbHFnSxR1\nYmgHKYFxaH1xaShVCmV4dHJhX3RhZ3NxalgAAAAAVQdtZXNzYWdlcWtYiAAAANC60LDQsdC40L3Q\ntdGCICIzMDYiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQutCw\n0LHQuNC90LXRgi5xbFUFbGV2ZWxxbUsUdWJoBymBcW59cW8oVQpleHRyYV90YWdzcXBYAAAAAFUH\nbWVzc2FnZXFxWH0AAADRgNCw0YHQv9C40YHQsNC90LjQtSAi0JLQsNGF0YDQvtC80LXQtdCyINCS\n0LjRgtCw0LvQuNC5ICwg0J/QntCa0KEsIDgwOCwgMjAxMi0wNS0wNCwgNSIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC40LfQvNC10L3QtdC9LnFyVQVsZXZlbHFzSxR1YmgHKYFxdH1xdShVCmV4dHJh\nX3RhZ3NxdlgAAAAAVQdtZXNzYWdlcXdYfQAAANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQ\nktCw0YXRgNC+0LzQtdC10LIg0JLQuNGC0LDQu9C40Lkg0JLQu9Cw0LTQuNC80LjRgNC+0LLQuNGH\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0ucXhVBWxldmVscXlLFHViaAcp\ngXF6fXF7KFUKZXh0cmFfdGFnc3F8WAAAAABVB21lc3NhZ2VxfVh/AAAA0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8gItCW0LjQstC+0LTQtdGA0L7QstCwINCS0LDQu9C10L3RgtC40L3QsCDQktC4\n0LrRgtC+0YDQvtCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LnF+\nVQVsZXZlbHF/SxR1YmgHKYFxgH1xgShVCmV4dHJhX3RhZ3NxglgAAAAAVQdtZXNzYWdlcYNYcQAA\nANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQm9Cw0LfQsNGA0LXQstCwINCu0LvQuNGPINCd\n0LjQutC+0LvQsNC10LLQvdCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0u\ncYRVBWxldmVscYVLFHViaAcpgXGGfXGHKFUKZXh0cmFfdGFnc3GIWAAAAABVB21lc3NhZ2VxiVh5\nAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCT0LDQstGA0LjQu9C+0LLQsCDQndCw0LTQ\ntdC20LTQsCDQkNC70LXQutGB0LXQtdCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQ\nvNC10L3QtdC9LnGKVQVsZXZlbHGLSxR1YmgHKYFxjH1xjShVCmV4dHJhX3RhZ3NxjlgAAAAAVQdt\nZXNzYWdlcY9YKwAAANCf0LDRgNC+0LvRjCDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS5x\nkFUFbGV2ZWxxkUsZdWJldS4=\n','2012-05-18 09:15:43'),('22a1aed379cafc6e4d819e7626af8f04','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-25 11:01:37'),('4aea3198e6c225e423c72e4f949534e8','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-14 13:01:59'),('726e150a856a3fcb40e73ee172911ae1','YmNjZGU3ZGJhZDkyNzM1Y2ZjYmM1NDVlZWMwMDYzYzhiY2NlYmUzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-22 00:22:03'),('72b3d2c131a0537f55f8fb772f2f803b','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-25 11:01:38'),('9e2f53fa3d59c6bbde647b9701987f1f','YmNjZGU3ZGJhZDkyNzM1Y2ZjYmM1NDVlZWMwMDYzYzhiY2NlYmUzMzqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-05-14 13:01:59'),('a1e44e9fc98da76d8cd739c0092e1458','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-17 17:31:09'),('a9da73c40bd5b8fa740d3de5107727a4','ZWI5ZjI4MzdiMDY5NjhkMGE1MzNhMTI0ZGIwYjg4NmFmNDQ0Yzg4YTqAAn1xAShVCV9tZXNzYWdl\nc3ECXXEDKGNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBCmB\ncQV9cQYoVQpleHRyYV90YWdzcQdYAAAAAFUHbWVzc2FnZXEIWOMAAADRgNCw0YHQv9C40YHQsNC9\n0LjQtSAi0JDQvdCw0YjQutC40L3QsCDQntC70YzQs9CwICDQktC40LrRgtC+0YDQvtCy0L3QsCwg\n0KTQuNC3LdGA0LAsIDkxMSwgMjAxMi0wNS0wNywgMyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC0\n0L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQuNGC\n0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEJVQVsZXZlbHEKSxR1YmgE\nKYFxC31xDChVCmV4dHJhX3RhZ3NxDVgAAAAAVQdtZXNzYWdlcQ5Y4wAAANGA0LDRgdC/0LjRgdCw\n0L3QuNC1ICLQkNC90LDRiNC60LjQvdCwINCe0LvRjNCz0LAgINCS0LjQutGC0L7RgNC+0LLQvdCw\nLCDQpNC40Lct0YDQsCwgOTExLCAyMDEyLTA1LTA3LCA1IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g\n0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC4\n0YLRjCDQtdGJ0LUg0L7QtNC40L0g0YDQsNGB0L/QuNGB0LDQvdC40LUucQ9VBWxldmVscRBLFHVi\naAQpgXERfXESKFUKZXh0cmFfdGFnc3ETWAAAAABVB21lc3NhZ2VxFFjiAAAA0YDQsNGB0L/QuNGB\n0LDQvdC40LUgItCQ0L3RgtC+0L3QvtCyINCS0LvQsNC00LjQvNC40YAg0JjQstCw0L3QvtCy0LjR\nhywg0KTQuNC3LdGA0LAsIDkxMSwgMjAxMi0wNS0wNywgMiIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEVVQVsZXZlbHEWSxR1\nYmgEKYFxF31xGChVCmV4dHJhX3RhZ3NxGVgAAAAAVQdtZXNzYWdlcRpYkAAAANGA0LDRgdC/0LjR\ngdCw0L3QuNC1ICLQkNC90YLQvtC90L7QsiDQktC70LDQtNC40LzQuNGAINCY0LLQsNC90L7QstC4\n0YcsINCk0LjQty3RgNCwLCA5MTEsIDIwMTItMDUtMDcsIDQiINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQtNC+0LHQsNCy0LvQtdC9LnEbVQVsZXZlbHEcSxR1YmgEKYFxHX1xHihVCmV4dHJhX3RhZ3Nx\nH1gAAAAAVQdtZXNzYWdlcSBY2QAAANC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQktC40L3Q\nvtCz0YDQsNC00L7QstCwINCe0LrRgdCw0L3QsCDQktC70LDQtNC40LzQuNGA0L7QstC90LAiINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7Q\nttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQv9GA0LXQv9C+0LTQvtCy\n0LDRgtC10LvRjy5xIVUFbGV2ZWxxIksUdWJoBCmBcSN9cSQoVQpleHRyYV90YWdzcSVYAAAAAFUH\nbWVzc2FnZXEmWNEAAADQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjyAi0J/QsNGF0L7QvNC+0LLQ\nsCDQndCw0YLQsNC70YzRjyDQktCw0LvQtdGA0YzQtdCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQ\nvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw\n0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnEnVQVs\nZXZlbHEoSxR1YmgEKYFxKX1xKihVCmV4dHJhX3RhZ3NxK1gAAAAAVQdtZXNzYWdlcSxY0wAAANC/\n0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQodC70LXQv9GD0LbQvdC40LrQvtCy0LAg0JzQsNGA\n0LjQvdCwINCY0LLQsNC90L7QstC90LAiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQ\ntSDQvtC00LjQvSDQv9GA0LXQv9C+0LTQvtCy0LDRgtC10LvRjy5xLVUFbGV2ZWxxLksUdWJoBCmB\ncS99cTAoVQpleHRyYV90YWdzcTFYAAAAAFUHbWVzc2FnZXEyWMcAAADQv9GA0LXQv9C+0LTQvtCy\n0LDRgtC10LvRjyAi0KXQvtC00Y7QuiDQnNC40YXQsNC40Lsg0JDQvdC00YDQtdC10LLQuNGHIiDQ\nsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+\n0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8ucTNVBWxldmVscTRLFHViaAQpgXE1fXE2KFUKZXh0cmFfdGFnc3E3WAAAAABV\nB21lc3NhZ2VxOFjNAAAA0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8gItCR0LDQutC70LDQvdC+\n0LLQsCDQoNCw0LjRgdCwINCQ0LHQtNGD0LvQvtCy0L3QsCIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw0LLQ\nuNGC0Ywg0LXRidC1INC+0LTQuNC9INC/0YDQtdC/0L7QtNC+0LLQsNGC0LXQu9GPLnE5VQVsZXZl\nbHE6SxR1YmgEKYFxO31xPChVCmV4dHJhX3RhZ3NxPVgAAAAAVQdtZXNzYWdlcT5Y1wAAANC/0YDQ\ntdC/0L7QtNC+0LLQsNGC0LXQu9GPICLQkdCw0YDQuNC90L7QsiDQktCw0YHQuNC70LjQuSDQmtC+\n0L3RgdGC0LDQvdGC0LjQvdC+0LLQuNGHIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQ\nstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ\n0LUg0L7QtNC40L0g0L/RgNC10L/QvtC00L7QstCw0YLQtdC70Y8ucT9VBWxldmVscUBLFHViaAQp\ngXFBfXFCKFUKZXh0cmFfdGFnc3FDWAAAAABVB21lc3NhZ2VxRFjRAAAA0L/RgNC10L/QvtC00L7Q\nstCw0YLQtdC70Y8gItCR0L7Qs9C00LDQvdC+0LIg0KHQtdGA0LPQtdC5INCT0YDQuNCz0L7RgNGM\n0LXQstC40YciINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQ\ntSDQstGLINC80L7QttC10YLQtSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDQv9GA\n0LXQv9C+0LTQvtCy0LDRgtC10LvRjy5xRVUFbGV2ZWxxRksUdWJlVQ1fYXV0aF91c2VyX2lkcUeK\nAQhVEl9hdXRoX3VzZXJfYmFja2VuZHFIVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1v\nZGVsQmFja2VuZHFJdS4=\n','2012-05-25 11:33:43'),('e62b37906f79bfdcace75d6047127588','MDhiOWNhZTk4NzgyMGU3NzM4OTY4NThkYzliMTdhYzBlNTQ0YWZhODqAAn1xAS4=\n','2012-05-13 20:29:00'),('fc95f055a7f227f20b5c36e74adb68d1','MWIxNjg3ZmYxNjIyYTcwYTcwNjM3YmNiMmNiOWZjOTdhYzc0MWNhNDqAAn1xAShVCV9tZXNzYWdl\nc3ECXXEDKGNkamFuZ28uY29udHJpYi5tZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxBCmB\ncQV9cQYoVQpleHRyYV90YWdzcQdYAAAAAFUHbWVzc2FnZXEIWOUAAADRgNCw0YHQv9C40YHQsNC9\n0LjQtSAi0JLQsNGF0YDQvtC80LXQtdCyINCS0LjRgtCw0LvQuNC5INCS0LvQsNC00LjQvNC40YDQ\nvtCy0LjRhywg0JjQkSwgOTA4LCAyMDEyLTA1LTA3LCAxIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g\n0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC4\n0YLRjCDQtdGJ0LUg0L7QtNC40L0g0YDQsNGB0L/QuNGB0LDQvdC40LUucQlVBWxldmVscQpLFHVi\naAQpgXELfXEMKFUKZXh0cmFfdGFnc3ENWAAAAABVB21lc3NhZ2VxDljlAAAA0YDQsNGB0L/QuNGB\n0LDQvdC40LUgItCS0LDRhdGA0L7QvNC10LXQsiDQktC40YLQsNC70LjQuSDQktC70LDQtNC40LzQ\nuNGA0L7QstC40YcsINCY0JEsIDkwOCwgMjAxMi0wNS0wNywgNSIg0LHRi9C7INGD0YHQv9C10YjQ\nvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INC00L7QsdCw\n0LLQuNGC0Ywg0LXRidC1INC+0LTQuNC9INGA0LDRgdC/0LjRgdCw0L3QuNC1LnEPVQVsZXZlbHEQ\nSxR1YmgEKYFxEX1xEihVCmV4dHJhX3RhZ3NxE1gAAAAAVQdtZXNzYWdlcRRY6wAAANGA0LDRgdC/\n0LjRgdCw0L3QuNC1ICLQk9Cw0LLRgNC40LvQvtCy0LAg0J3QsNC00LXQttC00LAg0JDQu9C10LrR\ngdC10LXQstC90LAsINCY0YHRgtC+0YDQuNGPLCA1MTEsIDIwMTItMDUtMDcsIDMiINCx0YvQuyDR\ng9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQ\ntSDQtNC+0LHQsNCy0LjRgtGMINC10YnQtSDQvtC00LjQvSDRgNCw0YHQv9C40YHQsNC90LjQtS5x\nFVUFbGV2ZWxxFksUdWJoBCmBcRd9cRgoVQpleHRyYV90YWdzcRlYAAAAAFUHbWVzc2FnZXEaWOsA\nAADRgNCw0YHQv9C40YHQsNC90LjQtSAi0JPQsNCy0YDQuNC70L7QstCwINCd0LDQtNC10LbQtNCw\nINCQ0LvQtdC60YHQtdC10LLQvdCwLCDQmNGB0YLQvtGA0LjRjywgNTExLCAyMDEyLTA1LTA3LCA0\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQ\nvNC+0LbQtdGC0LUg0LTQvtCx0LDQstC40YLRjCDQtdGJ0LUg0L7QtNC40L0g0YDQsNGB0L/QuNGB\n0LDQvdC40LUucRtVBWxldmVscRxLFHViaAQpgXEdfXEeKFUKZXh0cmFfdGFnc3EfWAAAAABVB21l\nc3NhZ2VxIFiZAAAA0YDQsNGB0L/QuNGB0LDQvdC40LUgItCT0LDQstGA0LjQu9C+0LLQsCDQndCw\n0LTQtdC20LTQsCDQkNC70LXQutGB0LXQtdCy0L3QsCwg0JjRgdGC0L7RgNC40Y8sIDUxMSwgMjAx\nMi0wNS0wNywgNSIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0ucSFVBWxl\ndmVscSJLFHViZVUNX2F1dGhfdXNlcl9pZHEjigEIVRJfYXV0aF91c2VyX2JhY2tlbmRxJFUpZGph\nbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxJXUu\n','2012-05-25 00:50:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_plan`
--

LOCK TABLES `groups_plan` WRITE;
/*!40000 ALTER TABLE `groups_plan` DISABLE KEYS */;
INSERT INTO `groups_plan` VALUES (7,2,11,4),(8,2,12,3),(9,2,17,1),(10,2,18,2),(11,2,22,4),(12,2,23,2),(13,2,20,4),(14,2,21,3),(15,2,26,5),(16,2,27,4),(17,2,28,3),(18,2,29,2),(19,2,30,1),(20,2,24,1);
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
INSERT INTO `profile` VALUES (9,'',NULL,'',NULL),(10,'',NULL,'',NULL),(11,'Владимирович',NULL,'',NULL),(12,'Викторовна',NULL,'','B'),(13,'Николаевна',NULL,'','B'),(14,'Алексеевна',NULL,'','B'),(15,'Алексеевна',NULL,'','B'),(16,'Ивановна',NULL,'','B'),(17,'Викторовна',NULL,'','W'),(18,'Иванович',NULL,'','M'),(19,'Владимировна',NULL,'','W'),(20,'Валерьевна',NULL,'','W'),(21,'Ивановна',NULL,'','W'),(22,'Андреевич',NULL,'','M'),(23,'Абдуловна',NULL,'','W'),(24,'Константинович',NULL,'','M'),(25,'Григорьевич',NULL,'','M');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (13,42,12,5,1),(14,42,12,6,2),(15,41,12,7,1),(16,36,12,8,2),(17,36,12,9,3),(18,40,12,10,4),(19,41,12,6,5),(20,43,12,9,1),(21,43,12,9,5),(22,42,12,5,3),(23,42,12,5,4),(24,42,12,6,5),(25,44,12,11,1),(26,44,12,11,3),(27,44,12,11,5),(28,45,12,10,2),(29,45,12,11,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_day`
--

LOCK TABLES `schedule_day` WRITE;
/*!40000 ALTER TABLE `schedule_day` DISABLE KEYS */;
INSERT INTO `schedule_day` VALUES (11,'2012-05-04',0),(12,'2012-05-07',0),(13,'2012-05-10',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'schedule','0001_initial','2012-05-07 16:38:17'),(2,'tariffication','0001_initial','2012-05-07 17:22:49'),(3,'journal','0001_initial','2012-05-07 17:22:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariffication`
--

LOCK TABLES `tariffication` WRITE;
/*!40000 ALTER TABLE `tariffication` DISABLE KEYS */;
INSERT INTO `tariffication` VALUES (36,11,7,21),(37,11,7,25),(38,12,9,29),(39,12,9,33),(40,11,7,37),(41,13,7,38),(42,14,19,40),(43,11,11,42),(44,17,20,43),(45,18,20,44);
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
INSERT INTO `teachers` VALUES (11,207),(12,203),(13,205),(14,306),(15,405),(16,305),(17,404),(18,404),(19,215),(20,402),(21,407),(22,101),(23,308),(24,309),(25,209);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan`
--

LOCK TABLES `uch_plan` WRITE;
/*!40000 ALTER TABLE `uch_plan` DISABLE KEYS */;
INSERT INTO `uch_plan` VALUES (11,6,4,7,NULL),(12,6,4,8,NULL),(13,7,6,1,NULL),(14,7,6,2,NULL),(15,11,4,7,'Z'),(16,11,4,8,'E'),(17,12,4,1,'Z'),(18,12,4,2,'E'),(19,10,4,1,'Z'),(20,10,4,2,'E'),(21,12,4,1,'Z'),(22,12,4,2,'E'),(23,8,4,7,'Z'),(24,8,4,8,'Z'),(25,12,8,1,'Z'),(26,12,8,2,'Z'),(27,14,7,1,'Z');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uch_plan_hour`
--

LOCK TABLES `uch_plan_hour` WRITE;
/*!40000 ALTER TABLE `uch_plan_hour` DISABLE KEYS */;
INSERT INTO `uch_plan_hour` VALUES (21,11,'L',200),(22,11,'P',150),(23,11,'S',50),(24,11,'E',10),(25,12,'L',120),(26,12,'P',70),(27,12,'S',8),(28,12,'E',12),(29,13,'L',100),(30,13,'P',0),(31,13,'S',0),(32,13,'E',0),(33,14,'L',50),(34,14,'P',0),(35,14,'S',8),(36,14,'E',12),(37,15,'L',120),(38,16,'L',70),(39,17,'L',160),(40,25,'L',100),(41,26,'L',80),(42,24,'E',10),(43,27,'L',110),(44,27,'L',107);
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

-- Dump completed on 2012-05-11 12:09:24
