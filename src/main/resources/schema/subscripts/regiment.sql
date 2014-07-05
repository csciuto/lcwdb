--
-- A simple regiment table
--

DROP TABLE IF EXISTS regiment CASCADE;
CREATE TABLE regiment (
  regiment_id SERIAL,
  regiment_name varchar(50) NOT NULL,
  PRIMARY KEY (regiment_id),
  UNIQUE (regiment_name)
);

--
-- Dumping data for TABLE regiment
--

INSERT INTO regiment VALUES (1,'4VT'),(2,'20ME'),(3,'43MA'),(4,'15MA'),(5,'60MA'),(6,'29MA'),(7,'59MA'),(8,'2MA HVY ARTY'),(9,'USN'),(10,'8MA'),(11,'24CORPS'),(12,'57MA'),(13,'26MA'),(14,'7MA LT ARTY'),(15,'1US LT ARTY'),(16,'56MA'),(17,'15MA LT ARTY'),(18,'20VRC'),(19,'9VRC'),(20,'6MA'),(21,'1MA LT ARTY'),(22,'US ENG'),(23,'11MA'),(24,'1MA HVY ARTY'),(25,'3MA CAV'),(26,'21MA'),(27,'33IN'),(28,'6VRC'),(29,'48MA'),(30,'VRC'),(31,'17MA'),(32,'30ME'),(33,'2MA CAV'),(34,'10NH'),(35,'10VRC'),(36,'USMC'),(37,'2ME CAV'),(38,'5MA'),(39,'2MA'),(40,'3MA HVY ARTY'),(41,'9MA'),(42,'4NH'),(43,'13VRC'),(44,'39MA'),(45,'30MA'),(46,'3NJ CAV'),(47,'1US'),(48,'10MA CAV'),(49,'3VRC'),(50,'1NH LT ARTY'),(51,'6MA LT ARTY'),(52,'53MA'),(53,'GAR'),(54,'1ME CAV'),(55,'32MA'),(56,'1US ARTY'),(57,'4US'),(58,'61MA'),(59,'6CA'),(61,'16MA'),(62,'2D LT ARTY'),(63,'1 VOL SS'),(64,'7NY'),(65,'126NY'),(66,'28MA'),(67,'11US'),(68,'58MA'),(69,'2US'),(70,'13MA'),(72,'CWS'),(73,'20MA'),(74,'12ME'),(75,'14VRC'),(76,'3US ARTY'),(77,'22MA'),(78,'26NY CAV'),(79,'17ME'),(80,'26NY'),(81,'33MA'),(82,'ME CG'),(83,'11MA LT ARTY'),(84,'7ME'),(85,'27ME'),(86,'2NH'),(87,'MA SS'),(88,'7VT'),(89,'GENERAL'),(90,'ME VET INF'),(91,'1MA CAV'),(92,'1NH HVY ARTY'),(93,'4MA'),(94,'1RI LT ARTY'),(95,'40MA'),(96,'108IL'),(97,'4MA CAV'),(98,'98NY'),(99,'13NH'),(100,'15NH'),(101,'12MA'),(102,'13VT'),(103,'22ME'),(104,'3NH'),(105,'7NH'),(106,'14VT'),(107,'1MA'),(108,'25MA'),(109,'2MA SS'),(110,'46MA'),(111,'19MA'),(112,'31MA'),(113,'9CT'),(114,'14MA'),(115,'1ME HVY ARTY'),(116,'155IN'),(117,'8VT'),(118,'15ME'),(119,'5ME'),(120,'29ME'),(121,'9NH'),(122,'16ME'),(123,'9VT'),(124,'35MA'),(125,'MVH'),(126,'5NH'),(127,'5PA'),(128,'1NH'),(129,'38MA'),(130,'16VT'),(131,'3MA'),(132,'3VT'),(133,'26ME'),(134,'17NH'),(135,'11NH'),(136,'14NH'),(137,'8US'),(138,'42MA'),(139,'9NJ'),(140,'1ME LT ARTY'),(141,'32OH'),(142,'14US'),(143,'44MA'),(144,'2NY CAV'),(145,'9ME'),(146,'8NH'),(147,'2BD'),(148,'2ME'),(149,'12MA LT ARTY'),(150,'6VT'),(151,'5MA CAV'),(152,'6ME'),(153,'99NY'),(154,'15OH'),(155,'MA CAV BN'),(156,'12MO'),(157,'7RI'),(158,'25 MA UNATT'),(159,'1US ENG'),(161,'55IL'),(162,'11NY'),(163,'24ME'),(164,'13MA LT ARTY'),(165,'40WI'),(166,'3US'),(167,'2RI'),(168,'17VT'),(169,'19USCT'),(170,'9MA LT ARTY'),(171,'8MI'),(172,'13ME'),(173,'5ME LT ARTY'),(174,'10VT'),(175,'1NY CAV'),(176,'12VT'),(177,'24MA'),(178,'50MA'),(179,'6NY IND LT ARTY'),(180,'6NH'),(181,'38NY'),(182,'4MA HVY ARTY'),(183,'134IL'),(184,'3MA RIFLE'),(185,'US ARMY'),(186,'48NY'),(187,'39NY'),(188,'11WI'),(189,'2VT ARTY'),(190,'84NY'),(191,'45MA'),(192,'23MA'),(193,'US PAYMASTER'),(194,'192NY'),(195,'1MA ARTY'),(196,'35NJ'),(197,'124IL'),(198,'4MA LT ARTY'),(199,'3NY CAV'),(200,'50USCT'),(201,'40NJ'),(202,'1ME VET'),(203,'25ME'),(204,'25MVI'),(205,'26NH'),(206,'1CT HVY ARTY'),(208,'8ME'),(209,'1VT'),(210,'47MA'),(211,'4ME'),(212,'23ME'),(213,'2VT'),(214,'5VT'),(215,'5US HVY ARTY'),(216,'1US CAV'),(217,'19 UNATT INF CO'),(218,'62NY'),(219,'12NH'),(220,'18NH'),(221,'15NY LT ARTY'),(222,'5NY'),(223,'54MA'),(224,'NURSE'),(225,'92NY'),(226,'MASS SALEM CADETS'),(227,'10ME'),(228,'8MA UNATT'),(229,'2MA LT ARTY'),(230,'17US'),(231,'28ME'),(232,'14MA LT ARTY'),(233,'9NY CAV'),(234,'19ME'),(235,'13NJ'),(236,'146NY'),(237,'8CT'),(238,'2NJ'),(239,'3CT LT ARTY'),(240,'14ME'),(241,'1ME '),(242,'193NY'),(243,'7CA'),(244,'170USCT'),(245,'40NY'),(246,'19IL'),(248,'46IL'),(249,'40US'),(250,'71PA'),(251,'36USCT'),(252,'10MA'),(253,'8MA LT ARTY'),(254,'37IN'),(255,'60NY'),(256,'14CT'),(257,'1VT HVY ARTY'),(258,'3ME LT ARTY'),(259,'1OH LT ARTY'),(260,'2CT HAVY ARTY'),(261,'96NY'),(262,'1CT CAV'),(263,'10NY CAV'),(264,'27MA'),(265,'15VT'),(267,'1RI CAV'),(268,'63NY'),(269,'124NY'),(270,'51NY'),(271,'9US'),(272,'US MEDICAL VOL'),(273,'1VT CAV'),(274,'1 VT HVY ARTY'),(275,'USVOL'),(276,'5PA CAV'),(277,'29US'),(278,'2PA HVY ARTY'),(279,'188PA'),(280,'DC INF'),(281,'21NY CAV'),(282,'55MA'),(283,'112US'),(284,'43NY'),(285,'1WI'),(286,'150PA'),(287,'8MA CAV'),(288,'15RVI'),(289,'45US'),(290,'US INF'),(291,'142NY'),(292,'67NY'),(293,'TEXAS LT ARTY'),(294,'1MD'),(295,'1MI'),(296,'5VY'),(297,'12NY'),(298,'7PA'),(299,'1NH CAV'),(300,'39IL'),(301,'62MA'),(302,'9RI'),(303,'10MA UNATT INF'),(304,'USCT'),(305,'40US VET'),(306,'12US'),(307,'4CA'),(308,'29MA HVY ARTY'),(309,'2NY'),(310,'ME INF'),(311,'1US HVY ARTY'),(312,'9NY ARTY'),(313,'9NH HVY ARTY'),(314,'3MA LT ARTY'),(315,'21ME'),(316,'18MA'),(317,'16NH'),(318,'10MA LT ARTY'),(319,'3VT LT ARTY'),(320,'77NY'),(321,'7US'),(322,'2CAV USCT'),(323,'106NY'),(324,'112NY'),(325,'162NY'),(326,'6VY'),(327,'11ME'),(328,'11VT'),(329,'2US HVY ARTY'),(330,'183OH'),(331,'83NY'),(332,'4WI'),(333,'1KY HVY ARTY'),(334,'8MA HVY ARTY '),(335,'75US'),(336,'20CT'),(337,'31NY'),(338,'5US'),(339,'3NY'),(340,'1MA SS'),(341,'33NA'),(342,'13US'),(343,'9NY'),(344,'95OH'),(345,'53PA'),(346,'OH LT ARTY'),(347,'132PA'),(348,'34MA'),(349,'1RI '),(350,'32ME'),(351,'54IL'),(352,'1IL CAV'),(353,'37MA'),(354,'7WI'),(355,'1IL LT ARTY'),(356,'49MA'),(357,'151NY'),(358,'23OH'),(359,'2DC INF'),(360,'27IL'),(361,'25NY'),(362,'5NY HVY ARTY'),(363,'1OH'),(364,'7ME UNATT'),(365,'150NY'),(366,'6NY HVY ARTY'),(367,'21WI'),(368,'31ME'),(369,'3RI HVY ARTY'),(370,'7MA'),(371,'3NJ'),(372,'114PA'),(373,'3PA HVY ARTY'),(374,'2ME LT ARTY'),(375,'10ME CAV'),(376,'34NJ'),(377,'7KS CAV'),(378,'26TH NY');