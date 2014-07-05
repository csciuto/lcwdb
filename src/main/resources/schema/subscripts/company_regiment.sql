--
-- TODO: Is this table used?
--

DROP TABLE IF EXISTS company_regiment CASCADE;
CREATE TABLE company_regiment (
  company_regiment_id SERIAL,
  regiment_id INTEGER NOT NULL,
  company_id numeric(9) DEFAULT NULL,
  PRIMARY KEY (company_regiment_id),
  UNIQUE (company_id),
  FOREIGN KEY (regiment_id) REFERENCES regiment (regiment_id) 
);

--
-- Dumping data for TABLE company_regiment
--

INSERT INTO company_regiment VALUES (1,78,37),(2,79,38);
