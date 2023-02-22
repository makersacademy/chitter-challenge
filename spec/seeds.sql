TRUNCATE TABLE messages RESTART IDENTITY CASCADE; 
TRUNCATE TABLE users RESTART IDENTITY CASCADE; 


INSERT INTO users (username, email_address, password, full_name) VALUES ('Bloggy_J', 'joe_blogs@gmail.com', 'sxdfhcgjvhk2342','Joe_Bloggs');
INSERT INTO users (username, email_address, password, full_name) VALUES ('The_Migster', 'm_miggins@hotmail.com', '&gfdklwr3', 'Mrs_Miggins');
INSERT INTO users (username, email_address, password, full_name) VALUES ('Schmoe123', 'j_schmoe@gmail.com', '7gyhd88gg4', 'Joe_schmoe');
INSERT INTO users (username, email_address, password, full_name) VALUES ('not_elon', 'Meelon@tesla.com', '1filNfdvc£','Meelon Musk');


INSERT INTO messages (content, time_posted, user_id) VALUES ('Here is a slightly longer peep that I have created', '2022-11-01 14:50:00', '2');
INSERT INTO messages (content, time_posted, user_id) VALUES ('This is a short post', '2022-12-01 19:10:25', '1');
INSERT INTO messages (content, time_posted, user_id) VALUES ('Here is an even longer peep, to deemonstrate how a much longer post may look when stored in my chitter database. Some posts may be even longer!', '2022-07-01 08:10:00', '3');