--
-- This table allows a many-to-many mapping of solider records to media
--

DROP TABLE IF EXISTS soldier_media;
CREATE TABLE soldier_media (
  soldier_id numeric(9) NOT NULL,
  media_id numeric(9) NOT NULL,
  KEY soldier_id (soldier_id),
  KEY media_id (media_id)
);

--
-- Dumping data for TABLE soldier_media
--

