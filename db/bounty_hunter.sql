DROP TABLE IF EXISTS bounty;

CREATE TABLE bounty (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT4,
  favourite_weapon VARCHAR(255)
);