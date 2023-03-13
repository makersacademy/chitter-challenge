TRUNCATE TABLE makers, peeps RESTART IDENTITY;

INSERT INTO makers (name, username, email_address, password) VALUES ('Jim Slick','Jimbo', 'jimbo94@makersacademy.com', 'password123');
INSERT INTO makers (name, username, email_address, password) VALUES ('Flash Gordon','Flash', 'flashgordon@makersacademy.com', 'password789');

INSERT INTO peeps (timestamp, content, maker_id) VALUES ('2023-03-13 04:50:51', 'Are birds weather?', 1);
INSERT INTO peeps (timestamp, content, maker_id) VALUES ('2023-03-13 04:52:59', 'How much string is there in the world?', 2);