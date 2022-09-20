TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, password, name, email) VALUES ('anna1', '$2a$12$baNOB3O2KCeKMxoYBCYa..TFIGakaNBFFm8hYW8vYzwfadlNHefoq', 'Anna Smith', 'anna@makersacademy.com');
INSERT INTO users (username, password, name, email) VALUES ('sjmog', '$2a$12$U5wMS5nMYmXy5yd2cWutnuOxy6G/idkFBZ2BFyGmZdVyeWoasCdcm', 'Sam Morgan', 'samm@makersacademy.com');

INSERT INTO peeps (content, date, user_id) VALUES ('Anna peep 1', '2022-08-17 07:37:16-08', 1);
INSERT INTO peeps (content, date, user_id) VALUES ('Sam peep 1', '2022-09-05 19:32:15-05', 2);
INSERT INTO peeps (content, date, user_id) VALUES ('Anna peep 2', '2022-09-01 13:47:52-02', 1);