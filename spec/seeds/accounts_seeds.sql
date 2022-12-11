DROP TABLE IF EXISTS accounts CASCADE; 

-- Table Definition
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    email text,
    password text,
    name text,
    username text,
    bio text
);

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;

-- The below is specific to the chitter-test database:

INSERT INTO accounts ("email", "password", "name", "username", "bio") VALUES
('johndoe@mail.com', '$2a$12$H0fzYrMeXHkB3G7wulcOr.KvwC1rVrZPaGgrIgesjn4QVIjAmqHeW', 'John Doe', 'johndoe1234', 'Hi, my name is John'),
('bobby-b@ntl.co.uk', '$2a$12$4V.uAXDTozZPC/2rP9OvFeyNpns8ZTUI0rO3CDWWOMQPkIFUURx/2', 'Bob Bob', 'newtothis', 'Why do I need to do this?'),
('trooper666@aol.com', '$2a$12$4m5fG6XlgzZSu.yHKFqXrOPHhFEWW.JuZgxieYPdt1tJPV1h3jQAW', 'Taylor Black', 'headbanger666', 'Keep on rockin in the free world'),
('juniordev@outlook.com', '$2a$12$LLnjEx5t5UhvURYKycDTTeW38ncxX16Ylz8QrAPncGOn6tYZFA15y', 'Dan Delorian', 'developer92', 'Ruby is my passion'),
('turtles@msn.com', '$2a$12$Wpn03jtp9mgIrwtLRtB0Jeh/syUdgXNZbvhczNAOcpQnPQiRDXoaa', 'Jason Turturro', 'TurtleGuy', 'I REALLY like turtles'),
('travel4ever@gmail.com', '$2a$12$llLqc7NKNXTZfj00F9/Ps.zknCQcRsix8qvMIyiaOhSrEhpG3LdzG', 'Clara Viajera', 'global_roamer22', 'Always on the move'),
('seinfeld_fan@msn.com', '$2a$12$ZrA/HZiaEzroY0oO/6UMKuAjzJ1Wy.OtalZSNIlR3zz08/SZzCY9q', 'Seinfeld Seinfeld', 'seinfeld_bot', 'Comedy bot');