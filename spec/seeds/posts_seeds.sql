TRUNCATE TABLE users, posts RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO users (username, name, email, password) VALUES ('harry_styles', 'Harry Styles', 'harry_styles@email.co.uk', 'cherry');
INSERT INTO users (username, name, email, password) VALUES ('taylor_swift', 'Taylor Swift', 'taylor_swift@email.com', 'red');
INSERT INTO users (username, name, email, password) VALUES ('billie_eillish', 'Billie Swift', 'billie_eillish@email.com', 'bored');

INSERT INTO posts (content, time_posted, user_id) VALUES ('watermelon sugar', '2022-03-10 09:30:00+00', 1);
INSERT INTO posts (content, time_posted, user_id) VALUES ('baby you are the love of my life', '2022-04-12 00:36:00+01', 1);
INSERT INTO posts (content, time_posted, user_id) VALUES ('all too well', '2022-05-14 04:00:00+01', 2);
INSERT INTO posts (content, time_posted, user_id) VALUES ('you got the cinema', '2022-05-20 11:26:00+01', 1);
INSERT INTO posts (content, time_posted, user_id) VALUES ('i just wanna watch tv', '2022-06-23 09:18:00+01', 3);
INSERT INTO posts (content, time_posted, user_id) VALUES ('tear drops on my guitar', '2022-07-13 07:14:00+01', 2);
INSERT INTO posts (content, time_posted, user_id) VALUES ('you really know how to make me cry', '2022-10-21 00:29:00+01', 3);
