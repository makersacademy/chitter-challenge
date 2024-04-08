-- seeding tables with test values
TRUNCATE TABLE users, peeps, peeps_users RESTART IDENTITY;

INSERT INTO users (email, password, name, username)
  VALUES ('johnj@gmail.com', 'temppass1', 'John Jr', 'johnj');
INSERT INTO users (email, password, name, username)
  VALUES ('jenny@gmail.com', 'temppass2', 'Jenny Zu', 'jennyzz');
INSERT INTO users (email, password, name, username)
  VALUES ('jj@gmail.com', 'temppass3', 'Jey Jey', 'jjj');

-- reply_to_peep_id of 0 means there is not a reply but a top-level peep
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('Databases are done, yay!', '2022-10-17 10:10:25', 1, 0);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES (
    'But we did not do a graph database, nay.',
    '2022-10-17 10:11:25', 2, 1);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES (
    'But we can do all kinds of stuff without those, yay!',
    '2022-10-17 10:12:25', 1, 2);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES (
    'But trees is what we need for cloning itter, nay',
    '2022-10-17 10:13:25', 2, 3);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('2+2=5', '2022-10-17 10:14:25', 3, 0);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('@jj, deep!', '2022-10-17 10:15:25', 2, 5);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('@jj, indeep!', '2022-10-17 10:16:25', 1, 5);

INSERT INTO peeps_users (peep_id, user_id) VALUES (6, 3);
INSERT INTO peeps_users (peep_id, user_id) VALUES (7, 3);