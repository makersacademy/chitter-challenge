TRUNCATE TABLE users, peeps RESTART IDENTITY;

--NOTE: Password will be encrypted using hash algoritm SHA-256
INSERT INTO users (name, username, password, email)
VALUES ('John Doe', 'johndoe', 'password123', 'johndoe@example.com'),
('Jane Smith', 'janesmith', 'abc123', 'janesmith@example.com'),
('Bob Johnson', 'bobj', 'def456', 'bobj@example.com');
