TRUNCATE TABLE posts, users RESTART IDENTITY; -- replace with your own table name.

INSERT INTO users (name, username, email_address, password) VALUES ('Harry Potter', 'The boy who lives', 'harrypotter@gmail.com', 'goodday123');
INSERT INTO users (name, username, email_address, password) VALUES ('Ron Weasley', 'Ron.W', 'ronweasley@yahoo.com', 'RupertGrint95');
INSERT INTO users (name, username, email_address, password) VALUES ('Hermione Granger', 'HGranger', 'hermioneg@hotmail.com', 'Expelliarmus');
