TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, password, name, username) 
VALUES ('samuelbadru@outlook.com', 'makersforlife', 'Samuel Badru', 'sobad'),
       ('jermainecole@hotmail.com', 'middlechild', 'Jermaine Cole', 'j.cole'),
       ('aubreygraham@gmail.com', 'hotlinebling', 'Aubrey Graham', 'drake'),
       ('kendrickduckworth@aol.com', 'goodkid', 'Kendrick Duckworth', 'kendricklamar');

INSERT INTO peeps (content, user_id) 
VALUES ('Just set up my chitter', 1),
       ('RIP Uncle Phil', 2),
       ('OMDs J.cole just joined chitter!', 1),
       ('Elon musk ruined twitter so here I am', 3), 
       ('I''m so sick of the photoshop', 4),
       ('Show me natural like afro on Richard Pryor', 4);