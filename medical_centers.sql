DROP DATABASE IF EXISTS  medical_centers;

CREATE DATABASE medical_centers;

\c medical_centers;

CREATE TABLE medical_centers 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  experience_yrs FLOAT CHECK (experience_yrs >= 0) NOT NULL
);

CREATE TABLE doctors_med 
(
  id SERIAL PRIMARY KEY,
  med_center_id INTEGER REFERENCES med ON DELETE CASCADE NOT NULL,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age FLOAT CHECK (age >= 0) NOT NULL
);

CREATE TABLE doctors_patients 
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
  patient_id INTEGER REFERENCES patients ON DELETE SET NULL
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease TEXT NOT NULL
);

CREATE TABLE diagnoses 
(
  id SERIAL PRIMARY KEY,
  date date NOT NULL,
  med_center_id INTEGER REFERENCES med NOT NULL,
  doctor_id INTEGER REFERENCES doctors NOT NULL,
  patient_id INTEGER REFERENCES patients NOT NULL,
  disease_id INTEGER REFERENCES diseases
);




