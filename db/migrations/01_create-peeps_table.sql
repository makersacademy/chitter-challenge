#chitter_peeps & chitter_peeps_test
CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(30), peep VARCHAR(100), time VARCHAR(40));

#chitter_users & chitter_users_test
CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(50), handle VARCHAR(30), email VARCHAR(50), password VARCHAR(30));
