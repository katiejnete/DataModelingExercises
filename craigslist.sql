-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP DATABASE IF EXISTS  craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE categories 
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE regions 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(18) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    region_id INTEGER REFERENCES regions NOT NULL
);

CREATE TABLE locations 
(
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL
);

CREATE TABLE posts 
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    location_id INTEGER REFERENCES locations NOT NULL,
    region_id INTEGER REFERENCES regions NOT NULL,
    category_id INTEGER REFERENCES categories NOT NULL,
    title VARCHAR(72) NOT NULL,
    text TEXT   NULL
);

