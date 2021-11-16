DROP TABLE if EXISTS property_reviews;
DROP TABLE if EXISTS reservations;
DROP TABLE if EXISTS properties;
DROP TABLE if EXISTS users;

CREATE TABLE users(
id SERIAL PRIMARY KEY,
"name" VARCHAR(255),
email VARCHAR(255),
"password" VARCHAR(255)
);

CREATE TABLE properties(
id SERIAL PRIMARY KEY,
owner_id INT REFERENCES users(id),
title VARCHAR(255),
description TEXT,
thumbnail_photo_url VARCHAR(255),
cover_photo_url VARCHAR(255),
cost_per_night INT,
parking_spaces INT,
number_of_bathrooms INT,
number_of_bedrooms INT,
country VARCHAR(255),
street VARCHAR(255),
city VARCHAR(255),
province VARCHAR(255),
post_code VARCHAR(255),
active bool
);

CREATE TABLE reservations(
id SERIAL PRIMARY KEY,
start_date date,
end_date date,
property_id INT REFERENCES properties(id),
guest_id INT REFERENCES users(id)
);

CREATE TABLE property_reviews(
id SERIAL PRIMARY KEY,
guest_id INT REFERENCES users(id),
property_id INT REFERENCES properties(id),
reservation_id INT REFERENCES reservations(id),
rating INT,
message VARCHAR(255)
);

