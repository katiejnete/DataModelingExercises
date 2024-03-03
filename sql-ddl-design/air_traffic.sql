-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE
    passengers (
        id SERIAL PRIMARY KEY,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL
    );

CREATE TABLE
    airlines (id SERIAL PRIMARY KEY, name TEXT NOT NULL UNIQUE);

CREATE TABLE
    flight_times (
        id SERIAL PRIMARY KEY,
        depart_id TIMESTAMP,
        arrive_id TIMESTAMP
    );


-- multiple tickets from different airlines can share same seat names
CREATE TABLE
    seats (id SERIAL PRIMARY KEY, name TEXT NOT NULL UNIQUE);

CREATE TABLE
    countries (id SERIAL PRIMARY KEY, name TEXT NOT NULL UNIQUE);

-- accounts for countries that no longer exist
CREATE TABLE
    destinations (
        id SERIAL PRIMARY KEY,
        country_id INTEGER REFERENCES countries ON DELETE CASCADE,
        city TEXT NOT NULL
    );

CREATE TABLE
    flights (
        id SERIAL PRIMARY KEY,
        flight_time_id INTEGER REFERENCES flight_times ON DELETE SET NULL,
        airline_id INTEGER REFERENCES airlines ON DELETE CASCADE,
        from_id INTEGER REFERENCES destinations,
        to_id INTEGER REFERENCES destinations
    );

CREATE TABLE
    tickets (
        id SERIAL PRIMARY KEY,
        passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
        seat_id INTEGER REFERENCES seats,
        flight_id INTEGER REFERENCES flights ON DELETE CASCADE
    );

INSERT INTO passengers
(first_name,last_name)
VALUES
('Jennifer', 'Finch');

INSERT INTO airlines
(name)
VALUES
('United');

INSERT INTO times
(time)
VALUES
('2018-04-08 09:00:00'),
('2018-04-08 12:00:00');

INSERT INTO flight_times
(depart_id,arrive_id)
VALUES
(1,2);

INSERT INTO seats
(name)
VALUES
('33B');

INSERT INTO countries
(name)
VALUES
('United States');

INSERT INTO destinations
(country_id,city)
VALUES
(1,'Washington DC'),
(1,'Seattle');

INSERT INTO flights
(flight_time_id,airline_id,from_id,to_id)
VALUES 
(1,1,1,2);

INSERT INTO tickets
(passenger_id,seat_id,flight_id)
VALUES
(1,1,1);