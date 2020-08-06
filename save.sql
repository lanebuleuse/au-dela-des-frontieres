-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: travel
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
INSERT INTO `continent` VALUES (1,'Afrique','#F0F'),(2,'Amérique du Nord','blue'),(3,'Amérique du Sud','yellow'),(4,'Europe','Green'),(5,'Asie','red'),(6,'Océanie','purple'),(7,'Antarctique','white');
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `continent_id` int(11) NOT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3EC63EAAEE45BDBF` (`picture_id`),
  KEY `IDX_3EC63EAA921F4C77` (`continent_id`),
  CONSTRAINT `FK_3EC63EAA921F4C77` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`id`),
  CONSTRAINT `FK_3EC63EAAEE45BDBF` FOREIGN KEY (`picture_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,5,NULL,'Chine'),(2,5,NULL,'Japon'),(3,5,NULL,'Thailande'),(4,5,NULL,'Maldives'),(5,2,NULL,'Etats-Unis'),(6,2,NULL,'Canada'),(7,4,NULL,'Espagne'),(8,4,NULL,'Italie'),(9,4,NULL,'Grèce'),(10,4,NULL,'Portugal'),(11,4,NULL,'Pays-Bas'),(12,4,NULL,'Corse'),(13,4,NULL,'Polynésie Française'),(14,1,NULL,'Emirats-Arabes-Unis'),(15,1,NULL,'Maroc'),(16,1,NULL,'Tunisie'),(17,1,NULL,'Egypte'),(18,1,NULL,'Ile Maurice'),(19,1,NULL,'Jordanie'),(20,3,NULL,'République Dominicaine'),(21,3,NULL,'Chili'),(22,3,NULL,'Mexique'),(23,3,NULL,'Argentine');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20200804162306','2020-08-05 11:59:48',574);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stay`
--

DROP TABLE IF EXISTS `stay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `picture_card_id` int(11) DEFAULT NULL,
  `picture_description_id` int(11) DEFAULT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depart_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_with_transport` tinyint(1) NOT NULL,
  `count_people` int(11) NOT NULL,
  `count_overnight_stay` int(11) NOT NULL,
  `type_room` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5E09839C57EA6EF2` (`picture_card_id`),
  UNIQUE KEY `UNIQ_5E09839C53328AEE` (`picture_description_id`),
  KEY `IDX_5E09839C816C6140` (`destination_id`),
  CONSTRAINT `FK_5E09839C53328AEE` FOREIGN KEY (`picture_description_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_5E09839C57EA6EF2` FOREIGN KEY (`picture_card_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FK_5E09839C816C6140` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stay`
--

LOCK TABLES `stay` WRITE;
/*!40000 ALTER TABLE `stay` DISABLE KEYS */;
INSERT INTO `stay` VALUES (1,4,NULL,NULL,'Fuvammulah','les pieds dans l\'eau','1000€',1,2,7,'chambre double','Des vacances de rêves idéales pour un couple','lorem ipsum...'),(2,15,NULL,NULL,'Marrakech','La Palmeraie','500€',0,2,7,'chambre double','Des vacances dépaysantes sous le soleil maghrébin','lorem ipsum...'),(3,16,NULL,NULL,'Djerba','Club Med Djerba','650€',0,2,7,'chambre double','Venez découvrir l\'aventure tunisienne','lorem ipsum...'),(4,17,NULL,NULL,'Gizeh','Hôtel le Méridien Gizeh','850€',0,2,7,'chambre double','Vue imprennable sur les pyramides de Gizeh de votre chambre','lorem ipsum...'),(5,12,NULL,NULL,'Folleli','Hôtel San Pelegrinno','700€',1,2,7,'chambre double','Hôtel avec bungalow et plage privative','lorem ipsum...'),(6,8,NULL,NULL,'Trévisse','Hôtel Carlton','200€',0,2,2,'chambre double','Trévisse proche de Venise, est une ville qui plaira aux amoureux','lorem ipsum...'),(7,9,NULL,NULL,'Thessalonique','Hôtel Vergina','150€',1,2,3,'chambre double','Hôtel situé proche des attractions touristiques','lorem ipsum...'),(8,7,NULL,NULL,'Malaga','Centre de vacances Marmara Malaga','300€',1,2,7,'chambre double','Centre qui propose de belles excursions','lorem ipsum...'),(9,10,NULL,NULL,'Lisbonne','Centre de vacances Plaça del Sol','150€',0,2,3,'chambre double','Très belle ville à découvrir','lorem ipsum...'),(10,22,NULL,NULL,'Mexico','Centre de vacances Mexico','950€',1,2,10,'chambre double','Centre qui propose de belles excursions au pays des incas','lorem ipsum...'),(11,5,NULL,NULL,'New York','Hôtel Brooklyn','1200€',1,2,10,'chambre double','Très bel hôtel luxueux situé au coeur de New York','lorem ipsum...'),(12,5,NULL,NULL,'New York','Hôtel Brooklyn','1200€',1,2,12,'chambre double','Très bel hôtel et bien situé pour visiter New York','lorem ipsum...'),(13,6,NULL,NULL,'Montréal','Centre de vacances Canada Premium','1200€',1,2,14,'chambre double','Profitez de vos vacances au coeur de la fôret canadienne','lorem ipsum...'),(14,22,NULL,NULL,'Mexico','Centre de vacances El Caramba','1400€',1,2,14,'chambre double','Centre qui propose des excusions à couper le souffle !','lorem ipsum...'),(15,5,NULL,NULL,'New York','Hôtel Chinatown','900€',1,2,10,'chambre double','Hôtel typique situé au coeur du quartier Chinatown de New York','lorem ipsum...'),(16,18,NULL,NULL,'Maurice','Hôtel Mauricius','1100€',1,2,7,'chambre double','Paysage paradisiaque','lorem ipsum...'),(17,19,NULL,NULL,'Petra','Hôtel Jordiana','800€',1,2,7,'chambre double','Très bel hôtel qui propose des excusions sur le site de Petra à leurx clients','lorem ipsum...'),(18,20,NULL,NULL,'Punta Cana','Centre de vacances Club Med Punta Cana','1300€',1,2,10,'chambre double','Hôtel luxueux, excusions et prestations de marque, idéal pour les voyages de noces','lorem ipsum...'),(19,23,NULL,NULL,'Buenos Aires','Hôtel Argentina','1000€',1,2,10,'chambre double','hôtel avec guide touristique multilingue à la demande','lorem ipsum...'),(20,13,NULL,NULL,'Bora Bora','Centre de vacances le Polynésia','1300€',1,2,7,'chambre double','Pour une lune de miel à couper le souffle','lorem ipsum...'),(21,4,NULL,NULL,'l\'Ermitage','Hôtel les Créoles & spa','1200€',1,2,10,'chambre double','Piscine et spa, restauration,massages... tout est compris dans le prix!','lorem ipsum...'),(22,3,NULL,NULL,'Phuket','Hôtel The Racha','800€',1,2,7,'chambre double','Piscine et spa, restauration,massages... tout est compris dans le prix!','lorem ipsum...'),(23,3,NULL,NULL,'Phuket','Phuket Marriott Resort & Spa, Merlin Beach','1000€',1,2,14,'chambre double','Venez passer des vacances incroyables avec de belles excursions!','lorem ipsum...'),(24,1,NULL,NULL,'Shanghai','Mandarin Oriental Pudong, Shanghai','1200€',1,2,10,'chambre double','Au coeur de la ville traditionelle chinoise','lorem ipsum...'),(25,1,NULL,NULL,'Hong Kong','Kerry Hotel Hong Kong','900€',1,2,7,'chambre double','Hôtel Fabuleux!','lorem ipsum...'),(26,1,NULL,NULL,'Pékin','New World Beijing Hotel','850€',1,2,7,'chambre double','Hôtel Luxueux, accueil chaleureux!','lorem ipsum...'),(27,2,NULL,NULL,'Tokyo','Sotetsu Fresa Inn Tokyo Kanda','1400€',1,2,10,'chambre double','Fabuleux!','lorem ipsum...'),(28,2,NULL,NULL,'Tokyo','Hotel Vischio Kyoto','1400€',1,4,12,'chambre double','Hôtel spacieux et idéal pour la famille','lorem ipsum...'),(29,2,NULL,NULL,'Tokyo','Senagajima Island Resort & Spa','1600€',1,4,12,'chambre double','Hôtel spacieux et idéal pour être tranquille','lorem ipsum...'),(30,14,NULL,NULL,'Dubai','Hôtel Atlantis The Palm','1300€',1,2,7,'chambre double','Hôtel spacieux et luxueux','lorem ipsum...'),(31,14,NULL,NULL,'Dubai','The Ritz-Carlton Dubai','1200€',1,2,7,'chambre double','Hôtel grand luxe pour passer des vacances inoubliables','lorem ipsum...'),(32,14,NULL,NULL,'Dubai','Grand Hyatt Abu Dhabi Hotel & Residences Emirates Pearl','1400€',1,2,7,'chambre double','Hôtel grand luxe pour passer des vacances inoubliables','lorem ipsum...');
/*!40000 ALTER TABLE `stay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stay_media`
--

DROP TABLE IF EXISTS `stay_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stay_media` (
  `stay_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`stay_id`,`media_id`),
  KEY `IDX_67DC1DDAFB3AF7D6` (`stay_id`),
  KEY `IDX_67DC1DDAEA9FDD75` (`media_id`),
  CONSTRAINT `FK_67DC1DDAEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_67DC1DDAFB3AF7D6` FOREIGN KEY (`stay_id`) REFERENCES `stay` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stay_media`
--

LOCK TABLES `stay_media` WRITE;
/*!40000 ALTER TABLE `stay_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `stay_media` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-06 15:06:19
