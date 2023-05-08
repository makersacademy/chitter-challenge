TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (name, username, email, password) VALUES('Hayley', 'iamdobbs', 'hayley@makers.com', 'password1');
INSERT INTO users (name, username, email, password) VALUES('Bobby', 'bobster', 'bobby@makers.com', 'password2');
INSERT INTO peeps (content, time, user_id) VALUES('First Peep!', (TO_TIMESTAMP('01-02-2023 17:30:40', 'DD-MM-YYYY HH24:MI:SS')) , '1');
INSERT INTO peeps (content, time, user_id) VALUES('This is the second Peep!', (TO_TIMESTAMP('04-02-2023 12:45:00', 'DD-MM-YYYY HH24:MI:SS')), '2');

-- Password values above are used only as example values for test seeds and do not contain any sensitive data.
-- Will revisit this to expand on MVP by using BCrypt or alternative tool once I have a better understanding of how to implement.