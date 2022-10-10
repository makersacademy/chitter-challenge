TRUNCATE users, peeps RESTART IDENTITY;


INSERT INTO users (email, username, fullname, password) VALUES ('peppermint@tea.com', 'peppermint1990', 'Peppermint Tea', 'PePPERM1nt');
INSERT INTO users (email, username, fullname, password) VALUES ('redbush@tea.com', 'RedBushRockz', 'Red Bushtea', 'BanAna21');
INSERT INTO users (email, username, fullname, password) VALUES ('sleep@naptime.com', 'sleepy', 'Silent Night', 'Sw33tDreams');
INSERT INTO users (email, username, fullname, password) VALUES ('hayley@kiyoko.com', 'hkiyoko', 'Hayley Kiyoko', 'b3ccaRulez');

INSERT INTO peeps (message, timestamp, user_id) VALUES ('Peppermint tea is the best', '2022-10-10 03:00:00', '1');
INSERT INTO peeps (message, timestamp, user_id) VALUES ('Seriously, peppermint tea is the best', '2020-11-10 05:03:23', '1');
INSERT INTO peeps (message, timestamp, user_id) VALUES ('No @peppermint1990, Red Bush tea is the best', '2022-10-10 06:00:22', '2');
INSERT INTO peeps (message, timestamp, user_id) VALUES ('Get at least 8 hours of uninterrupted sleep', '2022-12-10 10:21:21', '3');
INSERT INTO peeps (message, timestamp, user_id) VALUES ('Listen to my new album', '2022-09-09 00:02:21', '4');
INSERT INTO peeps (message, timestamp, user_id) VALUES ('How many hours did you sleep?', '2021-11-11 00:00:00', '3');
INSERT INTO peeps (message, timestamp, user_id) VALUES ('Get tickets for my new tour', '2022-10-10 00:00:00', '3');

