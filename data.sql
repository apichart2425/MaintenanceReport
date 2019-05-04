-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: webproject
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'engineer'),(2,'supervisors'),(1,'weavers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add employee',8,'add_employee'),(30,'Can change employee',8,'change_employee'),(31,'Can delete employee',8,'delete_employee'),(32,'Can view employee',8,'view_employee'),(33,'Can add machine',9,'add_machine'),(34,'Can change machine',9,'change_machine'),(35,'Can delete machine',9,'delete_machine'),(36,'Can view machine',9,'view_machine'),(37,'Can add machine_ part',10,'add_machine_part'),(38,'Can change machine_ part',10,'change_machine_part'),(39,'Can delete machine_ part',10,'delete_machine_part'),(40,'Can view machine_ part',10,'view_machine_part'),(41,'Can add maintenance',11,'add_maintenance'),(42,'Can change maintenance',11,'change_maintenance'),(43,'Can delete maintenance',11,'delete_maintenance'),(44,'Can view maintenance',11,'view_maintenance'),(45,'Can add part',12,'add_part'),(46,'Can change part',12,'change_part'),(47,'Can delete part',12,'delete_part'),(48,'Can view part',12,'view_part'),(49,'Can add engineer',13,'add_engineer'),(50,'Can change engineer',13,'change_engineer'),(51,'Can delete engineer',13,'delete_engineer'),(52,'Can view engineer',13,'view_engineer'),(53,'Can add maintenance_ machine_ part',14,'add_maintenance_machine_part'),(54,'Can change maintenance_ machine_ part',14,'change_maintenance_machine_part'),(55,'Can delete maintenance_ machine_ part',14,'delete_maintenance_machine_part'),(56,'Can view maintenance_ machine_ part',14,'view_maintenance_machine_part'),(57,'Can add category_ part',15,'add_category_part'),(58,'Can change category_ part',15,'change_category_part'),(59,'Can delete category_ part',15,'delete_category_part'),(60,'Can view category_ part',15,'view_category_part'),(61,'Can add order',16,'add_order'),(62,'Can change order',16,'change_order'),(63,'Can delete order',16,'delete_order'),(64,'Can view order',16,'view_order'),(65,'Can add cart',17,'add_cart'),(66,'Can change cart',17,'change_cart'),(67,'Can delete cart',17,'delete_cart'),(68,'Can view cart',17,'view_cart'),(69,'Can add machine_ category',18,'add_machine_category'),(70,'Can change machine_ category',18,'change_machine_category'),(71,'Can delete machine_ category',18,'delete_machine_category'),(72,'Can view machine_ category',18,'view_machine_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$WcQeIpHsvW79$9PeRxkdIAPAfSFxaQN6mMAproQt2kKLNVUuadyrd/g4=','2019-05-03 06:42:27.689411',1,'admin','','','admin@admin.com',1,1,'2019-05-03 06:41:46.620310'),(2,'pbkdf2_sha256$150000$e7yIuKu8Em3Q$vdu2TUknYPpXLF8iQEhG8/6ZRRlY7w+Jl3/8ZNzmUIQ=','2019-05-03 12:15:02.640630',0,'user1','peerapol','onhan','fluke_onhan@hotmail.com',0,1,'2019-05-03 06:44:01.148231'),(3,'pbkdf2_sha256$150000$m2ozWIV3qThw$cH+kpptsMMseGEsYRmqIXWW2x8gehsQ9qiqkpNOhXlc=','2019-05-03 12:15:18.545667',0,'user2','peerapol','onhan','fluke_onhan@hotmail.com',0,1,'2019-05-03 06:47:10.124595'),(4,'pbkdf2_sha256$150000$3t6bGJK3966b$lXU7fzZ2L7vJ/USkmfWcJCZcKzWmHHTxIN+OJxQ5Rq4=','2019-05-03 12:15:38.219373',0,'user3','peerapol','onhan','fluke_onhan@hotmail.com',0,1,'2019-05-03 06:47:48.071975');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,2),(3,4,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-03 06:43:12.678761','1','weavers',1,'[{\"added\": {}}]',3,1),(2,'2019-05-03 06:43:26.220580','2','supervisors',1,'[{\"added\": {}}]',3,1),(3,'2019-05-03 06:43:34.718924','3','engineer',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(17,'reports','cart'),(7,'reports','category'),(15,'reports','category_part'),(8,'reports','employee'),(13,'reports','engineer'),(9,'reports','machine'),(18,'reports','machine_category'),(10,'reports','machine_part'),(11,'reports','maintenance'),(14,'reports','maintenance_machine_part'),(16,'reports','order'),(12,'reports','part'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-03 06:40:20.286601'),(2,'auth','0001_initial','2019-05-03 06:40:20.471524'),(3,'admin','0001_initial','2019-05-03 06:40:21.073063'),(4,'admin','0002_logentry_remove_auto_add','2019-05-03 06:40:21.204580'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-03 06:40:21.220202'),(6,'contenttypes','0002_remove_content_type_name','2019-05-03 06:40:21.351706'),(7,'auth','0002_alter_permission_name_max_length','2019-05-03 06:40:21.420698'),(8,'auth','0003_alter_user_email_max_length','2019-05-03 06:40:21.451968'),(9,'auth','0004_alter_user_username_opts','2019-05-03 06:40:21.467587'),(10,'auth','0005_alter_user_last_login_null','2019-05-03 06:40:21.536582'),(11,'auth','0006_require_contenttypes_0002','2019-05-03 06:40:21.536582'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-03 06:40:21.536582'),(13,'auth','0008_alter_user_username_max_length','2019-05-03 06:40:21.636912'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-03 06:40:21.721575'),(15,'auth','0010_alter_group_name_max_length','2019-05-03 06:40:21.737188'),(16,'auth','0011_update_proxy_permissions','2019-05-03 06:40:21.752841'),(17,'reports','0001_initial','2019-05-03 06:40:22.176097'),(18,'sessions','0001_initial','2019-05-03 06:40:22.877855'),(19,'reports','0002_cart_order','2019-05-03 09:34:05.096268'),(20,'reports','0003_machine_category','2019-05-03 11:17:41.004570'),(21,'reports','0004_auto_20190503_1934','2019-05-03 12:34:13.075705');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bhvtc4w15lmy5wlk4vbncvjpku2mfxzp','ZGEyMjMzNGE1MGFkYWIyNGU4NWFkZDI4OWFmNTNlNmYxNGZlZTA4Yzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjBjZWU0MzQzZTZkZGM4YWYxMGJjOGVlYmM1NDZhZWE2ZmU5ODI1In0=','2019-05-17 12:15:38.223735');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_cart`
--

DROP TABLE IF EXISTS `reports_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `for_machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_cart_employee_id_1e377db0_fk_reports_e` (`employee_id`),
  KEY `reports_cart_part_id_5013c495_fk_reports_part_id` (`part_id`),
  KEY `reports_cart_for_machine_id_602f3961_fk_reports_machine_mac_id` (`for_machine_id`),
  CONSTRAINT `reports_cart_employee_id_1e377db0_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`),
  CONSTRAINT `reports_cart_for_machine_id_602f3961_fk_reports_machine_mac_id` FOREIGN KEY (`for_machine_id`) REFERENCES `reports_machine` (`mac_id`),
  CONSTRAINT `reports_cart_part_id_5013c495_fk_reports_part_id` FOREIGN KEY (`part_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_cart`
--

LOCK TABLES `reports_cart` WRITE;
/*!40000 ALTER TABLE `reports_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_category`
--

DROP TABLE IF EXISTS `reports_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_code` varchar(255) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_category`
--

LOCK TABLES `reports_category` WRITE;
/*!40000 ALTER TABLE `reports_category` DISABLE KEYS */;
INSERT INTO `reports_category` VALUES (1,'A11 150833 001.005','BOBBIN CREEL VERTIKALE BOBIJNSTAND'),(2,'A12 139145 001.003','GRIPPER GEVERGRIJPER LZ GO'),(3,'A12 139146 001.003 ','GRIPPER NEMERGRIJPER RZ GO'),(4,'A12 200508 001.002','SUCTION DEVICE AFZUIGING'),(5,'A12 200560 001.002','WEFT FEEDER INSLAGGEVER QUICKSTEP'),(6,'A12 200564 001.001','GRIPPER DRIVE GRIJPERAANDRIJVING LZ'),(7,'A12 200768 002.001','RAPIER GUIDE LANSGELEDING'),(8,'A12 200847 001.001','WEFT CUTTER INSLAGSCHAAR'),(9,'A17 200569 001.001','MOTOR'),(10,'A12 200564 005.001','GRIPPER DRIVE GRIJPERAANDRIJVING LZ'),(11,'A15 200622 001.001','LET-OFF KETTINGAFLAAT'),(12,'A17 200701 002.001','CLUTCH KOPPELING'),(13,'A19 200690 005.001','SPLIT MOTION ELSY SPLITAPPARAAT'),(14,'A19 200690 007.001','SPLIT MOTION ELSY SPLITAPPARAAT JACQ'),(15,'A19 200638 001.001','CUTTERS SAM. AFVALSCHAAR LZ'),(16,'A20 200577 001.001','JACQUARD DRIVE JACQUARD AANDRIJVING'),(17,'A23 009476 003.001','CONTROL BOX BE 82731 STUURKAST BE 82731');
/*!40000 ALTER TABLE `reports_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_category_part`
--

DROP TABLE IF EXISTS `reports_category_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_category_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_category_part_c_id_e9c66199_fk_reports_category_id` (`c_id`),
  KEY `reports_category_part_p_id_2efa367c_fk_reports_part_id` (`p_id`),
  CONSTRAINT `reports_category_part_c_id_e9c66199_fk_reports_category_id` FOREIGN KEY (`c_id`) REFERENCES `reports_category` (`id`),
  CONSTRAINT `reports_category_part_p_id_2efa367c_fk_reports_part_id` FOREIGN KEY (`p_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_category_part`
--

LOCK TABLES `reports_category_part` WRITE;
/*!40000 ALTER TABLE `reports_category_part` DISABLE KEYS */;
INSERT INTO `reports_category_part` VALUES (1,1,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,3,17),(18,3,18),(19,3,19),(20,3,20),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,4,36),(37,4,37),(38,4,38),(39,4,39),(40,4,40),(41,4,41),(42,4,42),(43,4,43),(44,4,44),(45,4,45),(46,4,46),(47,4,47),(48,4,48),(49,4,49),(50,4,50),(51,4,51),(52,4,52),(53,4,53),(54,4,54),(55,4,55),(56,5,56),(57,5,57),(58,5,58),(59,5,59),(60,5,60),(61,5,61),(62,5,62),(63,5,63),(64,5,64),(65,5,65),(66,5,66),(67,5,67),(68,5,68),(69,5,69),(70,5,70),(71,5,71),(72,5,72),(73,6,73),(74,6,74),(75,6,75),(76,6,76),(77,6,77),(78,6,78),(79,6,79),(80,6,80),(81,6,81),(82,6,82),(83,6,83),(84,6,84),(85,7,85),(86,7,86),(87,7,87),(88,7,88),(89,8,89),(90,8,90),(91,8,91),(92,8,92),(93,8,93),(94,8,94),(95,8,95),(96,8,96),(97,8,97),(98,8,98),(99,8,99),(100,8,100),(101,8,101),(102,8,102),(103,8,103),(104,9,104),(105,9,105),(106,9,106),(107,10,107),(108,10,108),(109,10,109),(110,10,110),(111,10,111),(112,10,112),(113,10,113),(114,10,114),(115,10,115),(116,10,116),(117,10,117),(118,10,118),(119,10,119),(120,10,120),(121,10,121),(122,10,122),(123,10,123),(124,11,124),(125,11,125),(126,11,126),(127,11,127),(128,11,128),(129,11,129),(130,11,130),(131,11,131),(132,11,132),(133,11,133),(134,11,134),(135,11,135),(136,11,136),(137,11,137),(138,11,138),(139,11,139),(140,12,140),(141,12,141),(142,12,142),(143,12,143),(144,12,144),(145,12,145),(146,12,146),(147,12,147),(148,12,148),(149,12,149),(150,12,150),(151,12,151),(152,12,152),(153,12,153),(154,12,154),(155,13,155),(156,14,156),(157,14,157),(158,14,158),(159,14,159),(160,14,160),(161,14,161),(162,14,162),(163,14,163),(164,14,164),(165,14,165),(166,14,166),(167,14,167),(168,14,168),(169,15,169),(170,15,170),(171,15,171),(172,15,172),(173,15,173),(174,15,174),(175,15,175),(176,15,176),(177,15,177),(178,15,178),(179,15,179),(180,15,180),(181,15,181),(182,15,182),(183,15,183),(184,15,184),(185,15,185),(186,15,186),(187,15,187),(188,15,188),(189,15,189),(190,15,190),(191,15,191),(192,15,192),(193,15,193),(194,15,194),(195,15,195),(196,15,196),(197,15,197),(198,15,198),(199,15,199),(200,15,200),(201,15,201),(202,15,202),(203,15,203),(204,15,204),(205,16,205),(206,16,206),(207,16,207),(208,16,208),(209,16,209),(210,16,210),(211,16,211),(212,16,212),(213,16,213),(214,16,214),(215,16,215),(216,16,216),(217,16,217),(218,16,218),(219,16,219),(220,16,220),(221,16,221),(222,17,222),(223,17,223),(224,17,224),(225,17,225),(226,17,226),(227,17,227),(228,17,228),(229,17,229),(230,17,230),(231,17,231),(232,17,232),(233,17,233),(234,17,234),(235,17,235),(236,17,236),(237,17,237),(238,2,238),(239,2,239),(240,4,240),(241,5,241),(242,5,242),(243,8,243),(244,8,244),(245,10,245),(246,10,246),(247,8,247),(248,8,248),(249,3,238),(250,3,239),(251,6,240),(252,10,241),(253,15,242),(254,14,243),(255,9,244),(256,15,245),(257,12,246),(258,14,247),(259,16,248);
/*!40000 ALTER TABLE `reports_category_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_employee`
--

DROP TABLE IF EXISTS `reports_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_employee` (
  `employee_id` int(11) NOT NULL,
  `emp_fname` varchar(255) NOT NULL,
  `emp_lname` varchar(255) NOT NULL,
  `emp_phone` varchar(10) NOT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_address` longtext NOT NULL,
  `type` varchar(3) NOT NULL,
  `emp_salary` decimal(8,2) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `reports_employee_employee_id_524f7415_fk_auth_user_id` FOREIGN KEY (`employee_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_employee`
--

LOCK TABLES `reports_employee` WRITE;
/*!40000 ALTER TABLE `reports_employee` DISABLE KEYS */;
INSERT INTO `reports_employee` VALUES (2,'peerapol','onhan','0837199785','fluke_onhan@hotmail.com','123','01',10000.00),(3,'peerapol','onhan','0837199785','fluke_onhan@hotmail.com','123','02',10000.00),(4,'peerapol','onhan','0837199785','fluke_onhan@hotmail.com','123','03',10000.00);
/*!40000 ALTER TABLE `reports_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_engineer`
--

DROP TABLE IF EXISTS `reports_engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_engineer` (
  `employee_id` int(11) NOT NULL,
  `eng_type` varchar(255) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `reports_engineer_employee_id_eb112d48_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_engineer`
--

LOCK TABLES `reports_engineer` WRITE;
/*!40000 ALTER TABLE `reports_engineer` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_machine`
--

DROP TABLE IF EXISTS `reports_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_machine` (
  `mac_id` int(11) NOT NULL AUTO_INCREMENT,
  `mac_name` varchar(255) NOT NULL,
  `mac_sum` varchar(255) NOT NULL,
  `mac_desc` longtext NOT NULL,
  PRIMARY KEY (`mac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_machine`
--

LOCK TABLES `reports_machine` WRITE;
/*!40000 ALTER TABLE `reports_machine` DISABLE KEYS */;
INSERT INTO `reports_machine` VALUES (1,'G-1','test','test'),(2,'G-2','TEEST','test');
/*!40000 ALTER TABLE `reports_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_machine_category`
--

DROP TABLE IF EXISTS `reports_machine_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_machine_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_machine_cate_category_id_a2b6b63d_fk_reports_c` (`category_id`),
  KEY `reports_machine_cate_machine_id_370b907f_fk_reports_m` (`machine_id`),
  CONSTRAINT `reports_machine_cate_category_id_a2b6b63d_fk_reports_c` FOREIGN KEY (`category_id`) REFERENCES `reports_category` (`id`),
  CONSTRAINT `reports_machine_cate_machine_id_370b907f_fk_reports_m` FOREIGN KEY (`machine_id`) REFERENCES `reports_machine` (`mac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_machine_category`
--

LOCK TABLES `reports_machine_category` WRITE;
/*!40000 ALTER TABLE `reports_machine_category` DISABLE KEYS */;
INSERT INTO `reports_machine_category` VALUES (1,1,1),(2,2,1),(3,1,2);
/*!40000 ALTER TABLE `reports_machine_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_machine_part`
--

DROP TABLE IF EXISTS `reports_machine_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_machine_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `machine_id` (`machine_id`),
  UNIQUE KEY `part_id` (`part_id`),
  UNIQUE KEY `reports_machine_part_part_id_machine_id_724e3fb7_uniq` (`part_id`,`machine_id`),
  CONSTRAINT `reports_machine_part_machine_id_ddd1185d_fk_reports_m` FOREIGN KEY (`machine_id`) REFERENCES `reports_machine` (`mac_id`),
  CONSTRAINT `reports_machine_part_part_id_d0bd684f_fk_reports_part_id` FOREIGN KEY (`part_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_machine_part`
--

LOCK TABLES `reports_machine_part` WRITE;
/*!40000 ALTER TABLE `reports_machine_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_machine_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_maintenance`
--

DROP TABLE IF EXISTS `reports_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime(6) NOT NULL,
  `state` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `employee_id` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_maintenance_employee_id_58ac3da3_fk_reports_e` (`employee_id`),
  KEY `reports_maintenance_machine_id_85268193_fk_reports_m` (`machine_id`),
  CONSTRAINT `reports_maintenance_employee_id_58ac3da3_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`),
  CONSTRAINT `reports_maintenance_machine_id_85268193_fk_reports_m` FOREIGN KEY (`machine_id`) REFERENCES `reports_machine` (`mac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_maintenance`
--

LOCK TABLES `reports_maintenance` WRITE;
/*!40000 ALTER TABLE `reports_maintenance` DISABLE KEYS */;
INSERT INTO `reports_maintenance` VALUES (2,'2019-05-03 13:49:10.023122','Pending','จอฟ้า',2,1),(3,'2019-05-03 19:15:30.537708','Inprogress','ระเบิด',3,2);
/*!40000 ALTER TABLE `reports_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_maintenance_machine_part`
--

DROP TABLE IF EXISTS `reports_maintenance_machine_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_maintenance_machine_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `machine_part_id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_maintenance__machine_part_id_40792e21_fk_reports_m` (`machine_part_id`),
  KEY `reports_maintenance__maintenance_id_b57f8c31_fk_reports_m` (`maintenance_id`),
  CONSTRAINT `reports_maintenance__machine_part_id_40792e21_fk_reports_m` FOREIGN KEY (`machine_part_id`) REFERENCES `reports_machine_part` (`id`),
  CONSTRAINT `reports_maintenance__maintenance_id_b57f8c31_fk_reports_m` FOREIGN KEY (`maintenance_id`) REFERENCES `reports_maintenance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_maintenance_machine_part`
--

LOCK TABLES `reports_maintenance_machine_part` WRITE;
/*!40000 ALTER TABLE `reports_maintenance_machine_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_maintenance_machine_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_order`
--

DROP TABLE IF EXISTS `reports_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `for_machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_order_employee_id_9a7411d9_fk_reports_e` (`employee_id`),
  KEY `reports_order_part_id_38f3efb0_fk_reports_part_id` (`part_id`),
  KEY `reports_order_for_machine_id_c91eacdb_fk_reports_machine_mac_id` (`for_machine_id`),
  CONSTRAINT `reports_order_employee_id_9a7411d9_fk_reports_e` FOREIGN KEY (`employee_id`) REFERENCES `reports_employee` (`employee_id`),
  CONSTRAINT `reports_order_for_machine_id_c91eacdb_fk_reports_machine_mac_id` FOREIGN KEY (`for_machine_id`) REFERENCES `reports_machine` (`mac_id`),
  CONSTRAINT `reports_order_part_id_38f3efb0_fk_reports_part_id` FOREIGN KEY (`part_id`) REFERENCES `reports_part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_order`
--

LOCK TABLES `reports_order` WRITE;
/*!40000 ALTER TABLE `reports_order` DISABLE KEYS */;
INSERT INTO `reports_order` VALUES (1,4,'2019-05-03 17:22:55.791209',2,1,1),(2,6,'2019-05-03 17:22:55.797578',2,2,1),(3,4,'2019-05-03 17:24:13.965465',2,1,1),(4,6,'2019-05-03 17:24:13.989336',2,2,1),(5,4,'2019-05-03 17:24:55.511655',2,2,1),(6,3,'2019-05-03 17:32:41.873186',2,2,1),(7,1,'2019-05-03 17:48:35.366343',4,2,1),(8,1,'2019-05-03 17:49:00.427453',4,1,1),(9,2,'2019-05-03 17:54:14.657969',4,2,1),(10,1,'2019-05-03 17:54:19.992881',4,2,1),(11,1,'2019-05-03 17:54:24.969625',4,2,1),(12,10,'2019-05-03 18:56:27.361510',4,1,1),(13,10,'2019-05-03 19:02:52.340534',4,1,1),(14,5,'2019-05-03 19:16:16.444299',4,2,1),(15,1,'2019-05-03 19:22:11.690194',4,1,1),(16,1,'2019-05-03 19:22:11.696205',4,2,1),(17,12,'2019-05-03 19:41:38.482205',4,1,1),(18,2,'2019-05-03 19:41:38.505140',4,2,1),(19,1,'2019-05-03 19:41:38.508126',4,1,2),(20,1,'2019-05-03 19:59:26.669701',4,2,2),(21,1,'2019-05-03 19:59:26.680696',4,2,1);
/*!40000 ALTER TABLE `reports_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_part`
--

DROP TABLE IF EXISTS `reports_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reports_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_code` varchar(255) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `part_desc` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `minimum_stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_part`
--

LOCK TABLES `reports_part` WRITE;
/*!40000 ALTER TABLE `reports_part` DISABLE KEYS */;
INSERT INTO `reports_part` VALUES (1,'56N87',673.00,'BOBBIN CREEL',8,8),(2,'BA212222',353.00,'GRIPPER BACK',3,3),(3,'END 2',1407.00,'NUT',18,8),(4,'VZ1 2X6',615.00,'SCREW',17,7),(5,'BE206167',1012.00,'GRIPPER',10,7),(6,'BA212224',338.00,'SOLE',7,8),(7,'BA212226190',556.00,'RAPIER TAPE LHS',4,8),(8,'V71 2X5',1178.00,'SCREW',11,3),(9,'V71 2,2X8',1250.00,'SCREW',3,7),(10,'BE212374190',409.00,'GRIPPER LHS',0,9),(11,'BA207737',308.00,'L.H.S. GRIPPER',19,9),(12,'BA200899',639.00,'KEY',6,3),(13,'BA205901',865.00,'CLAMP',5,5),(14,'BA207554',524.00,'GRIPPER',9,10),(15,'BE210208',720.00,'GRIPPER',18,6),(16,'BA205893',849.00,'KEY',8,6),(17,'BE210503',719.00,'GRIPPER',10,6),(18,'BA210704',990.00,'BOLE',16,5),(19,'V71 2,5X5',1415.00,'SCREW',20,4),(20,'BA210453190',958.00,'RAPIER TAPE RHS',2,9),(21,'V71 2,5X8',1297.00,'SCREW',0,6),(22,'BE210790190',626.00,'GRIPPER',11,7),(23,'BA210480',1471.00,'GRIPPER',6,10),(24,'BE206570',540.00,'HOOK',16,9),(25,'V71 2X4',1384.00,'SCREW',14,8),(26,'BE206889',1305.00,'SPOON',0,9),(27,'BE209963',1034.00,'OPENER',1,3),(28,'BA205194',480.00,'SPRING HOLDER',8,3),(29,'BE203500',1304.00,'BUSHING',12,10),(30,'V71 2,5X12',462.00,'SCREW',14,6),(31,'BA203131',1381.00,'SPRING',8,3),(32,'BA205193',552.00,'SPRING HOLDER',4,5),(33,'BE204350',1277.00,'PLATE SPRING',2,10),(34,'BA203455',848.00,'PLATE',10,8),(35,'VZ1 2X5',1123.00,'SCREW',7,10),(36,'BE204081',359.00,'FILTER',7,9),(37,'B 55805',1216.00,'SPACER',13,4),(38,'B 53684',1262.00,'STOPPER',2,3),(39,'l166',422.00,'AIRHOSE',7,3),(40,'B 53217',399.00,'CONNECTING PIECE',3,5),(41,'B 55803',774.00,'DISTRIBUTOR',20,9),(42,'V3 6X30',821.00,'BOLT',0,5),(43,'RE 6',896.00,'DISC',16,7),(44,'B 83310',1210.00,'CLAMPING RING',12,10),(45,'BE 83015',1143.00,'FILTER COVER',5,7),(46,'B 87652',1263.00,'SEAL',1,6),(47,'B 54218',773.00,'FILTER COVER',15,10),(48,'BE 83017',1349.00,'FILTER HOUSING',11,6),(49,'B 54225',1402.00,'FILTER',13,9),(50,'B 52152',1204.00,'SPACER RING',13,4),(51,'B 88250',356.00,'SEAL',7,8),(52,'B 87360',427.00,'HANDLE',20,10),(53,'CP 6X40',626.00,'CYLINDRICAL PIN',6,3),(54,'B 87293',996.00,'FILTER ELEMENT',8,3),(55,'B 87297',361.00,'FILTER',9,9),(56,'BA201585',1245.00,'SUPPORT',1,3),(57,'B 156848',1140.00,'HOUSING',11,3),(58,'B 157115',1234.00,'COVER',14,7),(59,'V30 6X30',906.00,'SCREW',2,5),(60,'B 70972',475.00,'WASHER',8,7),(61,'V30 10X40',333.00,'SCREW',14,6),(62,'BE151980',992.00,'NEEDLE',5,6),(63,'BE151994',501.00,'PLATE',10,10),(64,'V30D 4X12',1025.00,'SCREW',14,9),(65,'B 156686',387.00,'MOTOR',6,3),(66,'B 12716',585.00,'CABLE CLIP',3,4),(67,'VZ1 4X8',485.00,'SCREW',0,6),(68,'BA208920',854.00,'COVER',2,3),(69,'BE 83279',908.00,'CABLE PUSH BUTTON QS',4,9),(70,'B 157630',1304.00,'NUT',3,5),(71,'B157165',1179.00,'LOCK',0,10),(72,'B 156918',617.00,'SUPPORTING PLATE',15,8),(73,'BA201552',667.00,'COVER',20,5),(74,'V30 10X20',1180.00,'BOLT',18,4),(75,'B 54409',1401.00,'STOPPER',16,6),(76,'B 53091',820.00,'HOSE NIPPLE',19,7),(77,'V3 10X30',430.00,'BOLT',6,3),(78,'BA204708',586.00,'GEAR BOX',14,9),(79,'B 150047',1130.00,'BUSHING',12,4),(80,'B 41509',613.00,'DISC',10,5),(81,'V5 10X50',1261.00,'BOLT',2,5),(82,'B 83297',331.00,'COUPLING',1,4),(83,'l551',1290.00,'GREASE PIPE LINE',6,4),(84,'B 41965',584.00,'ADDITIONAL PIECE',1,4),(85,'BA207562',595.00,'NUT',14,4),(86,'BA208636',1141.00,'HOOK',20,3),(87,'V3D 3X16',887.00,'BOLT',7,3),(88,'BA208799',1197.00,'NUT',5,6),(89,'BA212975',443.00,'UPPER CLAMP',4,6),(90,'BA211781',965.00,'SUPPORT',20,6),(91,'BA210783',385.00,'GUIDE',20,4),(92,'RE 4',1027.00,'WASHER',17,4),(93,'BA212978',850.00,'BUSHING',7,8),(94,'BA212796',1430.00,'GUIDE PLATE',20,3),(95,'V32D 4X12',1323.00,'SCREW',0,3),(96,'BA210938',940.00,'SPRING HODER',17,4),(97,'B 88756',1105.00,'SPRING HODER',12,3),(98,'B 84854',1390.00,'BUSHING',4,8),(99,'V32D 4X25',929.00,'SCREW',3,8),(100,'BA211564',1092.00,'MOVIING CUTTER BLADE',15,8),(101,'BA210719',817.00,'FIXED BLADE',1,6),(102,'END 4',1096.00,'NUT',3,8),(103,'BA212976',1271.00,'PLATE',12,5),(104,'N3004027',744.00,'MOTOR',9,5),(105,'B 159262',430.00,'PLATE',3,10),(106,'MM6',594.00,'NUT',18,8),(107,'BA202185',1290.00,'DRIVE WHEEL',20,3),(108,'B 41970',672.00,'ADDITIONAL PIECE',13,5),(109,'BA201554',429.00,'COVER',19,9),(110,'B 87702',605.00,'O-RING',0,4),(111,'B 29323',554.00,'SPRING CLIP',13,3),(112,'N1150090',521.00,'BALLBEARING(50/90)',6,8),(113,'BA201682',1230.00,'SEAL',6,9),(114,'BA200786',1329.00,'DISC/FLANGE',2,6),(115,'BA203980',840.00,'FLANGE',1,7),(116,'B 81791',359.00,'RING(50/55)',9,9),(117,'V3 8X35',717.00,'BOLT',4,4),(118,'BA201558',704.00,'BEARING HOUSING',13,3),(119,'BA201756',602.00,'CYL. BEARING (50/90)',11,9),(120,'BA201556',508.00,'COVER',9,8),(121,'V3 8X30',1183.00,'BOLT',12,4),(122,'BA201524',733.00,'SHAFT',2,9),(123,'B 82531',749.00,'THICKNESS RING',16,10),(124,'B 150611',480.00,'BUSHING',16,10),(125,'N1150450',1266.00,'BALLBEARING(17/47)',14,5),(126,'BE203066',1243.00,'GEAR',19,3),(127,'BE200570',1180.00,'SHAFT',12,5),(128,'B 60863',1414.00,'BALLBEARING(30/72)',4,10),(129,'BE211501',589.00,'GEAR',20,10),(130,'N1200503',598.00,'BALLBEARING(55/100)',6,9),(131,'B 74079',544.00,'SPRING CLIP',20,8),(132,'B 90985',964.00,'SAFETY RING',18,8),(133,'B 81914',1476.00,'STOPPER',18,5),(134,'B 81913',354.00,'O-RING',14,6),(135,'BA203015',422.00,'GEAR',3,6),(136,'V30 12X30',1473.00,'SCREW',1,10),(137,'B 159076',1106.00,'INSERT',4,4),(138,'B 159077',1200.00,'CLAMP PIECE',3,3),(139,'V30Z 10X35',1396.00,'BOLT',16,4),(140,'BA205204',1491.00,'BALLBEARING(65/120)',13,5),(141,'B 70038',1062.00,'SPRING CLIP',4,7),(142,'N1150310',1327.00,'INTERIOR RING(65/72)',16,4),(143,'BA201382',883.00,'PLATE',12,8),(144,'BA201012',823.00,'SPRING CLIP',17,9),(145,'BA209958',633.00,'GEAR BOX',11,7),(146,'B 91220',604.00,'COUPLING',17,10),(147,'I465',979.00,'GREASE PIPE LINE',19,8),(148,'N1150046',460.00,'O-RING',9,10),(149,'B 72227',314.00,'REDUCING PIECE',12,8),(150,'BA201387',1169.00,'SEAL',17,10),(151,'BA206087',597.00,'STOPPER',1,6),(152,'BA206208',1072.00,'PLATE',16,10),(153,'V3 8X10',657.00,'BOLT',20,9),(154,'RE8',1183.00,'DISC',1,4),(155,'BE211994',1071.00,'DOUP HEDDLE',4,4),(156,'BE210780',1219.00,'HARNESS FRAME',4,10),(157,'BE210778',951.00,'MOTOR',2,8),(158,'BA204741',1200.00,'PLATE',18,5),(159,'V30D 4X20',1279.00,'SCREW',12,4),(160,'RE4',1466.00,'WASHER',14,7),(161,'BA204742',603.00,'GUIDE PLATE',18,6),(162,'BE204082',1422.00,'CRANK ARM',0,7),(163,'BA207088',1336.00,'STUD',14,9),(164,'BA203848',684.00,'STUD',14,5),(165,'BA203680',1500.00,'HARNESS FRAME',10,9),(166,'BA202923',1068.00,'NUT',3,10),(167,'BA207094',1231.00,'SELVEDGE MOTION',8,8),(168,'END4',547.00,'NUT',13,9),(169,'BE1537897',891.00,'STEP MOTOR',13,9),(170,'BA200965',592.00,'ROLL',7,8),(171,'V30 6X20',1052.00,'SCREW',4,7),(172,'BA201082',630.00,'SHAFT',3,9),(173,'B 162646',623.00,'SUPPORT',1,10),(174,'BE207667',333.00,'CUTTER BLADE',3,8),(175,'V30D 3X8',896.00,'SCREW',16,4),(176,'B 163176',483.00,'MOVING CUTTER BLADE',8,4),(177,'B 163167',676.00,'SHAFT',4,9),(178,'B 160089',935.00,'BUSHING',5,3),(179,'B 160090',831.00,'DISC',20,4),(180,'ESIMD5',542.00,'LOCK NUT',4,8),(181,'B 160088',538.00,'SPRING',18,9),(182,'B 162339',808.00,'ECCENTRIC',2,6),(183,'B 160200',1250.00,'PIN',14,10),(184,'V31D 3X4',773.00,'SET SCREW',18,10),(185,'B 162338',543.00,'CONNECTING ROD',16,7),(186,'BA207753',744.00,'BALLBEARING',20,8),(187,'N1150117',300.00,'BALLBEARING(4/9)',11,6),(188,'B 157575',917.00,'BUSHING',11,6),(189,'B 160250',538.00,'BOLT',6,5),(190,'B 152531',790.00,'COLLAR NUT',18,3),(191,'BA203978',717.00,'SUPPORT',18,9),(192,'B 162183',715.00,'SET SCREW',12,4),(193,'V30D 3X10',344.00,'SCREW',7,8),(194,'EN 10',805.00,'NUT',11,6),(195,'B 160182',1179.00,'SHAFT',9,9),(196,'B 163091',522.00,'WASTE ROLL',8,6),(197,'B 161126',962.00,'MOTER',13,6),(198,'N1044038',1404.00,'SOCKET',20,7),(199,'N1013647999',1460.00,'CONTACT',10,4),(200,'N1013503',326.00,'STRAP',1,4),(201,'I185',656.00,'TUBE',14,9),(202,'N1013626',1363.00,'STRAP',18,4),(203,'I711',323.00,'INSULATION SLEEVE',13,8),(204,'N1045057',1479.00,'STICKER',1,4),(205,'V3 10X25',1033.00,'BOLT',4,10),(206,'BA201496',1154.00,'COUPLING',8,10),(207,'BE201803',1290.00,'HOSE',6,4),(208,'BE201800',521.00,'HOSE',1,6),(209,'I869',1037.00,'HOSE',15,9),(210,'B 92207',674.00,'HOSE CLAMP',14,6),(211,'BE201804',787.00,'HOSE',9,10),(212,'BE211555',1495.00,'HOSE',3,7),(213,'BE211550',702.00,'HOSE',17,4),(214,'I166',729.00,'AIRHOSE',2,4),(215,'BE201805',660.00,'HOSE',15,3),(216,'A0200517',1214.00,'CONTROL',7,3),(217,'BA201727',554.00,'SUPPORT',17,7),(218,'BE203921',527.00,'OIL FILTER',11,9),(219,'BA203925',851.00,'FILTER HOUSING',9,10),(220,'BA203924',903.00,'CONTROL',4,10),(221,'BA203926',1321.00,'FILTER ELEMENT',5,3),(222,'V41 3X10',750.00,'SCREW',13,5),(223,'VV 3',403.00,'SERRATED LOCK WASHER',1,7),(224,'MM 3',1167.00,'NUT',9,6),(225,'N 1013165',388.00,'CONTACT BOX',0,4),(226,'N 1018013',388.00,'LED',4,4),(227,'N 1015055',476.00,'SWITCH',10,9),(228,'B 89576',830.00,'SIDE PANEL',19,3),(229,'ALF 4X7',1469.00,'RIVET',2,10),(230,'B 89005',699.00,'SIDE PANEL',5,7),(231,'N 1020515',1037.00,'VOLTAGE SELECTOR',9,5),(232,'N 1013152',1255.00,'CONTACT BOX',6,8),(233,'BE 89002',1353.00,'BOX',7,7),(234,'B 89004',535.00,'SIDE PANEL',16,9),(235,'V41 4X10',1340.00,'SCREW',1,7),(236,'VV 4',361.00,'SERRATED LOCK WASHER',6,9),(237,'MM4',1383.00,'NUT',3,8),(238,'BA202370',337.00,'PLATE',5,9),(239,'BA202003',339.00,'FIXING',14,5),(240,'B 81408',1152.00,'CLAMPING RING',10,7),(241,'V30 6X16',348.00,'SCREW',13,10),(242,'V30 6X12',1263.00,'SCREW',6,3),(243,'V32 6X20',904.00,'SCREW',12,7),(244,'RS 6',815.00,'WASHER',16,6),(245,'RE6',902.00,'DISC',14,3),(246,'V30 10X30',427.00,'SCREW',18,6),(247,'V30D 4X25',607.00,'SCREW',3,7),(248,'V30 6X25',1321.00,'SCREW',9,5);
/*!40000 ALTER TABLE `reports_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'webproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-04 17:20:13
