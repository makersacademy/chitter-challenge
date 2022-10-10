TRUNCATE TABLE users, peeps RESTART IDENTITY CASCADE; 

INSERT INTO users (username, password, name, email) VALUES ('matthewknows', 'Matthew1234', 'Matthew Matthew', 'matthew@matthews.com');
INSERT INTO users (username, password, name, email ) VALUES ('markknows', 'Mark1234', 'Mark Mark', 'mark@marks.com');



INSERT INTO peeps (content, date, id) VALUES ('Anybody there?', '2022-01-01 08:00:00:00', 1);
INSERT INTO peeps (content, date, id) VALUES ('Yes, I am here.','2022-01-02 09:00:00:00', 2);
INSERT INTO peeps (content, date, id) VALUES ('Great. Love that.', '2022-01-01 10:00:00:00', 1);