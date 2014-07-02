--
-- A cemetery record
--

DROP TABLE IF EXISTS cemetery;
CREATE TABLE cemetery (
  cemetery_id SERIAL,
  cemetery_name varchar(50) DEFAULT NULL,
  location_id numeric(9) DEFAULT NULL,
  PRIMARY KEY (cemetery_id),
  UNIQUE (location_id)
);

--
-- Dumping data for TABLE cemetery
--

INSERT INTO cemetery VALUES (1,'Edson Cemetery',4),(2,'Hildreth Cemetery',4),(3,'Lowell Cemetery',4),(4,'National Cemetery',391),(5,'Olde English Cemetery',4),(6,'St Patrick''s Cemetery',4),(7,'Westlawn Cemetery',4),(8,'Woodbine Cemetery',4),(9,'Tewksbury Cemetery',70),(10,'Togus National Cemetery',390),(11,'St Joseph''s Cemetery',84),(12,'School Street Cemetery',4);
