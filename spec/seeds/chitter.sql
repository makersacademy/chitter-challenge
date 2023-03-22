TRUNCATE TABLE users, peeps RESTART IDENTITY; 
DROP TABLE IF EXISTS users, peeps; 

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text, 
    username text,
    email_address text,
    password text 
);
INSERT INTO users (name, username, email_address, password) VALUES
('Admin', 'adminusername' , 'admin@email.com' , 'adminpassword');

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    peep_content text,
    time_of_peep timestamp,
    user_id int,
    constraint fk_user foreign key(user_id)
        references users(id)
        on delete cascade
);




INSERT INTO users ("name", "username", "email_address", "password") VALUES
('John', 'HappyCamper', 'johndoe1234@example.com' , 'cat16$&' ),
('Sarah', 'FitnessFanatic', 'sarahsmith5678@gmail.com', 'dogS555!'),
('Mike','MovieBuff', 'mikejones2468@yahoo.com' , 'Nemo*123'),
('Lindsey','AdventureSeeker', 'lindseybrown9876@hotmail.com', 'donald77!'),
('Samuel', 'Bookworm',  'samuelblack3210@outlook.com', 'mickey199%'),
('Kevin', 'MusicLover',  'kevinchen0123@live.com', 'greece$2023'),
('Amanda', 'NatureNerd', 'amandamiller4567@aol.com', 'new_y56!!');


INSERT INTO peeps (
  "peep_content", 
  "time_of_peep",
  "user_id"
  ) 
  VALUES
    ('Welcome to chitter', '2023-03-22 15:00:00',1),
    ('This is my first post', '2023-03-15 12:00:00',2),
    ('I love chitter', '2023-03-22 17:00:00',3)