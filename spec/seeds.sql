TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users ("username", "email_address", "password") VALUES
('ShortForCasserole', 'cassius@makers.com', 'HyacinthBucket'),
('User2', 'user2@makers.com', 'user2password'),
('User3', 'user3@makers.com', 'user3password')
;

INSERT INTO peeps ("contents", "timestamp", "user_id") VALUES
('Test peep 1 contents as a string', '00:01', 1),
('Test peep 2 contents, with, plenty, of, commas', '04:11', 1),
('Test peep 3 contents. In two sentences.', '12:30', 1),
('Test peep 4 contents. In three sentences! Groundbreaking', '15:05', 2),
('Test peep 5 contents with 2 integers', '18:43', 2),
('Test peep 6 contents as a string again', '22:20', 3)
;