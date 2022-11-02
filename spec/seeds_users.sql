TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (name, username, email, password) VALUES ('David Jones', 'Jonesy41', 'dave@chittermail.com', 'davelovescats');
INSERT INTO users (name, username, email, password) VALUES ('Katy Smith', 'KatieKat', 'kate@chittermail.com', '1234');
INSERT INTO users (name, username, email, password) VALUES ('Lauren Brown', 'Lilauren', 'lauren@chittermail.com', 'laurenspassword');
INSERT INTO users (name, username, email, password) VALUES ('Will Smith', 'Smithy', 'will@chittermail.com', 'will43');
INSERT INTO users (name, username, email, password) VALUES ('Megan Herbert', 'Megs', 'meg@chittermail.com', 'meglikesdogs');