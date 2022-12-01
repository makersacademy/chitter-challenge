DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    post_time text,
    account_id int4,
    constraint fk_account foreign key(account_id)
      references accounts(account_id)
      on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "post_time", "account_id") VALUES
('Hello world!', '10:00', 1),
('Just ate lol', '13:47', 1),
('Made it to Chitter! Place seems kinda barren so far...', '11:32', 2),
('Yall really prefer this to BookFace? Cmon...', '12:07', 2),
('Booked to go see Metallica live! Yes! 🤘🏻', '17:02', 3),
('My first peep!', '14:10', 4),
('Cant afford Xmas presents now, woops', '18:11', 3),
('I like turtles 🐢🐢🐢', '11:01', 5),
('So psyched for my upcoming holiday! Bring it on! 😆', '15:25', 6),
('So exhausted after a long day coding! 😴', '22:57', 4),
('No but really... what IS the deal with airline food?', '17:12', 7);