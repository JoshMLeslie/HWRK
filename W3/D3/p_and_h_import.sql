CREATE TABLE people (
  -- Each person will live in a house
  -- person.house => house that person lives in
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  house_id INTEGER -- people can be homeless! This is the real world!

  FOREIGN KEY (house_id) REFERENCES houses(id)
);


CREATE TABLE houses (
  -- Each house will have an address
  -- house.residents => list people in the house
  id SERIAL PRIMARY KEY,
  address VARCHAR(255) NOT NULL

);
