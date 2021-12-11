Setup
----
```
psql
CREATE DATABASE chitter;
CREATE TABLE peeps (id SERIAL PRIMARY KEY, message VARCHAR(280) NOT NULL, timestamp int);

Usage
----
```
git clone '''
cd chitter-challenge
bundle install
rackup
```