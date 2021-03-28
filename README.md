# Chitter Challenge [![Build Status](https://travis-ci.com/StuBehan/chitter-challenge.svg?branch=master)](https://travis-ci.com/StuBehan/chitter-challenge) [![codebeat badge](https://codebeat.co/badges/cc0ac69e-fe52-41bf-85d4-e9a4f9aa71e0)](https://codebeat.co/projects/github-com-stubehan-chitter-challenge-master)


~~Content comming soooon!~~

## Instructions:

1. clone to your system
2. run `bundle install`
3. download and install [postgresql](https://www.postgresql.org/) for your system
4. do `psql postgres`, then `\i ./db/migrations/chitter_db.sql` to load the schema
5. you can then run the app `ruby app.rb`
6. head to `127.0.0.1:4567` to take a look around
7. you can preseed the db tables by using `irb` and the file `./spec/test_helper.rb`


## Ok here it is:

### STRAIGHT UP <img align="right" width="250" src="./docs/chitter-db-tables.png">

- [X] I want to post a message (peep) to chitter

- [X] I want to see all peeps in reverse chronological order

- [X] I want to see the time at which it was made

- [X] I want to sign up for Chitter

### HARDER

- [X] I want to log in to Chitter

- [X] I want to log out of Chitter

### ADVANCED

- [ ] I want to receive an email if I am tagged in a Peep

So I nearly got there, but I spent so much time on the CSS and making the reply feature work that I ran out of time to finish the email part of it. I kinda got halfway there with it though, as I made the 'tagged in a Peep' bit work!