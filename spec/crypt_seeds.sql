TRUNCATE TABLE users, peeps RESTART IDENTITY CASCADE;

INSERT INTO users ("name", "username", "email", "password") VALUES
('Amber Thompson', 'Amber', 'amber@example.com', '$2a$12$NIjKQzEB.9mtj9L44r1iFuT5iB1fB.T0akjAo6vMKR7qXQO2Lnsey'),
('Billy Thompkins', 'Billy', 'billy@example.com', '$2a$12$bsI4g2Bhk6NYRf646u1Y7eGdD6PiSo9uDiAEuHJVxwOsO9fofoQJy'),
('Caleb Tomlinson', 'Caleb', 'caleb@example.com', '$2a$12$lGByQ50Z9IYVRiZYFppefutqlvp/0TYIF7bZKMR9VARM/AXkTyGsi')
;

INSERT INTO peeps ("body", "time", "tags", "user_id") VALUES
('Today I coded', '2023-04-01 13:00:00', '#code, #amber', 1),
('Today I ate', '2023-04-02 14:00:00', '#food, #billy', 2),
('Today I slept', '2023-04-03 15:00:00', '#sleep, #amber', 1),
('Today I wept', '2023-04-04 16:00:00', '#cry, #caleb', 3),
('Today I swam', '2023-04-05 17:00:00', '#swim, #amber', 1),
('Today I meditated', '2023-04-06 18:00:00', '#meditate, #caleb', 3),
('Today I relaxed', '2023-04-07 19:00:00', '#relax, #billy', 2)
;

-- All passwords are 'Password123'