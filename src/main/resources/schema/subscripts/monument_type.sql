--
-- Upright, etc
--

DROP TABLE IF EXISTS monument_type CASCADE;
CREATE TABLE monument_type (
  monument_type_id SERIAL,
  monument_type_name varchar(50) DEFAULT NULL,
  PRIMARY KEY (monument_type_id),
  UNIQUE (monument_type_name)
);

--
-- Dumping data for TABLE monument_type
--

INSERT INTO monument_type VALUES (1,'National-Flat'),(2,'Regular-Upright'),(3,'National-Upright'),(4,'Regular-Flat'),(5,'Government'),(6,'Private-Upright'),(7,'Private-Flat'),(8,'Stone'),(9,'Stone-Upright'),(10,'Stone-Boulder'),(11,'Regular-Fulton'),(12,'Private & Government'),(13,'Family-Upright'),(14,'Family-Flat'),(15,'Family Records');
