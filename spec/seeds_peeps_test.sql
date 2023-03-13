TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users (first_name, last_name, user_name, user_email) VALUES ('User', '1', 'User 1', 'user1@peep.com');
INSERT INTO users (first_name, last_name, user_name, user_email) VALUES ('User', '2','User 2', 'user2@peep.com');
INSERT INTO users (first_name, last_name, user_name, user_email) VALUES ('User', '3','User 3', 'user3@peep.com');

INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('First peep', '2023-03-12 00:00:00', 1);
INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('Second peep', '2023-03-13 00:00:00', 2);
INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('Third peep', '2023-03-14 00:00:00', 1);
INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('Fourth peep', '2023-03-12 00:00:00', 3);
