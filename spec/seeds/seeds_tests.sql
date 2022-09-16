TRUNCATE TABLE peeps, users, peeps_users RESTART IDENTITY;

INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Hello, I am Wendy!', '2022-01-01 01:01:01', 'Wendy', 'wendy0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('I am named after Bon Jovi...', '2022-02-02 02:02:02', 'Jovi', 'jovi0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('How YOU doin?', '2022-03-03 03:03:03', 'Joey', 'joey0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Could I BE more sorry?', '2022-04-04 04:04:04', 'Chandler', 'chandler0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('You at my sandwhich?!', '2022-05-05 05:05:05', 'Ross', 'ross0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Princess Consuela Bananahammock', '2022-06-06 06:06:06', 'Phoebe', 'phoebe0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('I got off the plane.', '2022-07-07 07:07:07', 'Rachel', 'rachel0');
INSERT INTO peeps (content, date_time, user_f_name, user_handle) VALUES ('Does anybody care what kind of potatoes I want!?', '2022-08-08 08:08:08', 'Monica', 'monica0');

INSERT INTO users (email, password, f_name, handle) VALUES ('wendy0@example.com', 'password123', 'Wendy', 'wendy0');
INSERT INTO users (email, password, f_name, handle) VALUES ('jovi0@example.com', 'password123', 'Jovi', 'jovi0');
INSERT INTO users (email, password, f_name, handle) VALUES ('joey0@example.com', 'password123', 'Joey', 'joey0');
INSERT INTO users (email, password, f_name, handle) VALUES ('chandler0@example.com', 'password123', 'Chandler', 'chandler0');
INSERT INTO users (email, password, f_name, handle) VALUES ('ross0@example.com', 'password123', 'Ross', 'ross0');
INSERT INTO users (email, password, f_name, handle) VALUES ('phoebe0@example.com', 'password123', 'Phoebe', 'phoebe0');
INSERT INTO users (email, password, f_name, handle) VALUES ('rachel0@example.com', 'password123', 'Rachel', 'rachel0');
INSERT INTO users (email, password, f_name, handle) VALUES ('monica0@example.com', 'password123', 'Monica', 'monica0');

INSERT INTO peeps_users (peep_id, user_id) VALUES (1, 1);
INSERT INTO peeps_users (peep_id, user_id) VALUES (2, 2);
INSERT INTO peeps_users (peep_id, user_id) VALUES (3, 3);
INSERT INTO peeps_users (peep_id, user_id) VALUES (4, 4);
INSERT INTO peeps_users (peep_id, user_id) VALUES (5, 5);
INSERT INTO peeps_users (peep_id, user_id) VALUES (6, 6);
INSERT INTO peeps_users (peep_id, user_id) VALUES (7, 7);
INSERT INTO peeps_users (peep_id, user_id) VALUES (8, 8);