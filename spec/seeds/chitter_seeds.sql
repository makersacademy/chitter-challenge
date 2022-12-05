TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (name, username, password, email) VALUES
('Bruce Wayne', 'dknight1', '$2a$12$mdhc78dhgjXE/rL2elo0lONTigTu1/7v1VNVWIHgxvwV2Jms289e6', 'bruce1@jlmail.com'),
('Clark Kent', 'farmboy2', '$2a$12$E6Smngg/1Uj/IePYOsK4lu.RlR.IvEpCg/6r0ZOALhGxN.a3Vz1XS', 'clark2@jlmail.com'),
('Diana Prince', 'amazonian3', '$2a$12$nw0Gy3T.TqytZ8wBp2Cka.25dgci8Gxzu25ZmVWdE.bzh7EEi.GdK', 'diana3@jlmail.com');

INSERT INTO peeps (content, time_posted, user_id) VALUES
('I had a great day at the office!', '2022-11-03 17:30:00', 1),
('I am going on vacation!', '2022-11-05 18:00:00', 1),
('Wrote a great story today.', '2022-11-07 19:10:00', 2),
('I saw a beautiful sunset.', '2022-11-09 20:05:00', 3),
('Had a great dinner with my parents.', '2022-11-11 21:00:00', 2);

-- psql -h 127.0.0.1 chitter < chitter_seeds.sql