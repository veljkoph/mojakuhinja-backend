-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: mojakuhinja
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dislikes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipes_id` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`,`recipes_id`,`users_id`),
  KEY `fk_dislikes_recipes1_idx` (`recipes_id`),
  KEY `fk_dislikes_users1_idx` (`users_id`),
  CONSTRAINT `fk_dislikes_recipes1` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`),
  CONSTRAINT `fk_dislikes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (10,22,137),(12,24,137),(8,25,137),(11,26,137),(13,27,137),(9,28,137);
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipes_id` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`,`recipes_id`,`users_id`),
  KEY `fk_likes_recipes1_idx` (`recipes_id`),
  KEY `fk_likes_users2_idx` (`users_id`),
  CONSTRAINT `fk_likes_recipes1` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_users2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (32,20,137),(33,22,137),(35,24,137),(34,25,137),(38,26,137),(36,27,137),(37,28,137),(40,45,137),(39,61,137);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descr` varchar(2000) DEFAULT NULL,
  `likes` int DEFAULT '1',
  `dislikes` int DEFAULT '1',
  `title` varchar(45) DEFAULT NULL,
  `ingridients` varchar(400) DEFAULT NULL,
  `image` varchar(600) DEFAULT 'https://images.pexels.com/photos/1435895/pexels-photo-1435895.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  `users_id` int DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT '60',
  `tags` varchar(199) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (20,'1. Obariti špagete u slanoj vodi sa malo ulja. Sos: Prodinstati crni luk na ulju, malo posoliti. 2.Dodati mleveno meso i propržiti začinjeno vegetom i soli po ukusu. <br> 3. Zatim dodati paradajz pire ,sačekati da proključa,pa začiniti origanom, bosiljkom i majoranom, takođe po ukusu.  <br> 4. Skloniti sa vatre kada proključa. Služiti špagete i sos zajedno, posuti parmezanom ili kačkavaljem, po želji. Prijatno!',7,0,'Pasta Bolonjeze','špageti pakovanje, 500 gr,  mleveno meso - 200 gr ,  paradajz sos - 500 ml ,  crni luk, ulje - 50 ml , so, biber, origano, bosiljak, kačkavalj, parmezan','bolonese',119,'pasta','30','#pasta#sos#bolonjeze'),(22,'Rernu zagrejati na 200 C, zajedno sa velikim plehom (od rerne) na koji se stavi ulje. Krompir oguliti, osusiti, da bude suv spolja, iseci na cetvrtine ili osmine ako je krompir veci. Dodati so, vegetu i kukuruzno brasno (krupno). Sve dobro promesati i sipati na dobro ugrejano ulje.\n\nPeci oko 30 – 40 min. Pecem u velikom limu od peci, kako bi krompir lezao u jednom sloju, jer na taj nacin krompir sa svih strana dobije lijepu hrskavu koricu. U toku pecenja promjesam ga 2 – 3 puta.',4,1,'Hrskavo pečeni krompirići','1,5 kg krompira , 1 kasicica soli, 1 kasicica vegete, 3 kasicice krupnog kukuruznog brasna, 3 kasicice ulja','potato_eobcyf',119,'main','60','#krompir'),(24,'\nIzmešati brašno s suvim kvascem, dodati ulje, maslac, biber i slanu mešavinu mlakog mleka i vode. Umesiti mekano testo i razvaljati ga u pleh veličine 40X40 cm, prekriti ga čistom krpom i ostaviti da miruje oko 20 minuta.\n\nZatim ga premazati konzerviranom paradajzom ili kečapom, svežim paradajzom, šunkom, maslinama, ribanim sirom, pecurkama ili bilo kojim sastojkom po želji i naravno origanom. Po vrhu nakapati maslinovog ulja. Staviti peći u vruću rernu na 15 do 20 minuta…\n\nIzvor: coolinarka.com',4,1,'Testo za picu','1 vrećica DI-GO kvasca, 400 g brašna,  sol, biber,  1,5 dl vode , 1 dl mleka, 0,5 dl ulja,  20 g masla, 2 kasicice maslinovog ulja','piz_nmqbgl',119,'pie , main','60','#pizza'),(25,'Umutiti jaja sa šećerom pa dodati mleko i ulje. Umešati brašno, seckanu čokoladu i prašak za pecivo.\n\nSipati smesu u kalupe za muffine do pola, dodati par višanja pa ponovo sipati smesu i završiti sa par višanja. Pecite u rerni na 200 stepeni 20 minuta.\n\n(slika je informativnog karaktera)',5,1,'Mafini sa visnjama i cokoladom',' 2 jaja, 70 ml ulj, 2 kašike pavlake za kuhanje, ½ šolje mlijeka, 2 šolje brašna, ½ šolje smeđeg šećera, 1 prašak za pecivo, 100 gr višanj,  70 gr tamne čokolade  ','muffinvisn_zd6vwo',119,'cake','50','#slatko'),(26,'Propržiti iseckanu slaninu bez dodavanja masnoće. Izvaditi i staviti na papirnu salvetu da upije masnoću. Na teflonu ispeći piletinu i kad se prohladi iseći je dugačke trake. Hleb iseći na kocke. Pomešati sa iseckanim belim lukom i propržiti na masnoći koju je pustila slanina. Izvaditi i staviti na salvetu. Zatim,\numutiti maslinovo ulje sa sokom od limuna, posoliti i pobiberiti. Dobijenim dresingom (sa maslinovim uljem) preliti opranu i iscepkanu zelenu salatu. Preko salate naređati piletinu, slaninu, krutone (prepečeni hleb), čeri paradajz, krupno narendani parmezan i preko toga preliti umućenu pavlaku s majonezom.',3,1,'Cezar salata','100 g dimljene slanine\n200 g belog pilećeg mesa\n30 g parmezana\n3 čena belog luka\n2 parčeta tost hleba\nveća glavica zelene salate\n2 čeri paradajza\nsok od 1 limuna\npavlaka\nmajonez\nmaslinovo ulje\nbiber\nso','ceasearad_qv2g3y',137,'salad','30','#piletina'),(27,'U kipuću, predhodno posoljenu vodu, staviti špagete da se kuvaju.  2. U isto vreme, na dve kašike maslinovog ulja propržiti sitno seckanu slaninu, svinjsku pečenicu ili dimljeni svinjski vrat dok ne porumeni i ne postane blago hrskavo. Potrebno je oko 5 minuta. Pred sam kraj, dodati propasiran čen belog luka i promešati.   3. U posebnoj posudi dobro izmešati žumanca sa kiselom pavlakom, dodati peršun, mleveni biber i malo soli. Ovu mesu uliti u tiganj sa dinstanom svinjskom pečenicom i mešati dok ne proključa - oko 2 minuta, i odmah skloniti sa vatre.  4. Za to vreme bi trebalo da su i špagete gotove. Procediti ih i sipati u veću, dublju činiju. Preliti ih prelivom (ostavite 2-3 kašike za kraj, kako bi prelili time celu porciju) i dobro izmešati, kako bi se špagete i preliv dobro sjedinili.   5. Gotove špagete prelijte ostatkom preliva i prstohvatom suvog usitnjenog peršuna.   Prijatno',4,2,'Pasta Carbonara','200gr Testenine\n150gr mesnate slanine, svinjske pečenice ili dimljenog svinjskog vrata\n2 kašike maslinovog ulja\n2 žumanca\n2dcl kisele pavlake\n1 čen belog luka\npo ukusu biber, so, seckani peršun\nmalo rendanog parmezana','carbonara_tinfpu',137,'pasta','25','#pasta#slanina'),(28,'Oprati kricla, zatim preseci baatak i krilo, kasnije uvaljati u kukurzno brasno i poredjati na pleh u rernu, na pleh staviti papir za pecenje pre toga, pece se oko sat vremena na 250 stepeni, dok ne potamne, dok se peku sipati 10ml ulja u posudu, u nju iseckati nekoliko cenova belog luka, ddodati vegetu, slatki kari, zacin za piletinu, alevu papriku i po zelji cili. Kasnije preliti krilca i izmesati\n\n(Slika je informativnog karakter)',4,1,'Pileca krilca u sosu','Krilca,\nUlje,\nSo,\nVegeta,\nSlatki kari,\nZacin za piletinu,\nBeli luk, \nAleva paprika,\nKorijander','wingy_gclepr',137,'meat','70','#piletina'),(30,'Posebno umutiti belance sa šećerom u čvrst sneg, zatim dodati žumance, onda sve tečne sastojke, pa mutiti jos malo mikserom, onda dodati brašno, prašak za pecivo, so, i mutiti još malo mikserom na najsporijoj brzini, da smesa nema grudvice... </br> 2. Tiganj mora da bude vreo, čim stavite prvu palačinku smanjite temperaturu na polovinu. Palačinku okrenuti kad počnu da izlaze balončići. </br> 3.Za početnike je bolje da peku po jednu palačinku, a ko je malo spretniji, može i po tri od jednom. (Slika je informativnog karaktera)',3,0,'Americke palacinke','2 čaše (od 2 dl) mleka\n1/2 čaše jogurta\n1/2 čaše ulja\n1/2 čaše šećera\n2,5 čaše brašna\n1 kesica praška za pecivo\n1 prstohvat soli\n2 veća jajeta\n','m54sfmwn7pu8vbdm3uro',119,'cake','35','#slatko'),(45,'U tiganj dodati 3 kašike maslinovog ulja. Crni luk sitno iseckati i dodati ulju. Posoliti malo luk i pržiti, dok ne omekša. U medjuvremenu, oljuštiti paradajz i očistiti sredinu od semenki. Paradajz iseckati na kockice. Paradajz dodati u tiganj, Zatim staviti vino, beli luk, vodu i paradajz pastu. Posoliti i zabiberiti sos po ukusu. Na tihoj vatri kuvati sos 25-30 minuta. Zatim, \nspagete kuvati po upustvu sa kutije. Dok se špagete kuvaju, uzmite veću šolju i izvadite malo vode, gde se pasta kuva. Kada su špagete skuvane, procediti ih i dodati ih sosu. Ako vam se čini da je sos previše gust-dodati malo vode od paste. Ja sam stavila celu šolju vode (200 ml). Dobro pomešati špagete sa sosom. Dodati sitno iseckani bosiljak. Služiti dok su još tople.',3,0,'Pomadori Pasta','500 g špageta\n400 g paradajza\n1 srednji crni luk\n4 čena belog luka\n3 kašike maslinovog ulja\n125 ml crvenog vina\n2 šolje vode\n3 kašičice paradajz paste\n2 kašike svežeg iseckanog bosiljka\nso, biber','pexels-photo-4057754_wgm20h',119,'pasta','35','#vegan'),(48,' Paradajz iseći na komadiće, a luk na kolutove, dodati iseckan peršunov list, naliti šoljom vode i lagano kuvati dok paradajz ne omekša.  Zatim sve propasirati. Na zagrejanom ulju staviti brašno i napraviti zapršku, dodati propasirani paradajz, posoliti po ukusu i naliti vodom. Kuvati dvadesetak minuta, pa po želji ukuvati u čorbu rezance.',2,0,'Paradajz Corba','1 kg paradajza\nglavica crnog luka\n2 kašike brašna\nperšunov list\nulje\nso\n','photo-1608949621318-392aca2bede4_u1fs7i',119,'spoon','60','#vegan'),(61,'Mleveno meso pomešajte sa žumancetom, prezlama i začinima. Od dobijene smese formirajte burger. \n\nDobijeni burger pržite u Tefal tiganju na malo ulja sa obe strane. Burger ne mora do kraja da bude pečen ukoliko volite da jedete meso pomalo sirovo.\nLepinju za burger kratko zagrejte u rerni da porumeni.\n\nBurger servirajte u lepinju zajedno sa čedar sirom.\n\nPredlozi za prilog: hrskava slaninica, luk, senf, kečap, rotkvice, rukola, majonez.',1,0,'Domaci Burger','200 g junećeg mlevenog mesa, malo masnijeg „prošaranog“\n\n1 žumance\n\n1 kašika prezli\n\n½ kašičice sitno seckanog ruzmarina\n\n1 kašičica soli\n\n½ kašičice bibera\n\n1 lepinja za burger\n\n1 list čedar sira\n\n1 kašika ulja\nsezonska salata kao prilog','photo-1551782450-17144efb9c50_eofgyh',137,'burger','30','#burger#senf#luk#meso#mlevenomeso');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings`
--

DROP TABLE IF EXISTS `savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipes_id` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`,`recipes_id`,`users_id`),
  KEY `fk_likes_recipes_idx` (`recipes_id`),
  KEY `fk_likes_users1_idx` (`users_id`),
  CONSTRAINT `fk_likes_recipes` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings`
--

LOCK TABLES `savings` WRITE;
/*!40000 ALTER TABLE `savings` DISABLE KEYS */;
INSERT INTO `savings` VALUES (57,20,137),(31,24,119),(53,25,137),(42,27,137),(54,45,137);
/*!40000 ALTER TABLE `savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) DEFAULT NULL,
  `recipes_id` int NOT NULL,
  PRIMARY KEY (`id`,`recipes_id`),
  KEY `fk_tags_recipes1_idx` (`recipes_id`),
  CONSTRAINT `fk_tags_recipes1` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'vegan',48),(2,'pasta',20);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `saved` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (119,'Veljko Ilic','veljkoilik@gmail.com','slusalice','sddsd',NULL),(124,'Paradajz i paprika','dummmy123@dummy.com','$2b$10$DMsaECioNd5i0sH6IXnHk.LDTwIidaTI8TZozGACA6su/lBXMwja6',NULL,NULL),(137,'Admin','veljkoilik17@gmail.com','$2b$10$TuKmlpVjhO2eyIGE6fAbcuPz1dYzLAP9Dr.EIOjRpUah3jcDMV1Je','drckyc6ltjcik3ouj41g',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-26 16:20:09
