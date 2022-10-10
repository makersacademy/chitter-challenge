DROP TABLE IF EXISTS users, peeps;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username text,
    password text,
    name text,
    email text
);

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    creation_date timestamp,
    
    user_id int,
    constraint fk_user foreign key (user_id)
    references users(id)
    on delete cascade
);

-- Users --
INSERT INTO users (username, password, name, email)
    VALUES ('JarJar', 'Password23', 'JarJar Binks', 'JJBinks12@gmail.com');

INSERT INTO users (username, password, name, email)
    VALUES ('HanSwollo', 'p3ssworD', 'Han Solo', 'Millenium_Falcon@gmail.com');

INSERT INTO users (username, password, name, email)
    VALUES ('Ken_Benobi', 'hello_there!', 'Obi-Wan Kenobi', 'highGround7@gmail.com');

INSERT INTO users (username, password, name, email)
    VALUES ('Heisenberg', 'roof_pizza', 'Walter White', 'walter.white@yahoo.com');

INSERT INTO users (username, password, name, email)
    VALUES ('JarJarSecond', 'Password32', 'SithLord Binks', '12BinksJJ@gmail.com');

-- Peeps --
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Jar Jar Noises', '2022-10-07', 1);
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Millions will be starvin and dyin without your help.', NOW(), 1);
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Ex-squeeze me, but the mostest safest place would be Gunga city.', NOW(), 1);
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('If those droids attackin us, padmes probably in trouble.', NOW(), 1);

INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Lets keep a little optimism here.', NOW(), 2);
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Great shot, kid, that was one in a million.', NOW(), 2);
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Its not wise to upset a Wookie.', NOW(), 2);

INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Hello there', NOW(), 3);

INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('Jesse, we need to cook...', NOW(), 4);
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('We need to cook..', NOW(), 4);
INSERT INTO peeps (content, creation_date, user_id)
    VALUES ('JESSE! HEY JESSE.. WE NEED TO COOK!', NOW(), 4);
