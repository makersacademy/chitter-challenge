### How to set up data bases

###How to Install and setup a database###

##You will need these gems:

- gem 'bcrypt'
- gem 'capybara'
- gem 'pg'
- gem 'rake'
- gem 'rspec'
- gem 'rubocop', '0.71.0'
- gem 'sinatra'
- gem 'sinatra-flash'

##Installing postgres
```
$ brew install postgresql
$ brew services start postgresql
$ psql postgres
```

##Creating database and tables
```
$ CREATE DATABASE "chitter";
$ \c chitter 
$ CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(60),
$ email VARCHAR(60), name VARCHAR(60), password  VARCHAR(120));
$ CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(240), user_id VARCHAR(10), time VARCHAR(60));
$ CREATE DATABASE chitter_test WITH TEMPLATE chitter;
```

## to run tests 
``` 
$ rspec
```