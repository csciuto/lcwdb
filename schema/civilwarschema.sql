DROP TABLE IF EXISTS loading_table;
DROP TABLE IF EXISTS company_regiment_assignment;
DROP TABLE IF EXISTS ship_assignment;
DROP TABLE IF EXISTS soldier_media;
DROP TABLE IF EXISTS soldier;
DROP TABLE IF EXISTS ship;
DROP TABLE IF EXISTS company_regiment;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS regiment;
DROP TABLE IF EXISTS soldier_rank;
DROP TABLE IF EXISTS cemetery;
DROP TABLE IF EXISTS place;
DROP TABLE IF EXISTS monument_type;
DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS media;

-- Media records. For now, it's only mapped to soldiers, but it could
-- be mapped to units, cemeteries, etc.
CREATE TABLE media (
  media_id 			SERIAL,
  media_location	VARCHAR(255), -- A URL
  PRIMARY KEY(media_id)
);

-- For extra information.
CREATE TABLE notes (
	note_id		SERIAL,
	note		VARCHAR(255),
	PRIMARY KEY(note_id)
);

-- Upright, etc.
CREATE TABLE monument_type (
  monument_type_id		SERIAL,
  monument_type_name	VARCHAR(50),
  PRIMARY KEY(monument_type_id),
  UNIQUE (monument_type_name)
);

-- This table is used by soliders, cemeteries, and death records
CREATE TABLE place (
  place_id					SERIAL,
  city_name					VARCHAR(50) NOT NULL,
  state_code            	VARCHAR(2) NOT NULL,
  PRIMARY KEY(place_id),
  UNIQUE(city_name,state_code)
);

-- A cemetery record
CREATE TABLE cemetery (
  cemetery_id		SERIAL,
  cemetery_name		VARCHAR(50),
  location_id		INTEGER, -- place table  
  PRIMARY KEY(cemetery_id),
  FOREIGN KEY(location_id) REFERENCES place(place_id) 
);

-- A simple regiment table
CREATE TABLE regiment (
  regiment_id				SERIAL,
  regiment_name				VARCHAR(50) NOT NULL,
  PRIMARY KEY(regiment_id),
  UNIQUE(regiment_name)
);

-- A company table
-- Also has a "no company" company.
CREATE TABLE company (
  company_id                SERIAL,  
  company_name              VARCHAR(50),
  regiment_id               INTEGER NOT NULL,
  PRIMARY KEY(company_id),
  FOREIGN KEY(regiment_id)  REFERENCES regiment(regiment_id),
  UNIQUE(regiment_id,company_name)
);

-- Ranks.
CREATE TABLE soldier_rank (
  rank_id					SERIAL,
  rank_name					VARCHAR(50) NOT NULL,
  PRIMARY KEY	(rank_id),
  UNIQUE	(rank_name)
);

-- Ships
CREATE TABLE ship (
  ship_id					SERIAL,
  ship_name					VARCHAR(255),
  PRIMARY KEY	(ship_id),
  UNIQUE	(ship_name)
);

-- Main table.
CREATE TABLE soldier (
  soldier_id 				SERIAL,
  spreadsheet_id			INTEGER, -- The ID column from the spreadsheet.
  first_name				VARCHAR(25) NOT NULL,
  middle_initial			VARCHAR(2),
  last_name					VARCHAR(25) NOT NULL,
  suffix					VARCHAR(5),
  rank_id					SMALLINT,
  place_of_residence_id		INTEGER, -- Maps to place table.
  note_id					INTEGER,
  cemetery_id				INTEGER,
  monument_type_id			INTEGER,
  place_of_death_id			INTEGER, -- We rarely have this
  cemetery_lot				VARCHAR(50),
  cemetery_book_page		SMALLINT,
  fivehundred_club          BOOLEAN,
  year_of_death             SMALLINT,
  date_of_death             DATE,
  PRIMARY KEY (soldier_id),
  FOREIGN KEY (rank_id) REFERENCES soldier_rank(rank_id),
  FOREIGN KEY (place_of_residence_id)
		REFERENCES place(place_id),
  FOREIGN KEY (place_of_death_id)
		REFERENCES place(place_id),
  FOREIGN KEY (note_id)
		REFERENCES notes(note_id)
);

-- Yet another degree of indirection! Since a soldier can have been in
-- more than one unit, we need a many-to-many mapping table;
CREATE TABLE company_assignment (
  soldier_id          INTEGER NOT NULL,
  company_id          INTEGER NOT NULL,
  UNIQUE         (soldier_id, company_id),
  FOREIGN KEY        (soldier_id)
     REFERENCES       soldier(soldier_id),
  FOREIGN KEY        (company_id)
     REFERENCES       company(company_id)
);

-- Ship Assignments
CREATE TABLE ship_assignment (
  ship_id					SMALLINT NOT NULL,
  soldier_id				INTEGER NOT NULL,
  UNIQUE	(ship_id, soldier_id),
  FOREIGN KEY	(ship_id)
	REFERENCES	ship(ship_id),
  FOREIGN KEY	(soldier_id)
	REFERENCES	soldier(soldier_id)
);


-- This table allows a many-to-many mapping of solider records to media
CREATE TABLE soldier_media (
  soldier_id		INTEGER NOT NULL,
  media_id			INTEGER NOT NULL,
  FOREIGN KEY (soldier_id) REFERENCES soldier(soldier_id),
  FOREIGN KEY (media_id) REFERENCES media(media_id)
);

-- The loading table
CREATE TABLE loading_table (
  id				INTEGER NOT NULL,
  cbk_id			INTEGER NOT NULL,
  cem				VARCHAR(50),
  lastname			VARCHAR(25) NOT NULL,
  firstname			VARCHAR(25) NOT NULL,
  mi				VARCHAR(25),
  suffix			VARCHAR(5),
  cb_no				INTEGER NOT NULL,
  pob_city			VARCHAR(50),
  pb_st				VARCHAR(2),
  ship1				VARCHAR(25),
  ship2				VARCHAR(25),
  company2			VARCHAR(50),
  unit2				VARCHAR(50),
  rank				VARCHAR(25),
  comp				VARCHAR(50),
  unit				VARCHAR(50),
  fivehundred_club	BOOLEAN,
  notes				VARCHAR(255),
  yod				SMALLINT,
  dod				DATE,
  cem_loc			VARCHAR(255),
  stone_type		VARCHAR(50)
);
  
  
  
