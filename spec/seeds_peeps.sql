TRUNCATE TABLE peeps RESTART IDENTITY; 

INSERT INTO peeps (content, timestamp, user_id)
VALUES ('Just had the best burger ever!', '2022-09-01 12:30:00', 1),
('Can''t wait for the weekend!', '2022-09-02 16:45:00', 2),
('Excited to start my new job!', '2022-09-03 09:00:00', 3),
('Watching the game with friends tonight', '2022-09-04 20:15:00', 1),
('Trying out a new recipe for dinner', '2022-09-05 18:00:00', 2),
('Just finished a great workout', '2022-09-06 07:30:00', 3);