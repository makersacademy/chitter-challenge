TRUNCATE TABLE peeps RESTART IDENTITY; 

INSERT INTO peeps (message, time_of_peep, peeper_id) VALUES ('Skipping through water', '11/07/2017 18:11', '1' );
INSERT INTO peeps (message, time_of_peep, peeper_id) VALUES ('Another day on the tractor', '11/08/2017 20:00', '2' );
INSERT INTO peeps (message, time_of_peep, peeper_id) VALUES ('Bobo got his medal', '07/08/2020 20:00', '3' );

TRUNCATE TABLE peepers RESTART IDENTITY; 

INSERT INTO peepers (username, password, email) VALUES ('Mandy', 'pawsword', 'mandyp@example.com');
INSERT INTO peepers (username, password, email) VALUES ('Dazzy Dave', '123Beep', 'dazzy@example.com');
INSERT INTO peepers (username, password, email) VALUES ('Laughing Lorenzo', 'Italyrocks', 'loveitaly@example.com');
