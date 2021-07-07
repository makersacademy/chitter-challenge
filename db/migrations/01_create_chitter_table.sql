CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(60), peep VARCHAR(140), lastmodified timestamp default CURRENT_TIMESTAMP);


CREATE TABLE users (id SERIAL PRIMARY KEY, user_name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), user_password VARCHAR(140));