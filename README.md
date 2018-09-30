# Chitter Challenge

In week 4 of the Makers course I was asked to make a basic Twitter clone that allowed users to sign up, log in and out and post "peeps". Users were able to see peeps from other users without having to be signed in. Information was stored in a test database, with passwords securely encrypted with BCrypt and users being unique in both username and email.

## Getting Started

Clone this repo down to your local machine: 
```
git clone git@github.com:TinyGobby/chitter-challenge.git
```
or 
```
git clone https://github.com/TinyGobby/chitter-challenge.git
```

### Prerequisites

Ruby 2.5.0 or greater are required, if needed please install using `rvm install ruby 2.5.1` (ruby 2.5.1 selected as current stable build at time of publishing)


### Installing

All gems are contained within the Gemfile, to install:
```
gem install bundler
bundle install
```

A specific `chitter_test` database is required, paste the below into the command line to setup:

```
psql -c 'create database chitter_test;' 
psql -c "CREATE TABLE users (id SERIAL PRIMARY KEY, password VARCHAR(140), name VARCHAR(60), username VARCHAR(60) UNIQUE, email VARCHAR(60) UNIQUE);"
psql -c "CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(144), time VARCHAR(32), hidden_timestamp TIMESTAMPTZ, user_id INTEGER REFERENCES users (id), user_username VARCHAR(60) REFERENCES users (username));"
```

Once all complete you should be able to run the file using rackup with: `rackup -p 4567` or using ruby with `ruby app/chitter_app.rb`, then when visiting `http://localhost:4567/` in your web browser you should see:

![Screenshot](https://i.imgur.com/BxtZviY.png)

## Running Tests

`cd` into root project folder then use `rspec` to run the tests

Feature tests can either be run alongside the unit tests using `rspec` or alone using `rspec spec/features`

## Features

### Users
##### User Sign Up With BCrypt-Encrypted Password
![Screenshot](https://i.imgur.com/4Vk8zgt.png)
##### Unique Usernane and Email Address Required
![Screenshot](https://i.imgur.com/ELDwnot.png)
##### User Log In
![Screenshot](https://i.imgur.com/2wnFnN6.png)
![Screenshot](https://i.imgur.com/iZCvxI1.png)
##### User Log Out
![Screenshot](https://i.imgur.com/JaxYJRY.png)

### Peeps
##### User Is Able To Peep When Logged In
![Screenshot](https://i.imgur.com/SS0iyVP.png)
![Screenshot](https://i.imgur.com/7qdwFsn.png)
##### Peeps Remain Visible When Logged Out
![Screenshot](https://i.imgur.com/D6BA5VO.png)

## Author

**Patrick Harris** - [TinyGobby](https://github.com/TinyGobby)

## Acknowledgments

Special thanks go to [Makers Academy](http://makers.tech)
