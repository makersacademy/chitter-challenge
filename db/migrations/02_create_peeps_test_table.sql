CREATE TABLE peeps(id SERIAL PRIMARY KEY, name VARCHAR(60), handle VARCHAR(60), content VARCHAR(280), time TIME (0) DEFAULT CURRENT_TIMESTAMP);
