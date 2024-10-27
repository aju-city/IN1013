-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY NOT NULL,
  owner VARCHAR(45) NOT NULL,
  species ENUM('M', 'F') NOT NULL,
  gender VARCHAR(15),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20) NOT NULL,
  eventdate DATE NOT NULL,
  eventtype VARCHAR(15) NOT NULL,
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (petname, eventdate)
);
