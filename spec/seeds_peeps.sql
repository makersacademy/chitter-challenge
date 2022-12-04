TRUNCATE TABLE peeps RESTART IDENTITY CASCADE; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (content, time, name, username, user_id) VALUES ('Ed BallS', '07:00 AM', 'Shah', 'shussain', '1');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('im innocent come find me', '10:00 AM', 'SBF', 'SBFFTX', '2');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('IM IN ME MUMS CAR BROOM BROOM', '12:00 PM', 'mobreezy', 'mojd', '3');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('me tariq from rochdale bit barass with my family', '10:00 PM', 'Tariq', 'tariqroch', '4');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('FIRE GREG ROMAN!!', '6:46 PM', 'Lamar', 'LJEra', '5');

TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username) VALUES ('shah@test.com', 'dogwater', 'Shah', 'shussain' );
INSERT INTO users (email, password, name, username) VALUES ('SBF@test.com', 'bahamas', 'SBF', 'SBFFTX');
INSERT INTO users (email, password, name, username) VALUES ('mo@test.com', 'wraith', 'mobreezy', 'mojd');
INSERT INTO users (email, password, name, username) VALUES ('tariq@test.com', 'rochdale', 'Tariq', 'tariqroch');
INSERT INTO users (email, password, name, username) VALUES ('lamar@test.com', 'louisville', 'Lamar', 'LJEra');
