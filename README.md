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

![Screenshot](https://www.dropbox.com/s/ghcoctvng3uv9d6/empty_chitter.png?dl=0)

## Running Tests

`cd` into root project folder then use `rspec` to run the tests

Feature tests can either be run alongside the unit tests using `rspec` or alone using `rspec spec/features`

## Features

### Users
##### User Sign Up With BCrypt-Encrypted Password
![Screenshot](https://www.dropbox.com/s/b3zi7izl7v61w3p/sign_up.png?dl=0)
###### Unique Usernane and Email Address Required
![Screenshot](https://www.dropbox.com/s/e56kdl3hmzrtvfl/incorrect_username_or_email.png?dl=0)
##### User Log In
![Screenshot](https://www.dropbox.com/s/v1fke9pn9qxotss/log_in.png?dl=0)
![Screenshot](https://www.dropbox.com/s/1xs84ykw9gwkr9m/logged_in_no_peeps.png?dl=0)
##### User Log Out
![Screenshot](https://www.dropbox.com/s/tuuir28484f5s74/log_out.png?dl=0)

### Peeps
##### User Is Able To Peep When Logged In
![Screenshot](https://www.dropbox.com/s/0m7vxrhpe3l8d5u/peeping.png?dl=0)
![Screenshot](https://www.dropbox.com/s/2044m83bg162vtt/logged_in_with_peeps.png?dl=0)
##### Peeps Remain Visible When Logged Out
![Screenshot](https://www.dropbox.com/s/lvp0oh2lz9in6cj/peeps_not_logged_in.png?dl=0)

## Author

**Patrick Harris** - [TinyGobby](https://github.com/TinyGobby)

## Acknowledgments

Special thanks go to [Makers Academy](http://makers.tech)
