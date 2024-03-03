-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE
    passengers 
    (
        id SERIAL PRIMARY KEY,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL
    );

CREATE TABLE
    airlines (id SERIAL PRIMARY KEY, name TEXT NOT NULL UNIQUE);

-- multiple tickets from different airlines can share same seat names
CREATE TABLE
    seats 
    (
        id SERIAL PRIMARY KEY, 
        name TEXT NOT NULL UNIQUE, 
        airline_id INTEGER REFERENCES airlines
    );

CREATE TABLE
    countries (id SERIAL PRIMARY KEY, name TEXT NOT NULL UNIQUE);

-- accounts for countries that no longer exist
CREATE TABLE
    destinations 
    (
        id SERIAL PRIMARY KEY,
        country_id INTEGER REFERENCES countries ON DELETE CASCADE,
        city TEXT NOT NULL
    );

CREATE TABLE
    flight_times 
    (
        id SERIAL PRIMARY KEY,
        depart TIMESTAMP,
        arrive TIMESTAMP
    );

CREATE TABLE
    tickets 
    (
        id SERIAL PRIMARY KEY,
        airline_id INTEGER REFERENCES airlines,
        from_id INTEGER REFERENCES destinations,
        to_id INTEGER REFERENCES destinations,
        flight_time_id INTEGER REFERENCES flight_times,
        passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
        seat_id INTEGER REFERENCES seats
    );

INSERT INTO passengers
(first_name,last_name)
VALUES
('Jennifer', 'Finch');

INSERT INTO airlines
(name)
VALUES
('United');

INSERT INTO seats
(name,airline_id)
VALUES
('33B',1);

INSERT INTO countries
(name)
VALUES
('United States');

INSERT INTO destinations
(country_id,city)
VALUES
(1,'Washington DC'),
(1,'Seattle');

INSERT INTO flight_times
(depart,arrive)
VALUES
('2018-04-08 09:00:00','2018-04-08 12:00:00');

INSERT INTO tickets
(airline_id,from_id,to_id,flight_time_id,passenger_id,seat_id)
VALUES
(1,1,2,1,1,1);