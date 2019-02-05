CREATE TABLE peeps (
  peep_id SERIAL PRIMARY KEY, 
  user_id INT REFERENCES users(user_id),  
  created TIMESTAMP DEFAULT NOW(),
  content VARCHAR(140)
);

INSERT INTO peeps (user_id, created, content) VALUES(1, '2016-09-29 12:00:00', 'One peep.');
INSERT INTO peeps (user_id, created, content) VALUES(1, '2017-09-29 12:00:00', 'Two peeps.');
INSERT INTO peeps (user_id, created, content) VALUES(2, '2018-04-29 12:00:00', 'What are you doing?');
INSERT INTO peeps (user_id, created, content) VALUES(3, '2018-05-29 12:00:00', 'That is my name.');
INSERT INTO peeps (user_id, created, content) VALUES(2, '2018-11-23 12:00:00', 'Get me a Timmies, stat!');
INSERT INTO peeps (user_id, created, content) VALUES(4, '2018-11-24 12:00:00', 'Meow, gluten free pizza.');
INSERT INTO peeps (user_id, created, content) VALUES(5, '2018-11-25 12:00:00', 'My love it kills me slowly, slowly I could die.');
INSERT INTO peeps (user_id, created, content) VALUES(1, '2018-11-25 12:00:00', 'Three peeps.');
INSERT INTO peeps (user_id, created, content) VALUES(5, '2018-11-25 17:00:00', 'psycho killer qu''est-ce que c''est.');
INSERT INTO peeps (user_id, created, content) VALUES(2, '2018-11-25 18:00:00', 'Three peeps.');
INSERT INTO peeps (user_id, created, content) VALUES(1, '2018-11-25 18:25:00', 'I already said that!');
INSERT INTO peeps (user_id, created, content) VALUES(4, '2018-11-25 18:26:00', 'One peeps.');
INSERT INTO peeps (user_id, created, content) VALUES(1, '2018-11-25 18:26:01', 'No supper for you, Wilber!!');
