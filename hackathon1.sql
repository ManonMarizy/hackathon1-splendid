-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: hackathon1
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'cat eye','cat_eye.jpeg'),(2,'virgin hair','virgin_hair.jpeg'),(3,'snake rattle','snake_rattle.jpeg'),(4,'elephant tooth','elephant_tooth.jpeg'),(5,'tongue of dog','tongue_dog.jpeg'),(6,'orange skin','orange skin'),(7,'hell broth','hell_broth.jpeg'),(8,'goat horn','goat_horn.jpeg'),(9,'scorpion poison','scorpion_poison.jpeg'),(10,'snakeskin','snakeskin.jpeg'),(11,'skunk hair','skunk_hair.jpeg'),(12,'unicorn horn','unicorn_horn.jpeg'),(13,'witch\'s claw','witch_claw.jpeg'),(14,'drop of sweat','drop_sweat.jpeg'),(15,'spider paw','spider_paw.jpeg'),(16,'dragon scale','dragon_scale.jpeg');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poison`
--

DROP TABLE IF EXISTS `poison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  `antidote` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poison`
--

LOCK TABLES `poison` WRITE;
/*!40000 ALTER TABLE `poison` DISABLE KEYS */;
INSERT INTO `poison` VALUES (1,'Ricin ','Ricin is a deadly poison that comes from castor beans. A dose the size of a single grain of sand is enough to kill. ','ricin.jpg',0),(2,'Botulinum Toxin (Botox) ','The bacterium Clostridium botulinum produces a deadly neurotoxin called botulinum. If the bacteria are ingested, botulism poisoning may result. You can get this from improperly sealed cans or bad meat. Pain and temporary muscle paralysis is the best case scenario. Severe paralysis can stop a person from breathing, causing death. ','botox.jpg',0),(3,'Tetradotoxin ','Tetradotoxin or TTX is a powerful neurotoxin that shuts down nerve conduction between the brain and the body by blocking sodium channels. A minute dose can cause loss of sensation and paralysis, but just a tiny bit more paralyzes muscles you need working in order to live. It takes around 6 hours to reach full effect, but once the diaphragm stops, the lungs can no longer inhale or exhale and you\'re a goner. Or, you could die sooner from an irregular heartbeat. ','tetradotoxin.jpg',0),(4,'Batrachotoxin ','Of all the toxins on this list, batrachotoxin is the one you\'re least likely to encounter (unless you live in a tropical rain forest). The poison is found on the skin of poison dart frogs. The frogs themselves are not the source of the toxin. It comes from the food they eat. When you see these frogs in a zoo, rest assured they aren\'t eating deadly beetles, so they can\'t harm you. ','batrachotoxin.jpg',0),(5,'Amatoxin ','Amatoxin is the deadly poison found in Amanita mushroom, such as the fly agaric. Eating one mushroom may be enough to end you, so it\'s not the very worst chemical on this list, but one you\'re more likely to encounter than some of the others (particularly if you know a cook you likes to pick wild mushrooms). Amatoxin attacks the kidneys and liver. Eventually, the damage leads to a coma and death. It\'s not a quick death. ','amatoxin .jpg',1),(6,'Cyanide ','Cyanide is a deadly poison that binds to iron in blood, preventing it from carrying oxygen to cells. A lethal dose kills in minutes. However, this toxin is so common in nature that the body detoxifies small amounts. It\'s found in seeds of apples, cherries, almonds, and apricots. Hydrogen cyanide is a chemical weapon. It\'s said to smell like almonds, although the truth is, the odor of almonds is that of the cyanide they contain! ','cyanide.jpg',1),(7,'Nerve Gas ','Any one of the nerve agents could be on the list of deadliest chemicals. Sarin, VX, and related compounds are far more deadly than most of the other compounds. Sarin, for example, is about 500 times more toxic than hydrogen cyanide. ','gas.jpg',1),(8,'Brodifacoum ','Brodifacoum is a potent anticoagulant that reduces the level of vitamin K in the blood, leading to internal bleeding and death. It\'s sold as a rodenticide under brand names including Talon, Jaguar, and Havoc. While it kills rats because they eat the tainted bait, it doesn\'t do people or pets any favors either, since even touching it can cause exposure. It permeates the skin and remains in the body for months. Animals that eat a poisoned rodent are also at risk. ','brodifacoum.jpg',1),(9,'Strychnine ','Strychnine is a naturally-occurring poison, mainly obtained from seeds of the Strychnos nux-vomica tree. It\'s a neurotoxin that acts on spinal nerves, causing victims to contort and convulse. It\'s commercially available as a pesticide for killing gophers and rats. Like Brodifacoum, it\'s dangerous to use because it presents a risk to children, pets, and other unintended victims. ','strychnine .jpg',1),(10,'Polonium ','While there are many more compounds that could easily make this list, don\'t forget some chemical elements are deadly poisonous! Lead and mercury are horribly toxic. There\'s no \"safe\" exposure to lead, while mercury is much worse in its organic form than as a pure element. ','polonium.jpg',0),(11,'Arsenic','Is known to be the most potent poison that has killed many lives.','arsenic.jpg',0),(12,'Hemlock','Its poisoning may refer to poisoning by either poison hemlock (Conium maculatum) or water hemlock family (Cicuta species and Oenanthe crocata L.). Historically, poison hemlock was reportedly used to execute Socrates. Initially it attacks in the form of paralysis in which the mind of the individual is working but his physical movements of his body gets reduced to minimal. It affects slowly and ultimately it kills the affected person.','Hemlock.jpg',0),(13,'Dimethylmercury','It can be extremely poisonous stuff. The most dangerous point associated with this poison is that it is a slow killer in which the victim comes to know that he is been infected only in the final stages and probably no medical cure is available for the affected person. An intake of doses as low as 0.1ml has proven lethal. In 1996, a chemistry professor at Dartmouth College, New Hampshire, trickled a drop or two of the poison on her gloved hand - dimethylmercury went through the latex glove, indications appeared four months later and after ten months she passed away.','Dimethylmercury.jpeg',1),(14,'Polonium 210','It is lethal in extremely small doses. Less than 1 gram (0.04 ounces) of the silver powder is sufficient to kill.','polonium.jpg',1),(15,'Mercury','A naturally occurring element can be used as a toxin to kill people is Mercury. The biggest advantage with this element is that it can be used in varying amounts and its impact is also varying and Mercury is a naturally occurring element that is found in air, water and soil. ','mercury.jpeg',0);
/*!40000 ALTER TABLE `poison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poison_has_ingredient`
--

DROP TABLE IF EXISTS `poison_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poison_has_ingredient` (
  `poison_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`poison_id`,`ingredient_id`),
  KEY `fk_poison_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_poison_has_ingredient_poison1_idx` (`poison_id`),
  CONSTRAINT `fk_poison_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_poison_has_ingredient_poison1` FOREIGN KEY (`poison_id`) REFERENCES `poison` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poison_has_ingredient`
--

LOCK TABLES `poison_has_ingredient` WRITE;
/*!40000 ALTER TABLE `poison_has_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `poison_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poison_has_symptom`
--

DROP TABLE IF EXISTS `poison_has_symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poison_has_symptom` (
  `poison_id` int NOT NULL,
  `symptom_id` int NOT NULL,
  PRIMARY KEY (`poison_id`,`symptom_id`),
  KEY `fk_poison_has_symptom_symptom1_idx` (`symptom_id`),
  KEY `fk_poison_has_symptom_poison1_idx` (`poison_id`),
  CONSTRAINT `fk_poison_has_symptom_poison1` FOREIGN KEY (`poison_id`) REFERENCES `poison` (`id`),
  CONSTRAINT `fk_poison_has_symptom_symptom1` FOREIGN KEY (`symptom_id`) REFERENCES `symptom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poison_has_symptom`
--

LOCK TABLES `poison_has_symptom` WRITE;
/*!40000 ALTER TABLE `poison_has_symptom` DISABLE KEYS */;
/*!40000 ALTER TABLE `poison_has_symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom`
--

DROP TABLE IF EXISTS `symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom`
--

LOCK TABLES `symptom` WRITE;
/*!40000 ALTER TABLE `symptom` DISABLE KEYS */;
INSERT INTO `symptom` VALUES (1,'diarrhea'),(2,'stomach pain'),(3,'drowsiness, dizziness or weakness'),(4,'high temperature of 38C'),(5,'chills (shivering)'),(6,'loss of appetite'),(7,'headache'),(8,'irritability'),(9,'difficulty swallowing (dysphagia)'),(10,'breathing difficulties'),(11,'producing more saliva than normal'),(12,'skin rash'),(13,'blue lips and skin (cyanosis)'),(14,'burns around the nose or mouth'),(15,'double vision or blurred vision'),(16,'mental confusion'),(17,'seizures (fits)'),(18,'loss of consciousness'),(19,'coma, in severe cases');
/*!40000 ALTER TABLE `symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom_has_ingredient`
--

DROP TABLE IF EXISTS `symptom_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptom_has_ingredient` (
  `symptom_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`symptom_id`,`ingredient_id`),
  KEY `fk_symptom_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_symptom_has_ingredient_symptom1_idx` (`symptom_id`),
  CONSTRAINT `fk_symptom_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_symptom_has_ingredient_symptom1` FOREIGN KEY (`symptom_id`) REFERENCES `symptom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom_has_ingredient`
--

LOCK TABLES `symptom_has_ingredient` WRITE;
/*!40000 ALTER TABLE `symptom_has_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `symptom_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-20  0:25:33
