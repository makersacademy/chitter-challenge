CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, content VARCHAR (140) NOT NULL, posttime TIMESTAMPTZ, author_id INTEGER REFERENCES users (user_id));



-- CREATE TABLE peeps (peep_id SERIAL PRIMARY KEY, content VARCHAR (140) NOT NULL, posttime TIME(HH:MI), postdate TO_CHAR(NOW() :: DATE, 'dd/mm/yyyy'), author_id INTEGER REFERENCES users (user_id));