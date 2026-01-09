CREATE DATABASE  IF NOT EXISTS `games_data_warehouse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `games_data_warehouse`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: games_data_warehouse
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `dim_developer_publisher`
--

DROP TABLE IF EXISTS `dim_developer_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_developer_publisher` (
  `DeveloperPublisherID` int NOT NULL AUTO_INCREMENT,
  `AppID` int DEFAULT NULL,
  `Developers` varchar(255) DEFAULT NULL,
  `Publishers` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DeveloperPublisherID`),
  KEY `AppID` (`AppID`),
  CONSTRAINT `dim_developer_publisher_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `dim_game_info` (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_game_info`
--

DROP TABLE IF EXISTS `dim_game_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_game_info` (
  `AppID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Release_Date` date DEFAULT NULL,
  `Estimated_Owners` bigint DEFAULT NULL,
  `Required_Age` int DEFAULT NULL,
  `About_the_Game` text,
  `Supported_Languages` text,
  `Full_Audio_Languages` text,
  `Notes` text,
  PRIMARY KEY (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_genres_categories`
--

DROP TABLE IF EXISTS `dim_genres_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_genres_categories` (
  `GenreCategoryID` int NOT NULL AUTO_INCREMENT,
  `AppID` int DEFAULT NULL,
  `Genres` varchar(255) DEFAULT NULL,
  `Categories` varchar(255) DEFAULT NULL,
  `Tags` text,
  PRIMARY KEY (`GenreCategoryID`),
  KEY `AppID` (`AppID`),
  CONSTRAINT `dim_genres_categories_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `dim_game_info` (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_media`
--

DROP TABLE IF EXISTS `dim_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_media` (
  `MediaID` int NOT NULL AUTO_INCREMENT,
  `AppID` int DEFAULT NULL,
  `Header_Image` varchar(255) DEFAULT NULL,
  `Screenshots` text,
  `Movies` text,
  PRIMARY KEY (`MediaID`),
  KEY `AppID` (`AppID`),
  CONSTRAINT `dim_media_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `dim_game_info` (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_platforms`
--

DROP TABLE IF EXISTS `dim_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_platforms` (
  `PlatformID` int NOT NULL AUTO_INCREMENT,
  `AppID` int DEFAULT NULL,
  `Windows` tinyint(1) DEFAULT NULL,
  `Mac` tinyint(1) DEFAULT NULL,
  `Linux` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PlatformID`),
  KEY `AppID` (`AppID`),
  CONSTRAINT `dim_platforms_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `dim_game_info` (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_reviews`
--

DROP TABLE IF EXISTS `dim_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_reviews` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `AppID` int DEFAULT NULL,
  `Reviews` text,
  `Metacritic_Score` int DEFAULT NULL,
  `Metacritic_URL` varchar(255) DEFAULT NULL,
  `User_Score` decimal(5,2) DEFAULT NULL,
  `Score_Rank` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `AppID` (`AppID`),
  CONSTRAINT `dim_reviews_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `dim_game_info` (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_support_info`
--

DROP TABLE IF EXISTS `dim_support_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_support_info` (
  `SupportInfoID` int NOT NULL AUTO_INCREMENT,
  `AppID` int DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Support_URL` varchar(255) DEFAULT NULL,
  `Support_Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupportInfoID`),
  KEY `AppID` (`AppID`),
  CONSTRAINT `dim_support_info_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `dim_game_info` (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_games`
--

DROP TABLE IF EXISTS `fact_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_games` (
  `AppID` int NOT NULL,
  `PlatformID` int DEFAULT NULL,
  `ReviewID` int DEFAULT NULL,
  `DeveloperPublisherID` int DEFAULT NULL,
  `GenreCategoryID` int DEFAULT NULL,
  `SupportInfoID` int DEFAULT NULL,
  `MediaID` int DEFAULT NULL,
  `Peak_CCU` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `DiscountDLC_Count` int DEFAULT NULL,
  `Achievements` int DEFAULT NULL,
  `Recommendations` int DEFAULT NULL,
  `Average_Playtime_Forever` int DEFAULT NULL,
  `Average_Playtime_Two_Weeks` int DEFAULT NULL,
  `Median_Playtime_Forever` int DEFAULT NULL,
  `Median_Playtime_Two_Weeks` int DEFAULT NULL,
  `Positive` int DEFAULT NULL,
  `Negative` int DEFAULT NULL,
  PRIMARY KEY (`AppID`),
  KEY `PlatformID` (`PlatformID`),
  KEY `ReviewID` (`ReviewID`),
  KEY `DeveloperPublisherID` (`DeveloperPublisherID`),
  KEY `GenreCategoryID` (`GenreCategoryID`),
  KEY `SupportInfoID` (`SupportInfoID`),
  KEY `MediaID` (`MediaID`),
  CONSTRAINT `fact_games_ibfk_1` FOREIGN KEY (`PlatformID`) REFERENCES `dim_platforms` (`PlatformID`),
  CONSTRAINT `fact_games_ibfk_2` FOREIGN KEY (`ReviewID`) REFERENCES `dim_reviews` (`ReviewID`),
  CONSTRAINT `fact_games_ibfk_3` FOREIGN KEY (`DeveloperPublisherID`) REFERENCES `dim_developer_publisher` (`DeveloperPublisherID`),
  CONSTRAINT `fact_games_ibfk_4` FOREIGN KEY (`GenreCategoryID`) REFERENCES `dim_genres_categories` (`GenreCategoryID`),
  CONSTRAINT `fact_games_ibfk_5` FOREIGN KEY (`SupportInfoID`) REFERENCES `dim_support_info` (`SupportInfoID`),
  CONSTRAINT `fact_games_ibfk_6` FOREIGN KEY (`MediaID`) REFERENCES `dim_media` (`MediaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-17 22:06:27
