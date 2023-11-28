TRUNCATE TABLE users, peeps RESTART IDENTITY CASCADE;

INSERT INTO users ("name", "username", "email", "password") VALUES
('Amber Thompson', 'Amber', 'amber@example.com', '$2a$12$NIjKQzEB.9mtj9L44r1iFuT5iB1fB.T0akjAo6vMKR7qXQO2Lnsey'),
('Billy Thompkins', 'Billy', 'billy@example.com', '$2a$12$bsI4g2Bhk6NYRf646u1Y7eGdD6PiSo9uDiAEuHJVxwOsO9fofoQJy'),
('Caleb Tomlinson', 'Caleb', 'caleb@example.com', '$2a$12$lGByQ50Z9IYVRiZYFppefutqlvp/0TYIF7bZKMR9VARM/AXkTyGsi')
;

INSERT INTO peeps ("body", "time", "tags", "user_id") VALUES
('Today I learned how to make SQL queries to get information from relational databases. It is so interesting! I cannnot wait to do something with this!', '2023-04-01 13:00:00', '#code, #render, #deploy, #amber', 1),
('Today I ate a whole cheesecake by myself. It was really delicious but now I feel quite sick and full of cheesecake and regret.', '2023-04-02 14:00:00', '#food, #sick, #billy', 2),
('Today I wrote a Chitter App so that I could share all my coding achievement with my friends!', '2023-04-03 15:00:00', '#code, #chitter, #amber', 1),
('Today I watched some clouds drift by. It was quite beautiful.', '2023-04-04 16:00:00', '#dream, #caleb', 3),
('Today I deployed my first app on Render with a PostgreSQL database.', '2023-04-05 17:00:00', '#new, #sql, #amber', 1),
('Today I dreamed I was a cloud.', '2023-04-06 18:00:00', '#clouds, #caleb', 3),
('Today I went to an all you can eat pizza place. The pizzas were pretty greasy and bland but it was all you can eat so I kept eating. The more I ate the more I felt a deep self-loathing but I could not stop and now I feel a deep sickness in my soul.', '2023-04-07 19:00:00', '#stuffed, #soul, #billy', 2)
;

-- Ensure that your postgres server is accessable at the IP address 127.0.0.1.
-- Create the postgreSQL databases for running and testing the project:
-- ```bash
-- createdb chitter
-- createdb chitter_test
-- ```
-- Create the tables in the databases:
-- ```bash 
-- psql -h 127.0.0.1 chitter < spec/crypt_tables.sql
-- psql -h 127.0.0.1 chitter_test < spec/tables.sql
-- ```
-- Populate the test database with seed data:
-- ```bash
-- psql -h 127.0.0.1 chitter < spec/crypt_seeds.sql
-- psql -h 127.0.0.1 chitter_test < spec/seeds.sql
-- ```