TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, user_id) VALUES ('First peep on chitter!', '2023-01-11 09:40:00', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Second peep on chitter!', '2023-01-11 09:44:00', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Third peep on chitter!', '2023-01-11 09:46:00', 1);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Here we go!', '2023-01-11 09:49:00', 2);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Great user experience', '2023-01-11 09:51:00', 3);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('How do I use this thing?', '2023-01-11 09:54:00', 4);
INSERT INTO peeps (content, timestamp, user_id) VALUES ('Checking in!', '2023-01-11 09:59:00', 5);

INSERT INTO users (username, email, password) VALUES ('brugalheimer', 'josephburgess@gmail.com', '$2a$12$S5uw4xIHWKxSl8qLpRRsV.HvBwOF9r/7sbdBsWEP432mLxvwizVRK');
INSERT INTO users (username, email, password) VALUES ('eliseboom', 'elise@gmail.com', '$2a$12$gee3hh60cBM7wcXCllw7fOlKsTBay8xncPB8WWomC.Eh8AEFOSS.i');
INSERT INTO users (username, email, password) VALUES ('bearsuit1', 'simon@gmail.com', '$2a$12$BtoZz3CWb99sB3wjeCdWuuwcaZ.hlfK9k1k3BIWsSDF8E1h48Li4W');
INSERT INTO users (username, email, password) VALUES ('totebagfan', 'james@gmail.com', '$2a$12$mgGf1UiKczWYXGbKqdABgOJsOdTnjG8stButdLGhEu3y7iqoS.JHS');
INSERT INTO users (username, email, password) VALUES ('sabcoogs', 'sabrina@gmail.com', '$2a$12$IM3tPO74lAPV0YjNiJnkWe9bXSKcNf59oCrcZ9l7jsKgyw4eUfKh2');
