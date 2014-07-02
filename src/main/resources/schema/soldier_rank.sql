--
-- Ranks
--

DROP TABLE IF EXISTS soldier_rank;
CREATE TABLE soldier_rank (
  rank_id numeric(6) NOT NULL AUTO_INCREMENT,
  rank_name varchar(50) NOT NULL,
  PRIMARY KEY (rank_id),
  UNIQUE (rank_name)
);

--
-- Dumping data for TABLE soldier_rank
--

INSERT INTO soldier_rank VALUES (1,'PVT'),(2,'MAJ'),(3,'CPL'),(4,'2LT'),(5,'SURGEON'),(6,'CPT'),(7,'SGT'),(8,'MUSICIAN'),(9,'LANDSMAN'),(10,'SEAMAN'),(11,'ENG'),(12,'MATE'),(13,'QM SGT'),(14,'MED ORD'),(15,'MG'),(16,'1LT'),(18,'ADJ'),(19,'BG'),(20,'FIREMAN'),(21,'NURSE'),(22,'COL'),(23,'1SGT'),(24,'WAGONER'),(25,'QTMSTR'),(26,'HOSPITAL'),(27,'LT'),(29,'BUGLER'),(30,'CWS'),(31,'DRUMMER'),(32,'MSG'),(33,'ASST ENG'),(34,'LTC'),(35,'COAL HEAVER'),(36,'GM'),(37,'PAYMSTR');
