--
-- This table allows a many-to-many mapping of solider records to media
--

DROP TABLE IF EXISTS soldier_media CASCADE;
CREATE TABLE soldier_media (
  soldier_id INTEGER NOT NULL,
  media_id INTEGER NOT NULL,
  FOREIGN KEY (soldier_id) REFERENCES soldier (soldier_id),
  FOREIGN KEY (media_id) REFERENCES media (media_id)
);

--
-- Dumping data for TABLE soldier_media
--

