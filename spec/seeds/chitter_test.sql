TRUNCATE TABLE users, peeps RESTART IDENTITY; 


INSERT INTO users ("name", "username", "email_address", "password_hash") VALUES
('Johny', 'HappyCamper', 'johndoe1234@example.com' , 'cat16$&' ),
('Sarah', 'FitnessFanatic', 'sarahsmith5678@gmail.com', 'dogS555!'),
('Mike','MovieBuff', 'mikejones2468@yahoo.com' , 'Nemo*123'),
('Lindsey','AdventureSeeker', 'lindseybrown9876@hotmail.com', 'donald77!'),
('Samuel', 'Bookworm',  'samuelblack3210@outlook.com', 'mickey199%'),
('Kevin', 'MusicLover',  'kevinchen0123@live.com', 'greece$2023'),
('Amanda', 'NatureNerd', 'amandamiller4567@aol.com', 'new_y56!!');


INSERT INTO peeps ("peep_content", "time_of_peep", "user_id")
VALUES
  ('Welcome to chitter', '2023-03-14 15:00:00', 5),
  ('This is my first post', '2023-03-15 12:00:00', 6),
  ('I love chitter', '2023-03-27 17:00:00', 7);
