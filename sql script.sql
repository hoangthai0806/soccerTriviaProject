CREATE DATABASE  IF NOT EXISTS `soccer_trivia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `soccer_trivia`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: soccer_trivia
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard` (
  `leaderboard_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `score` int NOT NULL,
  `date_played` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`leaderboard_id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` VALUES (9,16,10,'2025-12-10 03:33:13'),(31,10,50,'2025-12-10 04:51:35'),(32,15,40,'2025-12-10 04:52:58'),(33,14,100,'2025-12-10 04:52:58'),(34,17,10,'2025-12-10 04:53:58'),(40,14,20,'2025-12-10 19:05:58'),(41,14,30,'2025-12-10 19:31:43'),(42,14,30,'2025-12-10 19:32:23'),(43,14,60,'2025-12-10 19:32:51'),(44,14,150,'2025-12-10 19:34:04'),(45,18,30,'2025-12-10 21:14:59'),(46,18,40,'2025-12-17 17:01:42'),(47,20,20,'2025-12-17 22:20:39');
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `player_name` varchar(100) NOT NULL,
  `player_email` varchar(100) NOT NULL,
  `player_password` varchar(255) NOT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_email_UNIQUE` (`player_email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (8,'Ben','Ben@gmail.com','Benbeopon','2025-11-11 23:01:38'),(9,'Ben123','Ben123@gmail.com','Benbeopon','2025-11-11 23:44:04'),(10,'Jay','Jay123','demotest','2025-11-11 23:56:15'),(14,'Test','test@gmail.com','123123','2025-11-12 15:15:39'),(15,'Beo','Beo@gmail.com','Benbeopon','2025-11-18 22:01:50'),(16,'Ben','Bennnn@gmail.com','1234','2025-12-03 14:15:57'),(17,'Jayden','Jayden@gmail.com','123456','2025-12-09 23:53:32'),(18,'test12','test12@gmail.com','123','2025-12-10 15:56:05'),(19,'FinalTest','final@gmail.com','123456','2025-12-17 15:14:39'),(20,'pufferfish','pufferfish@gmail.com','123','2025-12-17 17:19:20');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(1000) NOT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_answer` char(1) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Who won the FIFA World Cup in 2018?','Brazil','Germany','France','Argentina','C'),(2,'Which country won the FIFA World Cup in 2018?','Brazil','Germany','France','Argentina','C'),(3,'Who is known as \'The King of Football\'?','Cristiano Ronaldo','Lionel Messi','Pele','Maradona','C'),(4,'Which club has won the most UEFA Champions League titles?','Barcelona','Bayern Munich','Manchester United','Real Madrid','D'),(5,'Who won the 2021 Ballon d\'Or?','Messi','Lewandowski','Benzema','Mbappe','A'),(6,'Which country hosted the 2022 FIFA World Cup?','Qatar','USA','Japan','France','A'),(7,'What is the standard length of a soccer match?','80 minutes','90 minutes','100 minutes','120 minutes','B'),(8,'Which player is known as \'CR7\'?','Messi','Neymar','Cristiano Ronaldo','Haaland','C'),(9,'Which team is nicknamed The Red Devils?','Liverpool','Arsenal','Manchester United','Chelsea','C'),(10,'Who is the all-time top scorer in World Cup history?','Ronaldo Nazário','Miroslav Klose','Pele','Harry Kane','B'),(11,'Which club does Lionel Messi currently play for (2024)?','Barcelona','Inter Miami','PSG','Chelsea','B'),(12,'What is the minimum number of players required to start a match?','5','6','7','8','C'),(13,'Which country has won the most Copa América titles?','Brazil','Argentina','Uruguay','Chile','C'),(14,'Which team won the Premier League in 2020?','Liverpool','Chelsea','Man City','Leicester','A'),(15,'Which goalkeeper won the Yashin Trophy in 2023?','Alisson','Ederson','Donnarumma','Martinez','D'),(16,'What color card results in a player being sent off?','Green','Yellow','Blue','Red','D'),(17,'Which club is known for the motto \'Mes Que Un Club\'?','Real Madrid','Barcelona','Atletico Madrid','Sevilla','B'),(18,'Who is the manager of Manchester City (2024)?','Arteta','Pep Guardiola','Jurgen Klopp','Ancelotti','B'),(19,'Which country has won the most FIFA World Cups?','Italy','Germany','Brazil','Argentina','C'),(20,'Where is the UEFA headquarters located?','Paris','Zurich','London','Nyon','D'),(21,'What is the maximum number of substitutions allowed in regular FIFA matches (2024)?','3','4','5','6','C'),(22,'In which year was the first FIFA World Cup held?','1928','1930','1932','1934','B'),(23,'Which country won the first ever FIFA World Cup?','Brazil','Italy','Uruguay','England','C'),(24,'Who is the only player to have won three FIFA World Cups?','Diego Maradona','Pelé','Zinedine Zidane','Cristiano Ronaldo','B'),(25,'Which player holds the record for most goals in a single World Cup tournament?','Ronaldo Nazário','Just Fontaine','Miroslav Klose','Gerd Müller','B'),(26,'Which country hosted the 1998 FIFA World Cup?','Germany','France','USA','Japan','B'),(27,'Which city hosted the final of the 2002 FIFA World Cup?','Tokyo','Seoul','Yokohama','Osaka','C'),(28,'Which country has hosted the most FIFA World Cups?','Brazil','Italy','Germany','France','B'),(29,'Which player scored the \'Hand of God\' goal in the 1986 World Cup?','Johan Cruyff','Diego Maradona','Zico','Gary Lineker','B'),(30,'Which country won the 2014 FIFA World Cup?','Argentina','Germany','Spain','Netherlands','B'),(31,'Which coach guided Spain to their first World Cup win in 2010?','Vicente del Bosque','Luis Aragonés','Pep Guardiola','Jorge Valdano','A'),(32,'How many teams took part in the first World Cup in 1930?','10','13','16','8','B'),(33,'Which country won the UEFA European Championship in 2004?','Greece','Portugal','France','Italy','A'),(34,'Which player has won the most UEFA Champions League titles as a player?','Ryan Giggs','Cristiano Ronaldo','Paco Gento','Iker Casillas','C'),(35,'What is the maximum number of players a team can name on the bench in a typical FIFA match?','7','9','12','15','C'),(36,'Which country won the first UEFA European Championship (Euros) in 1960?','Soviet Union','West Germany','Spain','Italy','A'),(37,'Which player is the all-time top scorer in the UEFA Champions League?','Robert Lewandowski','Cristiano Ronaldo','Lionel Messi','Raúl','B'),(38,'Which country won the 1990 FIFA World Cup?','Argentina','West Germany','Brazil','Italy','B'),(39,'Who was the first goalkeeper to win the Ballon d’Or?','Gianluigi Buffon','Lev Yashin','Peter Schmeichel','Oliver Kahn','B'),(40,'Which club is nicknamed “The Old Lady”?','Juventus','AC Milan','Inter Milan','Roma','A'),(41,'Which country won the 2006 FIFA World Cup?','France','Italy','Brazil','Germany','B'),(42,'Which manager won the UEFA Champions League three times with Liverpool?','Jurgen Klopp','Rafael Benítez','Bob Paisley','Bill Shankly','C'),(43,'Which English club has the most top-flight league titles?','Liverpool','Manchester United','Arsenal','Chelsea','B'),(44,'Which international tournament is held every four years between European national teams?','Copa América','UEFA European Championship','Confederations Cup','FA Cup','B'),(45,'Which country won the 2018 UEFA Nations League?','Portugal','France','Spain','Belgium','A'),(46,'What is a “hat-trick” in soccer?','One goal','Two goals','Three goals','Four goals','C'),(47,'Which country won the Women’s FIFA World Cup in 2019?','USA','Germany','Brazil','Netherlands','A'),(48,'Which player scored the most goals in the 2010 FIFA World Cup?','Thomas Müller','Wesley Sneijder','David Villa','Diego Forlán','A'),(49,'Which club did Zlatan Ibrahimović play for in 2009–2010?','AC Milan','Barcelona','Inter Milan','Paris Saint-Germain','B'),(50,'Which country has won the most UEFA Champions League/European Cup titles?','AC Milan','Liverpool','Bayern Munich','Real Madrid','D'),(51,'Which African nation won their first Africa Cup of Nations in 1962?','Egypt','Tunisia','Ethiopia','Ghana','C'),(52,'What is the minimum number of referees on the field in a standard professional soccer match?','1','2','3','4','C'),(53,'Who holds the record for the fastest hat-trick in a World Cup final?','Kylian Mbappé','Carli Lloyd','Geoff Hurst','Pelé','A'),(54,'Which country won the Copa América in 2021?','Brazil','Argentina','Uruguay','Chile','B'),(55,'Who is known as “Der Kaiser” in soccer?','Franz Beckenbauer','Gerd Müller','Lothar Matthäus','Karl-Heinz Rummenigge','A'),(56,'Which club is based in Munich and has won multiple Bundesliga titles?','Borussia Dortmund','Bayern Munich','RB Leipzig','Schalke 04','B'),(57,'Which country’s national team is nicknamed the “Three Lions”?','Australia','England','France','Sweden','B'),(58,'What is the name of the trophy awarded to the winner of the English Premier League?','European Cup','FA Cup','Premier League Trophy','Champions Shield','C'),(59,'Which country won the 1958 World Cup, where Pelé made his first appearance?','Brazil','Argentina','Germany','Italy','A'),(60,'Which stadium is known as the “Theatre of Dreams”?','Old Trafford','Camp Nou','Santiago Bernabéu','Allianz Arena','A'),(61,'Which country did Diego Maradona famously “Hand of God” goal against in the 1986 World Cup?','West Germany','England','Italy','Spain','B'),(62,'Which player was the first to reach 100 international goals in men’s soccer?','Pele','Cristiano Ronaldo','Ferenc Puskás','Ali Daei','D'),(63,'Which national team is the only one to play in every World Cup tournament?','Germany','Brazil','Italy','Argentina','B'),(64,'What year did Lionel Messi win his first Ballon d’Or?','2006','2008','2009','2010','C'),(65,'Which country hosted the 2010 FIFA World Cup?','South Africa','Germany','Brazil','Russia','A'),(66,'Who is the all-time top scorer for the Brazilian national team?','Ronaldo Nazário','Pelé','Neymar','Romário','C'),(67,'Which club did Cristiano Ronaldo join after leaving Manchester United in 2009?','Juventus','Real Madrid','PSG','Inter Milan','B'),(68,'Which national team won the first-ever UEFA European Championship in 1960?','Spain','Soviet Union','France','Italy','B'),(69,'What is awarded if a foul is committed inside the penalty area by the defending team?','Corner kick','Indirect free kick','Penalty kick','Goal kick','C'),(70,'Which country won the 2000 UEFA European Championship?','France','Italy','Germany','Spain','A'),(71,'Which player scored the winning goal in the 1998 World Cup final?','Zinedine Zidane','Ronaldo Nazário','Fabien Barthez','Youri Djorkaeff','A'),(72,'Which country won the FIFA World Cup in 2002?','Germany','Brazil','France','Italy','B'),(73,'Which player has the most appearances (caps) for his national team in men’s soccer?','Iker Casillas','Gianluigi Buffon','Cristiano Ronaldo','Sergio Ramos','C'),(74,'Which country won the African Cup of Nations in 2019?','Egypt','Senegal','Algeria','Nigeria','B'),(75,'Which tournament is contested by top European clubs every year?','CONCACAF Champions League','UEFA Champions League','Copa Libertadores','AFC Champions League','B'),(76,'Which soccer legend scored “The Goal of the Century” in the 1986 World Cup against England?','Diego Maradona','Pele','Johan Cruyff','Zico','A'),(77,'What is the term for when a player scores four goals in one match?','Brace','Hat-trick','Poker','Quattrick','C'),(78,'Which country won the first ever FIFA World Cup in 1930?','Argentina','Brazil','Uruguay','Italy','C'),(79,'Who is the all-time top scorer in the UEFA Champions League?','Lionel Messi','Cristiano Ronaldo','Robert Lewandowski','Karim Benzema','B'),(80,'Which club has won the most Premier League titles?','Liverpool','Arsenal','Manchester City','Manchester United','D'),(81,'Which country hosted the 2014 FIFA World Cup?','Germany','Brazil','South Africa','Russia','B'),(82,'Who won the 2018 FIFA Ballon d\'Or?','Luka Modrić','Lionel Messi','Cristiano Ronaldo','Kylian Mbappé','A'),(83,'Which nation has won the most Copa América titles?','Argentina','Brazil','Uruguay','Chile','C'),(84,'Which player is known as “El Pibe de Oro”?','Pele','Maradona','Ronaldinho','Romario','B'),(85,'Which team won the UEFA Euro 2016?','Portugal','France','Germany','Spain','A'),(86,'Who scored the fastest World Cup goal in history?','Hakan Şükür','Klose','Ronaldo','Bale','A'),(87,'Which club is nicknamed “The Old Lady”?','Juventus','Chelsea','Monaco','Porto','A'),(88,'Who won the Golden Boot in the 2014 World Cup?','Klose','Messi','James Rodríguez','Neymar','C'),(89,'Which African country reached the World Cup quarterfinals in 2010?','Ghana','Cameroon','Nigeria','Senegal','A'),(90,'Which team won the 2006 FIFA World Cup?','France','Italy','Brazil','Spain','B'),(91,'Who is AC Milan’s all-time leading goalscorer?','Shevchenko','Van Basten','Inzaghi','Kaká','A'),(92,'Which country won the 2021 Africa Cup of Nations?','Egypt','Senegal','Morocco','Cameroon','B'),(93,'Who managed Manchester United after Sir Alex Ferguson?','Louis van Gaal','Moyes','Solskjaer','Ten Hag','B'),(94,'Which Premier League club is known as the “Toffees”?','Arsenal','Everton','Chelsea','West Ham','B'),(95,'Which player has the most appearances for Real Madrid?','Sergio Ramos','Casillas','Raúl','Marcelo','C'),(96,'Which country hosted the 1998 World Cup?','Japan','France','USA','Italy','B'),(97,'Which team won Euro 2004?','Greece','Portugal','Spain','Netherlands','A'),(98,'Which stadium is home to Bayern Munich?','Signal Iduna Park','Allianz Arena','Camp Nou','San Siro','B'),(99,'Who is Barcelona’s all-time top scorer?','Messi','Suárez','Stoichkov','Cruyff','A'),(100,'Which country won the 2002 World Cup?','France','Germany','Brazil','Argentina','C'),(101,'Which team is nicknamed “The Red Devils”?','Belgium','Manchester United','Wales','Liverpool','B'),(102,'Which player is known for the “Panenka” penalty?','Panenka','Zidane','Totti','Pirlo','A'),(103,'Who is the youngest player to score in a World Cup?','Pele','Mbappé','Messi','Ronaldo','A'),(104,'Which club has the most Champions League titles?','Real Madrid','Barcelona','AC Milan','Liverpool','A'),(105,'Who won the 2019 Ballon d’Or?','Messi','Ronaldo','Modrić','Lewandowski','A'),(106,'Which country won Euro 2020?','Italy','England','France','Spain','A'),(107,'Which team has the nickname “La Roja”?','Portugal','Chile','Spain','Mexico','C'),(108,'Who is the all-time top scorer for Portugal?','Ronaldo','Eusebio','Figo','Nani','A'),(109,'Which manager led Spain to the 2010 World Cup win?','Del Bosque','Luis Enrique','Zidane','Koeman','A'),(110,'Which Italian club is known as “I Nerazzurri”?','Milan','Inter','Juventus','Roma','B'),(111,'Who won the 2015 Champions League?','Barcelona','Bayern','Real Madrid','Liverpool','A'),(112,'Which country won the 1986 World Cup?','Brazil','Italy','Argentina','Germany','C'),(113,'Which club does Erling Haaland play for as of 2025?','Liverpool','Man City','Barcelona','PSG','B'),(114,'Which player scored the famous “Hand of God” goal?','Pele','Messi','Maradona','Ronaldo','C'),(115,'What country has the most World Cup appearances?','Brazil','Germany','Italy','Argentina','A'),(116,'Which goalkeeper has the most clean sheets in Premier League history?','Cech','De Gea','Alisson','Reina','A'),(117,'Which country hosted the 2010 World Cup?','Brazil','South Africa','Germany','Japan','B'),(118,'Which team won the 2023 Champions League?','Man City','Real Madrid','PSG','Liverpool','A'),(119,'Who is known as “The Pharaoh”?','Salah','Ziyech','Mahrez','Hakimi','A'),(120,'Which country won the 2015 Women’s World Cup?','USA','Japan','Germany','Canada','A'),(121,'Who is the Argentina national teams all-time top scorer?','Messi','Agüero','Batistuta','Di María','A'),(122,'Which Premier League team is known as “The Hammers”?','Newcastle','West Ham','Arsenal','Tottenham','B'),(123,'Which country won the 1970 World Cup?','Brazil','Italy','Argentina','Germany','A'),(124,'Which club is Lionel Messi’s boyhood team?','Barcelona','Newell’s Old Boys','River Plate','Boca Juniors','B'),(125,'Which African team first qualified for the World Cup?','Egypt','Morocco','Ghana','Cameroon','A'),(126,'Which club is known as “The Blues”?','Man City','Chelsea','Napoli','Leicester','B'),(127,'Who won the 1994 World Cup?','Italy','Brazil','Germany','France','B'),(128,'Which player is nicknamed “Il Fenomeno”?','Rivaldo','Ronaldinho','R9 Ronaldo','Romario','C'),(129,'Which club has the most La Liga titles?','Barcelona','Real Madrid','Atletico','Valencia','B'),(130,'Who is the all-time top scorer in World Cup history?','Klose','Ronaldo','Pelé','Müller','A'),(131,'Which nation won the 2013 Confederations Cup?','Spain','Brazil','Germany','Argentina','B'),(132,'Which club won the first ever Champions League (1993)?','Ajax','Barcelona','Marseille','Milan','C'),(133,'Which team is known as “Die Mannschaft”?','Germany','Austria','Switzerland','Belgium','A'),(134,'Who won the Puskás Award in 2020?','Son Heung-min','Salah','Ronaldo','Mbappé','A'),(135,'What team did David Beckham join in MLS?','New York Red Bulls','LA Galaxy','Toronto FC','Seattle Sounders','B'),(136,'Which country won Euro 1992?','Denmark','Netherlands','Germany','Italy','A'),(137,'Which country hosted the 2002 World Cup with Japan?','China','South Korea','Australia','Thailand','B'),(138,'Which player is known as “The Egyptian King”?','Salah','Mahrez','Elneny','Trezeguet','A'),(139,'Which club has won the most Bundesliga titles?','Dortmund','Bayern Munich','Leipzig','Hamburg','B'),(140,'Who won the 2022 FIFA World Cup?','France','Argentina','Brazil','Croatia','B'),(141,'Which club is called “Los Colchoneros”?','Valencia','Atletico Madrid','Sevilla','Betis','B'),(142,'Who is the oldest goalscorer in World Cup history?','Zanetti','Milla','Blanco','Shilton','B'),(143,'Which team is nicknamed “The Gunners”?','Tottenham','Arsenal','Everton','Fulham','B'),(144,'Which country won the 1990 World Cup?','Argentina','Germany','Brazil','England','B'),(145,'Who won the 2020 Champions League?','PSG','Bayern Munich','Chelsea','Man City','B'),(146,'Which team is known as “The Foxes”?','Leicester City','Leeds','Everton','Brighton','A'),(147,'Which U.S. state is home to Inter Miami CF?','Florida','California','Texas','New York','A'),(148,'Who is the Premier League’s all-time top scorer?','Rooney','Shearer','Kane','Agüero','B'),(149,'Which player scored the winning goal in the 2010 World Cup final?','Iniesta','Villa','Torres','Xavi','A'),(150,'Which nation won Euro 2008?','Germany','Spain','Netherlands','Italy','B'),(151,'Which team did José Mourinho win the Champions League with in 2004?','Chelsea','Porto','Inter','Real Madrid','B'),(152,'Which South American club competition is equivalent to the Champions League?','Sudamericana','Libertadores','Recopa','Superliga','B'),(153,'Which club plays at Anfield?','Chelsea','Liverpool','Arsenal','Everton','B'),(154,'Which country won the 2007 Women’s World Cup?','USA','Germany','Brazil','Japan','B'),(155,'Who captained Italy to the 2006 World Cup win?','Cannavaro','Buffon','Maldini','Nesta','A'),(156,'Which team is known as “The Yellow Submarine”?','Villarreal','Valencia','Cadiz','Celta Vigo','A'),(157,'Which country hosted the 1982 World Cup?','Italy','Spain','Mexico','Argentina','B');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-18 23:21:13
