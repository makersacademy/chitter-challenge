-- CREATE TABLE people (
--   "id" SERIAL PRIMARY KEY,
--   "name" text UNIQUE,
--   "handle" text UNIQUE,
--   "email" text,
--   "password" text
-- );



-- -- Then the table with the foreign key.
-- CREATE TABLE messages (
--   "id" SERIAL PRIMARY KEY,
--   "message" text,
--   "person_id" int,
--   "time" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   constraint fk_person foreign key(person_id)
--     references people(id)
--     on delete cascade
-- );

TRUNCATE TABLE people RESTART IDENTITY CASCADE;
TRUNCATE TABLE messages RESTART IDENTITY; 

INSERT INTO people (name, handle, email, password) VALUES ('Johnny', 'singStar', 'johnny@sing2.com', 'A');
INSERT INTO people (name, handle, email, password) VALUES ('Rossita', 'singForever', 'rossita@sing2.com', 'B');
INSERT INTO people (name, handle, email, password) VALUES ('Moon', 'singHero', 'singHero@sing2.com', 'C');

INSERT INTO messages (message, person_id) VALUES ('Who''s still meeting for lunch and what shall we go?', 1);
INSERT INTO messages (message, person_id, time) VALUES ('Yep I''m coming!', 3, '2022-09-01 11:05:01');
INSERT INTO messages (message, person_id, time) VALUES ('How about Franca Manco?', 3, '2022-09-01 11:02:30');
INSERT INTO messages (message, person_id, time) VALUES ('Sorry guys I can''t make it', 2, '2022-09-01 11:15:01');
INSERT INTO messages (message, person_id, time) VALUES ('Shame to miss you Rossita, see you later Moon', 1, '2022-09-01 11:16:45');
