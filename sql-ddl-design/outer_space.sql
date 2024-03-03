-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE planets_stars 
(
  id SERIAL PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets_stars NOT NULL,
  orbits INTEGER REFERENCES planets_stars NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE galaxies 
(
  id SERIAL PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE planets_galaxies (
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets_stars NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name text UNIQUE DEFAULT 'unnamed'
);

CREATE TABLE planets_moons (
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets_stars NOT NULL, 
  moon_id INTEGER REFERENCES moons NOT NULL
);

INSERT INTO planets_stars
(name)
VALUES
('Earth'),
('The Sun');

INSERT INTO orbits_around
(planet_id,orbits,orbital_period_in_years)
VALUES
(1,2,1.00);

INSERT INTO galaxies
(name)
VALUES
('Milky Way');

INSERT INTO planets_galaxies
(planet_id,galaxy_id)
VALUES
(1,1);

INSERT INTO moons
(name)
VALUES 
('The Moon');

INSERT INTO planets_moons
(planet_id,moon_id)
VALUES
(1,1);