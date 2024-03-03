-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists 
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums 
(
  id SERIAL PRIMARY KEY,
  release_date DATE NOT NULL,
  artist_id INTEGER REFERENCES artists,
  name TEXT NOT NULL
);

CREATE TABLE songs 
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER CHECK(duration_in_seconds>0),
  album_id INTEGER REFERENCES albums ON DELETE SET NULL
);

CREATE TABLE producers_songs 
(
  id SERIAL PRIMARY KEY,
  producer_id INTEGER REFERENCES producers NOT NULL,
  song_id INTEGER REFERENCES songs NOT NULL
);

INSERT INTO artists
(name)
VALUES
('Hanson');

INSERT INTO producers
(name)
VALUES
('Dust Brothers'),
('Stephen Lironi');

INSERT INTO albums
(name,release_date,artist_id)
VALUES
('Middle of Nowhere','04-15-1997',1);

INSERT INTO songs
(title,duration_in_seconds,album_id)
VALUES
('MMMBop',238,1)
;

INSERT INTO producers_songs
(producer_id,song_id)
VALUES
(1,1),
(2,1);