DROP DATABASE IF EXISTS  medical_centers;

CREATE DATABASE medical_centers;

\c medical_centers;

CREATE TABLE medical_centers 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE specialties
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialty_id INTEGER REFERENCES specialties NOT NULL,
  experience_yrs FLOAT CHECK (experience_yrs >= 0) NOT NULL
);

CREATE TABLE doctors_med 
(
  id SERIAL PRIMARY KEY,
  med_center_id INTEGER REFERENCES medical_centers ON DELETE CASCADE NOT NULL,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE NOT NULL
);

CREATE TABLE insurance_groups
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age FLOAT CHECK (age >= 0) NOT NULL,
  insurance_id INTEGER REFERENCES insurance_groups
);

CREATE TABLE visits 
(
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
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
  med_center_id INTEGER REFERENCES medical_centers NOT NULL,
  visit_id INTEGER REFERENCES visits NOT NULL,
  disease_id INTEGER REFERENCES diseases
);




