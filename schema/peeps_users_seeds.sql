TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, password, name, username) 
VALUES ('samuelbadru@outlook.com', '$2a$12$GDZIoNTryOvWTakDIOeLaO5j3Z18GYz6NIwqi0WtkWX6SZkTN38a6', 'Samuel Badru', 'sobad'), -- password => makersforlife
       ('jermainecole@hotmail.com', '$2a$12$EbDxcnOtgHT5u1593.PLjuhv1Uv6r8QUFbLmqJbg2hol7e2n7dXCG', 'Jermaine Cole', 'j.cole'), -- password - middlechild
       ('aubreygraham@gmail.com', '$2a$12$OMGJGi6LFSxeD.cDwpJAE.MQqj6rhEDZs3DlB3fnfM31XXG8C58Ya', 'Aubrey Graham', 'drake'), -- password - hotlinebling
       ('kendrickduckworth@aol.com', '$2a$12$mZAI5Y87DMF3tz5c9oFPp.k0kLbLPI8uEqmlCGXYDKG7abDsxgkUW', 'Kendrick Duckworth', 'kendricklamar'); -- password - goodkid

INSERT INTO peeps (content, user_id) 
VALUES ('Just set up my chitter', 1),
       ('RIP Uncle Phil', 2),
       ('OMDs J.cole just joined chitter!', 1),
       ('Elon musk ruined twitter so here I am', 3), 
       ('I''m so sick of the photoshop', 4),
       ('Show me natural like afro on Richard Pryor', 4);