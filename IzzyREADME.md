```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

1. Set up table with SQL command (01_create_chitter_table)
```
CREATE DATABASE chitter;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, url VARCHAR(140));
```
2. Repeat for test table
```
CREATE DATABASE chitter_test;
CREATE TABLE peeps(id SERIAL PRIMARY KEY, url VARCHAR(140));
```