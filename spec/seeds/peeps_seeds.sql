DROP TABLE IF EXISTS albums; 

-- Table Definition
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title text,
    release_year int4,
    artist_id int4
);

TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO albums ("title", "release_year", "artist_id") VALUES
('Doolittle', 1989, 1),
('Surfer Rosa', 1988, 1),
('Waterloo', 1974, 2),
('Super Trouper', 1980, 2),
('Bossanova', 1990, 1),
('Lover', 2019, 3),
('Folklore', 2020, 3),
('I Put a Spell on You', 1965, 4),
('Baltimore', 1978, 4),
( 'Here Comes the Sun', 1971, 4),
( 'Fodder on My Wings', 1982, 4),
( 'Ring Ring', 1973, 2);


