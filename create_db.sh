psql --username=freecodecamp --dbname=postgres
CREATE DATABASE salon;
\c salon
CREATE TABLE customers (customer_id SERIAL PRIMARY KEY, name VARCHAR(30), phone VARCHAR(20) UNIQUE);
CREATE TABLE appointments (appointment_id SERIAL PRIMARY KEY, time VARCHAR(10));
CREATE TABLE services (service_id SERIAL PRIMARY KEY, name VARCHAR(20));
ALTER TABLE appointments ADD COLUMN customer_id INT REFERENCES customers (customer_id);
ALTER TABLE appointments ADD COLUMN service_id INT REFERENCES services (service_id);
INSERT INTO services (name) VALUES ('cut'), ('color'), ('perm');
pg_dump -cC --inserts -U freecodecamp salon > salon.sql