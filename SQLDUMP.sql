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
INSERT INTO `recipes` VALUES (20,'1. Obariti ??pagete u slanoj vodi sa malo ulja. Sos: Prodinstati crni luk na ulju, malo posoliti. 2.Dodati mleveno meso i propr??iti za??injeno vegetom i soli po ukusu. <br> 3. Zatim dodati paradajz pire ,sa??ekati da proklju??a,pa za??initi origanom, bosiljkom i majoranom, tako??e po ukusu.  <br> 4. Skloniti sa vatre kada proklju??a. Slu??iti ??pagete i sos zajedno, posuti parmezanom ili ka??kavaljem, po ??elji. Prijatno!',7,0,'Pasta Bolonjeze','??pageti pakovanje, 500 gr,  mleveno meso - 200 gr ,  paradajz sos - 500 ml ,  crni luk, ulje - 50 ml , so, biber, origano, bosiljak, ka??kavalj, parmezan','bolonese',119,'pasta','30','#pasta#sos#bolonjeze'),(22,'Rernu zagrejati na 200 C, zajedno sa velikim plehom (od rerne) na koji se stavi ulje. Krompir oguliti, osusiti, da bude suv spolja, iseci na cetvrtine ili osmine ako je krompir veci. Dodati so, vegetu i kukuruzno brasno (krupno). Sve dobro promesati i sipati na dobro ugrejano ulje.\n\nPeci oko 30 ??? 40 min. Pecem u velikom limu od peci, kako bi krompir lezao u jednom sloju, jer na taj nacin krompir sa svih strana dobije lijepu hrskavu koricu. U toku pecenja promjesam ga 2 ??? 3 puta.',4,1,'Hrskavo pe??eni krompiri??i','1,5 kg krompira , 1 kasicica soli, 1 kasicica vegete, 3 kasicice krupnog kukuruznog brasna, 3 kasicice ulja','potato_eobcyf',119,'main','60','#krompir'),(24,'\nIzme??ati bra??no s suvim kvascem, dodati ulje, maslac, biber i slanu me??avinu mlakog mleka i vode. Umesiti mekano testo i razvaljati ga u pleh veli??ine 40X40 cm, prekriti ga ??istom krpom i ostaviti da miruje oko 20 minuta.\n\nZatim ga premazati konzerviranom paradajzom ili ke??apom, sve??im paradajzom, ??unkom, maslinama, ribanim sirom, pecurkama ili bilo kojim sastojkom po ??elji i naravno origanom. Po vrhu nakapati maslinovog ulja. Staviti pe??i u vru??u rernu na 15 do 20 minuta???\n\nIzvor: coolinarka.com',4,1,'Testo za picu','1 vre??ica DI-GO kvasca, 400 g bra??na,  sol, biber,  1,5 dl vode , 1 dl mleka, 0,5 dl ulja,  20 g masla, 2 kasicice maslinovog ulja','piz_nmqbgl',119,'pie , main','60','#pizza'),(25,'Umutiti jaja sa ??e??erom pa dodati mleko i ulje. Ume??ati bra??no, seckanu ??okoladu i pra??ak za pecivo.\n\nSipati smesu u kalupe za muffine do pola, dodati par vi??anja pa ponovo sipati smesu i zavr??iti sa par vi??anja. Pecite u rerni na 200 stepeni 20 minuta.\n\n(slika je informativnog karaktera)',5,1,'Mafini sa visnjama i cokoladom',' 2 jaja, 70 ml ulj, 2 ka??ike pavlake za kuhanje, ?? ??olje mlijeka, 2 ??olje bra??na, ?? ??olje sme??eg ??e??era, 1 pra??ak za pecivo, 100 gr vi??anj,  70 gr tamne ??okolade  ','muffinvisn_zd6vwo',119,'cake','50','#slatko'),(26,'Propr??iti iseckanu slaninu bez dodavanja masno??e. Izvaditi i staviti na papirnu salvetu da upije masno??u. Na teflonu ispe??i piletinu i kad se prohladi ise??i je duga??ke trake. Hleb ise??i na kocke. Pome??ati sa iseckanim belim lukom i propr??iti na masno??i koju je pustila slanina. Izvaditi i staviti na salvetu. Zatim,\numutiti maslinovo ulje sa sokom od limuna, posoliti i pobiberiti. Dobijenim dresingom (sa maslinovim uljem) preliti opranu i iscepkanu zelenu salatu. Preko salate nare??ati piletinu, slaninu, krutone (prepe??eni hleb), ??eri paradajz, krupno narendani parmezan i preko toga preliti umu??enu pavlaku s majonezom.',3,1,'Cezar salata','100 g dimljene slanine\n200 g belog pile??eg mesa\n30 g parmezana\n3 ??ena belog luka\n2 par??eta tost hleba\nve??a glavica zelene salate\n2 ??eri paradajza\nsok od 1 limuna\npavlaka\nmajonez\nmaslinovo ulje\nbiber\nso','ceasearad_qv2g3y',137,'salad','30','#piletina'),(27,'U kipu??u, predhodno posoljenu vodu, staviti ??pagete da se kuvaju.  2. U isto vreme, na dve ka??ike maslinovog ulja propr??iti sitno seckanu slaninu, svinjsku pe??enicu ili dimljeni svinjski vrat dok ne porumeni i ne postane blago hrskavo. Potrebno je oko 5 minuta. Pred sam kraj, dodati propasiran ??en belog luka i prome??ati.   3. U posebnoj posudi dobro izme??ati ??umanca sa kiselom pavlakom, dodati per??un, mleveni biber i malo soli. Ovu mesu uliti u tiganj sa dinstanom svinjskom pe??enicom i me??ati dok ne proklju??a - oko 2 minuta, i odmah skloniti sa vatre.  4. Za to vreme bi trebalo da su i ??pagete gotove. Procediti ih i sipati u ve??u, dublju ??iniju. Preliti ih prelivom (ostavite 2-3 ka??ike za kraj, kako bi prelili time celu porciju) i dobro izme??ati, kako bi se ??pagete i preliv dobro sjedinili.   5. Gotove ??pagete prelijte ostatkom preliva i prstohvatom suvog usitnjenog per??una.   Prijatno',4,2,'Pasta Carbonara','200gr Testenine\n150gr mesnate slanine, svinjske pe??enice ili dimljenog svinjskog vrata\n2 ka??ike maslinovog ulja\n2 ??umanca\n2dcl kisele pavlake\n1 ??en belog luka\npo ukusu biber, so, seckani per??un\nmalo rendanog parmezana','carbonara_tinfpu',137,'pasta','25','#pasta#slanina'),(28,'Oprati kricla, zatim preseci baatak i krilo, kasnije uvaljati u kukurzno brasno i poredjati na pleh u rernu, na pleh staviti papir za pecenje pre toga, pece se oko sat vremena na 250 stepeni, dok ne potamne, dok se peku sipati 10ml ulja u posudu, u nju iseckati nekoliko cenova belog luka, ddodati vegetu, slatki kari, zacin za piletinu, alevu papriku i po zelji cili. Kasnije preliti krilca i izmesati\n\n(Slika je informativnog karakter)',4,1,'Pileca krilca u sosu','Krilca,\nUlje,\nSo,\nVegeta,\nSlatki kari,\nZacin za piletinu,\nBeli luk, \nAleva paprika,\nKorijander','wingy_gclepr',137,'meat','70','#piletina'),(30,'Posebno umutiti belance sa ??e??erom u ??vrst sneg, zatim dodati ??umance, onda sve te??ne sastojke, pa mutiti jos malo mikserom, onda dodati bra??no, pra??ak za pecivo, so, i mutiti jo?? malo mikserom na najsporijoj brzini, da smesa nema grudvice... </br> 2. Tiganj mora da bude vreo, ??im stavite prvu pala??inku smanjite temperaturu na polovinu. Pala??inku okrenuti kad po??nu da izlaze balon??i??i. </br> 3.Za po??etnike je bolje da peku po jednu pala??inku, a ko je malo spretniji, mo??e i po tri od jednom. (Slika je informativnog karaktera)',3,0,'Americke palacinke','2 ??a??e (od 2 dl) mleka\n1/2 ??a??e jogurta\n1/2 ??a??e ulja\n1/2 ??a??e ??e??era\n2,5 ??a??e bra??na\n1 kesica pra??ka za pecivo\n1 prstohvat soli\n2 ve??a jajeta\n','m54sfmwn7pu8vbdm3uro',119,'cake','35','#slatko'),(45,'U tiganj dodati 3 ka??ike maslinovog ulja. Crni luk sitno iseckati i dodati ulju. Posoliti malo luk i pr??iti, dok ne omek??a. U medjuvremenu, olju??titi paradajz i o??istiti sredinu od semenki. Paradajz iseckati na kockice. Paradajz dodati u tiganj, Zatim staviti vino, beli luk, vodu i paradajz pastu. Posoliti i zabiberiti sos po ukusu. Na tihoj vatri kuvati sos 25-30 minuta. Zatim, \nspagete kuvati po upustvu sa kutije. Dok se ??pagete kuvaju, uzmite ve??u ??olju i izvadite malo vode, gde se pasta kuva. Kada su ??pagete skuvane, procediti ih i dodati ih sosu. Ako vam se ??ini da je sos previ??e gust-dodati malo vode od paste. Ja sam stavila celu ??olju vode (200 ml). Dobro pome??ati ??pagete sa sosom. Dodati sitno iseckani bosiljak. Slu??iti dok su jo?? tople.',3,0,'Pomadori Pasta','500 g ??pageta\n400 g paradajza\n1 srednji crni luk\n4 ??ena belog luka\n3 ka??ike maslinovog ulja\n125 ml crvenog vina\n2 ??olje vode\n3 ka??i??ice paradajz paste\n2 ka??ike sve??eg iseckanog bosiljka\nso, biber','pexels-photo-4057754_wgm20h',119,'pasta','35','#vegan'),(48,' Paradajz ise??i na komadi??e, a luk na kolutove, dodati iseckan per??unov list, naliti ??oljom vode i lagano kuvati dok paradajz ne omek??a.  Zatim sve propasirati. Na zagrejanom ulju staviti bra??no i napraviti zapr??ku, dodati propasirani paradajz, posoliti po ukusu i naliti vodom. Kuvati dvadesetak minuta, pa po ??elji ukuvati u ??orbu rezance.',2,0,'Paradajz Corba','1 kg paradajza\nglavica crnog luka\n2 ka??ike bra??na\nper??unov list\nulje\nso\n','photo-1608949621318-392aca2bede4_u1fs7i',119,'spoon','60','#vegan'),(61,'Mleveno meso pome??ajte sa ??umancetom, prezlama i za??inima. Od dobijene smese formirajte burger. \n\nDobijeni burger pr??ite u Tefal tiganju na malo ulja sa obe strane. Burger ne mora do kraja da bude pe??en ukoliko volite da jedete meso pomalo sirovo.\nLepinju za burger kratko zagrejte u rerni da porumeni.\n\nBurger servirajte u lepinju zajedno sa ??edar sirom.\n\nPredlozi za prilog: hrskava slaninica, luk, senf, ke??ap, rotkvice, rukola, majonez.',1,0,'Domaci Burger','200 g june??eg mlevenog mesa, malo masnijeg ???pro??aranog???\n\n1 ??umance\n\n1 ka??ika prezli\n\n?? ka??i??ice sitno seckanog ruzmarina\n\n1 ka??i??ica soli\n\n?? ka??i??ice bibera\n\n1 lepinja za burger\n\n1 list ??edar sira\n\n1 ka??ika ulja\nsezonska salata kao prilog','photo-1551782450-17144efb9c50_eofgyh',137,'burger','30','#burger#senf#luk#meso#mlevenomeso');
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
