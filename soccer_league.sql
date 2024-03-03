-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP DATABASE IF EXISTS  soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE  NOT NULL,
    ranking INTEGER UNIQUE  CHECK(ranking>0) NOT NULL
);

CREATE TABLE players 
(
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL
);

CREATE TABLE teams_players
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE NOT NULL,
    player_id INTEGER REFERENCES players ON DELETE SET NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date date UNIQUE  NOT NULL,
    end_date date UNIQUE  NOT NULL
);

CREATE TABLE refs
(
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL
);

CREATE TABLE matches 
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams ON DELETE SET NULL,
    team2_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches  NOT NULL,
    player_id INTEGER REFERENCES players ON DELETE SET NULL
);

CREATE TABLE refs_matches
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches NOT NULL,
    ref_id INTEGER REFERENCES refs ON DELETE SET NULL
);

CREATE TABLE seasons_matches
(
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES seasons  NOT NULL,
    match_id INTEGER  REFERENCES matches NOT NULL
);
