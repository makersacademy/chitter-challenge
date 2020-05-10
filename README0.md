Database Set Up:

1. CREATE DATABASE chitter_test;
2. CREATE DATABASE chitter

For both:

3. CREATE TABLE peeps(ID SERIAL PRIMARY KEY, username VARCHAR(50), peep VARCHAR(200),
dateTime VARCHAR(40));
4. CREATE TABLE profile(username VARCHAR(60), name VARCHAR(60), email VARCHAR(100),
password VARCHAR(60));
