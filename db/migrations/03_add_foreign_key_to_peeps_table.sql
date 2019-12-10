ALTER TABLE peeps ADD user_id INT NOT NULL;

ALTER TABLE peeps
ADD CONSTRAINT constraint_fk FOREIGN KEY (user_id) REFERENCES users (user_id);

INSERT INTO peeps(content, created_at, user_id)
VALUES('Hello World!', NOW(), (SELECT user_id FROM users WHERE user_name = 'Debbie Handler')),
('Pancake Palour has the the best breakfast menu!', NOW(), (SELECT user_id FROM users WHERE user_name = 'Joan Peeler')),
('I just read the most interesting article.', NOW(), (SELECT user_id FROM users WHERE user_name = 'Joan Peeler'));
