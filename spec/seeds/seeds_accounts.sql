TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;

INSERT INTO accounts ("email", "username", "password", "name") VALUES
('johnsmith@makers.com', 'jsmith98', 'abc123!!', 'John Smith'),
('benking@makers.com', 'bking98', 'def456??', 'Ben King'),
('chrisbacon@makers.com', 'cbacon98', 'ghi789!!', 'Chris Bacon');