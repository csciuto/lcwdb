--
-- Table structure for TABLE media
--

DROP TABLE IF EXISTS media;
CREATE TABLE media (
  media_id SERIAL,
  media_location varchar(255) DEFAULT NULL,
  PRIMARY KEY (media_id)
);
 
--
-- Dumping data for TABLE media
--
