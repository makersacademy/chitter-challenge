CREATE TABLE peeps (
  peep_id SERIAL PRIMARY KEY, 
  peep_text VARCHAR(500) NOT NULL,
  user_id INT NOT NULL,
  time timestamp
);

INSERT INTO peeps (peep_text, user_id, time) VALUES ('Every application somehow needs PosgreSQL', 45, '2022-05-13 15:24:57');
