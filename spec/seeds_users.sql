TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (name, user_name, email, password) VALUES ('Harry Potter', 'lightning-boy', 'harry@hogwarts.com', 'scarhead1234');
INSERT INTO users (name, user_name, email, password) VALUES ('Ron Weasley', 'gingernut', 'ron@hogwarts.com', 'redhead4eva');
INSERT INTO users (name, user_name, email, password) VALUES ('Hermione Granger', 'clever-cloggs', 'herminone@hogwarts.com', 'best-in-class');