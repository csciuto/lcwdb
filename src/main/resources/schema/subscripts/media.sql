-- Media records. For now, it's only mapped to soldiers, but it could
-- be mapped to units, cemeteries, etc.

DROP TABLE IF EXISTS media CASCADE;
CREATE TABLE media (
  media_id SERIAL,
  media_location varchar(255) DEFAULT NULL,
  PRIMARY KEY (media_id)
);
 
--
-- Dumping data for TABLE media
--
