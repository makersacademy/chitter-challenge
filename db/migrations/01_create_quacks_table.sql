
CREATE TABLE quacks(id SERIAL PRIMARY KEY, message VARCHAR(140), display_name VARCHAR(60), time_stamp timestamp default now());

INSERT INTO quacks (message, display_name) VALUES ('Love is strength', 'Quackie');
INSERT INTO quacks (message, display_name) VALUES ('Dream it, be it', 'Quackie');
INSERT INTO quacks (message, display_name) VALUES ('The last word', 'Quackie');