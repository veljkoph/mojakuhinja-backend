-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: eu-cdbr-west-01.cleardb.com    Database: heroku_6fc8e0f4cdb8f98
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipes_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`recipes_id`,`users_id`),
  KEY `fk_dislikes_recipes1_idx` (`recipes_id`),
  KEY `fk_dislikes_users1_idx` (`users_id`),
  CONSTRAINT `fk_dislikes_recipes1` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dislikes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (205,115,145);
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipes_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`recipes_id`,`users_id`),
  KEY `fk_likes_recipes1_idx` (`recipes_id`),
  KEY `fk_likes_users2_idx` (`users_id`),
  CONSTRAINT `fk_likes_recipes1` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_users2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (325,95,145),(345,95,185),(285,145,145),(355,155,185),(305,195,145),(335,225,145),(295,265,145),(315,265,185);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(2000) DEFAULT NULL,
  `likes` int(11) DEFAULT '1',
  `dislikes` int(11) DEFAULT '0',
  `title` varchar(45) DEFAULT NULL,
  `ingridients` varchar(400) DEFAULT NULL,
  `image` varchar(600) DEFAULT 'https://images.pexels.com/photos/1435895/pexels-photo-1435895.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  `users_id` int(11) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT '60',
  `tags` varchar(199) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (95,'1. Obariti špagete u slanoj vodi sa malo ulja. Sos: Prodinstati crni luk na ulju, malo posoliti. 2.Dodati mleveno meso i propržiti začinjeno vegetom i soli po ukusu.  3. Zatim dodati paradajz pire ,sačekati da proključa,pa začiniti origanom, bosiljkom i majoranom, takođe po ukusu.   4. Skloniti sa vatre kada proključa. Služiti špagete i sos zajedno, posuti parmezanom ili kačkavaljem, po želji. Prijatno!',4,0,'Pasta Bolonjeze','špageti pakovanje, 500 gr,  mleveno meso - 200 gr ,  paradajz sos - 500 ml ,  crni luk, ulje - 50 ml , so, biber, origano, bosiljak, kačkavalj, parmezan','https://res.cloudinary.com/veljkoph/image/upload/v1637245146/bolonese.jpg',145,'pasta','45','#meso#mleveno#tomato'),(105,'Rernu zagrejati na 200 C, zajedno sa velikim plehom (od rerne) na koji se stavi ulje. Krompir oguliti, osusiti, da bude suv spolja, iseci na cetvrtine ili osmine ako je krompir veci. Dodati so, vegetu i kukuruzno brasno (krupno). Sve dobro promesati i sipati na dobro ugrejano ulje.  Peci oko 30 – 40 min. Pecem u velikom limu od peci, kako bi krompir lezao u jednom sloju, jer na taj nacin krompir sa svih strana dobije lijepu hrskavu koricu. U toku pecenja promjesam ga 2 – 3 puta.',2,0,'Hrskavo peceni krompirici','1,5 kg krompira , 1 kasicica soli, 1 kasicica vegete, 3 kasicice krupnog kukuruznog brasna, 3 kasicice ulja','https://res.cloudinary.com/veljkoph/image/upload/v1637245182/potato_eobcyf.jpg',145,'burger','60','#vegeta#krompir#rerna'),(115,' Izmešati brašno s suvim kvascem, dodati ulje, maslac, biber i slanu mešavinu mlakog mleka i vode. Umesiti mekano testo i razvaljati ga u pleh veličine 40X40 cm, prekriti ga čistom krpom i ostaviti da miruje oko 20 minuta.  Zatim ga premazati konzerviranom paradajzom ili kečapom, svežim paradajzom, šunkom, maslinama, ribanim sirom, pecurkama ili bilo kojim sastojkom po želji i naravno origanom. Po vrhu nakapati maslinovog ulja. Staviti peći u vruću rernu na 15 do 20 minuta…  Izvor: coolinarka.com',2,1,'Testo za picu','1 vrećica DI-GO kvasca, 400 g brašna,  sol, biber,  1,5 dl vode , 1 dl mleka, 0,5 dl ulja,  20 g masla, 2 kasicice maslinovog ulja','https://res.cloudinary.com/veljkoph/image/upload/v1637319140/gtketd4lfdxxqaxpoj6i.jpg',145,'pizza','60','#testo'),(125,'Umutiti jaja sa šećerom pa dodati mleko i ulje. Umešati brašno, seckanu čokoladu i prašak za pecivo.  Sipati smesu u kalupe za muffine do pola, dodati par višanja pa ponovo sipati smesu i završiti sa par višanja. Pecite u rerni na 200 stepeni 20 minuta.  (slika je informativnog karaktera)',3,0,'Mafini sa visnjama i cokoladom',' 2 jaja, 70 ml ulj, 2 kašike pavlake za kuhanje, ½ šolje mlijeka, 2 šolje brašna, ½ šolje smeđeg šećera, 1 prašak za pecivo, 100 gr višanj,  70 gr tamne čokolade  ','https://res.cloudinary.com/veljkoph/image/upload/v1637246452/ncrdi8fjrpixfw6gv0qv.jpg',145,'cake','45','#slatko#visnje#mafin#kolac'),(135,'Propržiti iseckanu slaninu bez dodavanja masnoće. Izvaditi i staviti na papirnu salvetu da upije masnoću. Na teflonu ispeći piletinu i kad se prohladi iseći je dugačke trake. Hleb iseći na kocke. Pomešati sa iseckanim belim lukom i propržiti na masnoći koju je pustila slanina. Izvaditi i staviti na salvetu. Zatim, umutiti maslinovo ulje sa sokom od limuna, posoliti i pobiberiti. Dobijenim dresingom (sa maslinovim uljem) preliti opranu i iscepkanu zelenu salatu. Preko salate naređati piletinu, slaninu, krutone (prepečeni hleb), čeri paradajz, krupno narendani parmezan i preko toga preliti umućenu pavlaku s majonezom.',4,0,'Cezar salata','100 g dimljene slanine 200 g belog pilećeg mesa 30 g parmezana 3 čena belog luka 2 parčeta tost hleba veća glavica zelene salate 2 čeri paradajza sok od 1 limuna pavlaka majonez maslinovo ulje biber so','https://res.cloudinary.com/veljkoph/image/upload/v1637245181/ceasearad_qv2g3y.jpg',145,'salad','45','#piletina#salata#cezar#majonez#pavlaka#beliluk'),(145,'U kipuću, predhodno posoljenu vodu, staviti špagete da se kuvaju.  2. U isto vreme, na dve kašike maslinovog ulja propržiti sitno seckanu slaninu, svinjsku pečenicu ili dimljeni svinjski vrat dok ne porumeni i ne postane blago hrskavo. Potrebno je oko 5 minuta. Pred sam kraj, dodati propasiran čen belog luka i promešati.   3. U posebnoj posudi dobro izmešati žumanca sa kiselom pavlakom, dodati peršun, mleveni biber i malo soli. Ovu mesu uliti u tiganj sa dinstanom svinjskom pečenicom i mešati dok ne proključa - oko 2 minuta, i odmah skloniti sa vatre.  4. Za to vreme bi trebalo da su i špagete gotove. Procediti ih i sipati u veću, dublju činiju. Preliti ih prelivom (ostavite 2-3 kašike za kraj, kako bi prelili time celu porciju) i dobro izmešati, kako bi se špagete i preliv dobro sjedinili.   5. Gotove špagete prelijte ostatkom preliva i prstohvatom suvog usitnjenog peršuna.   Prijatno',5,0,'Pasta Carbonara','200gr Testenine 150gr mesnate slanine, svinjske pečenice ili dimljenog svinjskog vrata 2 kašike maslinovog ulja 2 žumanca 2dcl kisele pavlake 1 čen belog luka po ukusu biber, so, seckani peršun malo rendanog parmezana','https://res.cloudinary.com/veljkoph/image/upload/v1637245180/carbonara_tinfpu.jpg',145,'pasta','45','#slanina#pasta#pavlaka#jaja#svinjskivrat#ulje'),(155,'Oprati kricla, zatim preseci baatak i krilo, kasnije uvaljati u kukurzno brasno i poredjati na pleh u rernu, na pleh staviti papir za pecenje pre toga, pece se oko sat vremena na 250 stepeni, dok ne potamne, dok se peku sipati 10ml ulja u posudu, u nju iseckati nekoliko cenova belog luka, ddodati vegetu, slatki kari, zacin za piletinu, alevu papriku i po zelji cili. Kasnije preliti krilca i izmesati  (Slika je informativnog karakter)',5,0,'Pileca krilca u sosu','Krilca, Ulje, So, Vegeta, Slatki kari, Zacin za piletinu, Beli luk,  Aleva paprika, Korijander','https://res.cloudinary.com/veljkoph/image/upload/v1637245393/wingy_gclepr.jpg',145,'meat','60','#piletina#krilca#sos#luk#vegeta#slano#meso'),(165,'Posebno umutiti belance sa šećerom u čvrst sneg, zatim dodati žumance, onda sve tečne sastojke, pa mutiti jos malo mikserom, onda dodati brašno, prašak za pecivo, so, i mutiti još malo mikserom na najsporijoj brzini, da smesa nema grudvice... </br> 2. Tiganj mora da bude vreo, čim stavite prvu palačinku smanjite temperaturu na polovinu. Palačinku okrenuti kad počnu da izlaze balončići. </br> 3.Za početnike je bolje da peku po jednu palačinku, a ko je malo spretniji, može i po tri od jednom. (Slika je informativnog karaktera)',4,0,'Americke palacinke','2 čaše (od 2 dl) mleka 1/2 čaše jogurta 1/2 čaše ulja 1/2 čaše šećera 2,5 čaše brašna 1 kesica praška za pecivo 1 prstohvat soli 2 veća jajeta ','https://res.cloudinary.com/veljkoph/image/upload/v1637245165/m54sfmwn7pu8vbdm3uro.jpg',145,'cake','30','#palacinke#amerika#slatko#sos#nutela'),(175,'U tiganj dodati 3 kašike maslinovog ulja. Crni luk sitno iseckati i dodati ulju. Posoliti malo luk i pržiti, dok ne omekša. U medjuvremenu, oljuštiti paradajz i očistiti sredinu od semenki. Paradajz iseckati na kockice. Paradajz dodati u tiganj, Zatim staviti vino, beli luk, vodu i paradajz pastu. Posoliti i zabiberiti sos po ukusu. Na tihoj vatri kuvati sos 25-30 minuta. Zatim,  spagete kuvati po upustvu sa kutije. Dok se špagete kuvaju, uzmite veću šolju i izvadite malo vode, gde se pasta kuva. Kada su špagete skuvane, procediti ih i dodati ih sosu. Ako vam se čini da je sos previše gust-dodati malo vode od paste. Ja sam stavila celu šolju vode (200 ml). Dobro pomešati špagete sa sosom. Dodati sitno iseckani bosiljak. Služiti dok su još tople.',4,0,'Pomadori Pasta','500 g špageta 400 g paradajza 1 srednji crni luk 4 čena belog luka 3 kašike maslinovog ulja 125 ml crvenog vina 2 šolje vode 3 kašičice paradajz paste 2 kašike svežeg iseckanog bosiljka so, biber','https://res.cloudinary.com/veljkoph/image/upload/v1637245181/pexels-photo-4057754_wgm20h.jpg',145,'pasta','45','#pasta#paradajz#tomato#spageti'),(185,' Paradajz iseći na komadiće, a luk na kolutove, dodati iseckan peršunov list, naliti šoljom vode i lagano kuvati dok paradajz ne omekša.  Zatim sve propasirati. Na zagrejanom ulju staviti brašno i napraviti zapršku, dodati propasirani paradajz, posoliti po ukusu i naliti vodom. Kuvati dvadesetak minuta, pa po želji ukuvati u čorbu rezance.',4,0,'Paradajz corba','1 kg paradajza glavica crnog luka 2 kašike brašna peršunov list ulje so ','https://res.cloudinary.com/veljkoph/image/upload/v1637245181/photo-1608949621318-392aca2bede4_u1fs7i.jpg',145,'spoon','30','#paradajz#corba#supa#kasika'),(195,'Mleveno meso pomešajte sa žumancetom, prezlama i začinima. Od dobijene smese formirajte burger.   Dobijeni burger pržite u Tefal tiganju na malo ulja sa obe strane. Burger ne mora do kraja da bude pečen ukoliko volite da jedete meso pomalo sirovo. Lepinju za burger kratko zagrejte u rerni da porumeni.  Burger servirajte u lepinju zajedno sa čedar sirom.  Predlozi za prilog: hrskava slaninica, luk, senf, kečap, rotkvice, rukola, majonez.',7,0,'Domaci Burger','200 g junećeg mlevenog mesa, malo masnijeg „prošaranog“  1 žumance  1 kašika prezli  ½ kašičice sitno seckanog ruzmarina  1 kašičica soli  ½ kašičice bibera  1 lepinja za burger  1 list čedar sira  1 kašika ulja sezonska salata kao prilog','https://res.cloudinary.com/veljkoph/image/upload/v1637245181/photo-1551782450-17144efb9c50_eofgyh.jpg',145,'burger','45','#mlevenomeso#junetina#svinjetina#pomfrit#kkecap#lepinje#hleb'),(225,'\nPriprema:\nOd litre mleka oduzeti 2dl. Ostalo mleko staviti da provri.\nUmutiti žumanca sa šećerom i mlekom, pa dodati brašno, puding i vanilin šećer i sve zakuvati u mleko kad provri.\nmešati dok se ne zgusne. Ostaviti da se ohladi.\nkad se ohladi mikserom razbiti stegnutu smesu.\nUmutiti slatku pavlaku i šlag pa prvo dodati slatku pavlaku i izmutiti pa dodati šlag.\nSve izmiksirati pa sjediniti.\nZa koru vam je najlakse da koristite lisnato blok testo.\nDovoljan vam je jedan blok za obe kore.\nOkrenete veliku tepsiju od rerne naopako pa je pouljite i razvlačite na njoj testo.\nUzmete posle posudu u koju ćete staviti krempitu i izmerite dve jednake površine i isečete nožem za picu.\ntrebalo bi da ta velika tepsija odgovara meri za dve kore.\nUgrejete rernu na 200 stepeni dok razvlačite koru i kad se ugreje stavite da se ispeče.\nPotrebno joj je 10-ak minuta. gotova je kad bude zlatno žute boje.\nU tepsiju koju ste predvideli da napravite krempitu stavite koru pa istresete krem i poklopite drugom korom, ili je krupno sameljite pa pospite odgore , pa je stavite u frižider.\nPo želji umutite još 2dl slatke pavlake pa premažite preko krema, pa tek onda stavite koru.\nkrempita se služi ohladjena i posuta šećerom u prahu.',4,0,'Krempita','4 žumanca,\n8 kasika šećera,\n1 puding od vanile,\n1 vanilin šećer\n4 kasike brašna\n1l mleka\n2dl slatke pavlake\n100 gr šlaga\n1 lisnato blok testo\njoš 2dl slatke pavlake (opciono)\n','https://res.cloudinary.com/veljkoph/image/upload/v1637601314/ibitgbulqplxbktc4pct.jpg',145,'cake','60','#krempita, #slatko'),(265,'Staviti vodu da provri,dodati joj so i mast. Kad provri zakuvati kukuruzno bašno uz konstantno mešanje. Kad se sjedinilo dodajte sir i mešajte. Kačamak je gotov kad se odvaja od suda u kojem se pravi. Odnos brasna i vode treba biti 1:2.5, znaci da na jednu casicu brasna ide dve ipo case vode. Mesa se 10-15 minuta dok se smesa ne zgusne i razbiju sve gromuljice. ukoliko izgleda mekano i posle 10 minuta mesanja, dodati jos malo brasna. Moze se narednati sir po zelji, ili proprziti slanina i preliti',4,0,'Domaci kacamak','400 gr kukuruzno belo brašno\n1 l voda\n100 gr mast\n200 gr sitni sir\nso\n','https://res.cloudinary.com/veljkoph/image/upload/v1638793987/k8u1dbl1z8beisoogzes.jpg',145,'pie','15','#kacamak #sir #brasno #slanina #jogurt #so');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings`
--

DROP TABLE IF EXISTS `savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipes_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`recipes_id`,`users_id`),
  KEY `fk_likes_recipes_idx` (`recipes_id`),
  KEY `fk_likes_users1_idx` (`users_id`),
  CONSTRAINT `fk_likes_recipes` FOREIGN KEY (`recipes_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings`
--

LOCK TABLES `savings` WRITE;
/*!40000 ALTER TABLE `savings` DISABLE KEYS */;
INSERT INTO `savings` VALUES (175,95,165),(385,95,145),(185,105,165),(395,105,145),(415,135,145),(425,145,145),(475,165,145),(455,175,145),(435,225,145),(445,225,185),(355,265,185),(365,395,145);
/*!40000 ALTER TABLE `savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'https://res.cloudinary.com/veljkoph/image/upload/v1638884567/user_1_jtz17y.png',
  `saved` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (145,'Veljko','veljkoilik@gmail.com','$2b$10$v/A6pRSfNdHD54TJ0Ha/UOsUDeS1QNHuRpiNAXSsrcrmr3PadMtVO','http://res.cloudinary.com/veljkoph/image/upload/v1639668782/vtkzrtathhxpfkxmkrhk.jpg',NULL),(155,'Filip','ficasky@gmail.com','$2b$10$GlTBTjodcxbvl4ee2Sk/5eTqFc9UmEVODjHLupWZPADoYAtymY3U.','ijqavafhkvcvjjyw4bis',NULL),(165,'Veljko','veljkoilik17@gmail.com','$2b$10$LDtf7u5wd2k1lujQ8UGSDOrrPHTZnmAg2.1h2DxR3sgHaeA/YPlEq','sbfzq1nwlps5ajaqq3ml',NULL),(175,'Vvv','Veljomailmailja@gmail.com','$2b$10$e4divPYD2wTgJ3n6GWkYReObMeibr94wL0vzu3YQz6SDsjwQF9Lzm',NULL,NULL),(185,'test','Test@test.test','$2b$10$vGOr2Em9t4pxnQenm8swXe3lfY29YFwKi87HsZE0tSPmkOTQXLShO','https://res.cloudinary.com/veljkoph/image/upload/v1638884567/user_1_jtz17y.png',NULL),(195,' as','as@as.as','$2b$10$E7x1D8/vxNTC2RVIMmjFAuefE9XugtCjbSdSOu.4EQkUeUDyXcmmi','https://res.cloudinary.com/veljkoph/image/upload/v1638884567/user_1_jtz17y.png',NULL),(205,'Mimi','Mimi.mimi@gmail.com','$2b$10$CA9wayA7vgs4Orq.KUd7ye.zaLBO6tbKoEgeZQGVdMbLBUABXJdf6','https://res.cloudinary.com/veljkoph/image/upload/v1638884567/user_1_jtz17y.png',NULL);
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

-- Dump completed on 2022-01-26 16:16:25
