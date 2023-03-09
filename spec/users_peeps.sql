TRUNCATE TABLE users_peeps RESTART IDENTITY; 

INSERT INTO users_peeps (user_id, peep_id) VALUES (1,2);
INSERT INTO users_peeps (user_id, peep_id) VALUES (1,3);
INSERT INTO users_peeps (user_id, peep_id) VALUES (2,1);
INSERT INTO users_peeps (user_id, peep_id) VALUES (2,3);
INSERT INTO users_peeps (user_id, peep_id) VALUES (3,1);