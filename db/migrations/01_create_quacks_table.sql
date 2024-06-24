
CREATE TABLE cheets(id SERIAL PRIMARY KEY, message VARCHAR(140), display_name VARCHAR(60), time_stamp timestamp default now());

INSERT INTO cheets (message, display_name) VALUES ('Love is strength', 'cheetie');
INSERT INTO cheets (message, display_name) VALUES ('Dream it, be it', 'T0ilet_duck');
INSERT INTO cheets (message, display_name) VALUES ('The last word', 'Duck_Tape');