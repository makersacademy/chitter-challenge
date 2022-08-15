DROP TABLE IF EXISTS users, peeps;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email text,
    name text,
    username text,
    password text
);

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    timestamp timestamp,
    user_id int,
    constraint fk_user foreign key(user_id) references users(id) on delete cascade
);


TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users (email, name, username, password) VALUES ('hulksmash@gmail.com', 'John', 'bighulk', 'nicesmash');
INSERT INTO users (email, name, username, password) VALUES ('blackwidow@yahoo.com', 'Alicia', 'spiderspider', 'night123');
INSERT INTO users (email, name, username, password) VALUES ('ironman@aol.com', 'Tony', 'starkent', 'love3000');

INSERT INTO peeps (content, timestamp, user_id) VALUES ('The bank has increased the interest rate', '2022-07-28 16:00:32', 2);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Donald Trump is giving a speech', '2022-07-29 18:24:32', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Joe Biden talks about inflation', '2022-07-30 21:00:01', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('What is with the weather', '2022-07-31 22:50:10', 2);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Listening to Adele new song', '2022-08-01 07:11:39', 2);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Bought a new coffee machine', '2022-08-02 19:00:21', 3);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Going for yoga soon', '2022-08-05 16:01:17', 3);



