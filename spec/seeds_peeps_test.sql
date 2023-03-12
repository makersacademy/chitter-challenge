TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('First peep', '2023-03-12', 1);
INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('Second peep', '2023-03-13', 2);
INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('Third peep', '2023-03-14', 1);
INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('Fourth peep', '2023-03-12', 3);

INSERT INTO users (user_name, user_email) VALUES ('User 1', 'user1@peep.com');
INSERT INTO users (user_name, user_email) VALUES ('User 2', 'user2@peep.com');
INSERT INTO users (user_name, user_email) VALUES ('User 3', 'user3@peep.com');