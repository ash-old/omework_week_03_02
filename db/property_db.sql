DROP TABLE property_list;

CREATE TABLE property_list (
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  value INT,
  number_of_bedrooms INT,
  build VARCHAR(255)
);
