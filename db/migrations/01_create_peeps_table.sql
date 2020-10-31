CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  peeps VARCHAR(280)
);

INSERT INTO peeps(peep)
VALUES(
  'My first peep',
);

INSERT INTO peeps(peep)
VALUES(
  'My second peep'
);
