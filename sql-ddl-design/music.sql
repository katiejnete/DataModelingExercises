-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "artists" 
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE "albums" 
(
  id SERIAL PRIMARY KEY,
  release_date DATE NOT NULL,
  name TEXT NOT NULL
);

CREATE TABLE "producers" 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE "titles" 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE "songs" 
(
  id SERIAL PRIMARY KEY,
  title_id INTEGER REFERENCES titles,
  duration_in_seconds INTEGER CHECK(duration_in_seconds>0),
  artist_id INTEGER REFERENCES artists ON DELETE SET NULL,
  producer_id INTEGER REFERENCES producers ON DELETE SET NULL
);

CREATE TABLE "ablums_songs"
(
  id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES albums ON DELETE SET NULL,
  song_id INTEGER REFERENCES songs ON DELETE SET NULL
);

INSERT INTO artists
(name)
VALUES
('Hanson');

INSERT INTO albums
(name,release_date)
VALUES
('Middle of Nowhere','04-15-1997');

INSERT INTO producers
(name)
VALUES
('Dust Brothers'),
('Stephen Lironi');

INSERT INTO titles
(name)
VALUES
('MMMBop');

INSERT INTO songs
(title_id,duration_in_seconds,artist_id,producer_id)
VALUES
(1,238,1,1),
(1,238,1,2)
;

INSERT INTO ablums_songs
(album_id,song_id)
VALUES
(1,1),
(1,2);