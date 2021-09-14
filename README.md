Chitter Challenge
=================
Makers Week 4 Solo Weekend Challenge - build a Twitter Clone!

User Stories:
-------

```

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

## Technologies used:
  * Ruby
  * HTML
  * PostgreSQL
  * RSpec (unit testing)
  * Capybara (feature testing)
  * Sinatra & Rack 

## Screenshot
![Screenshot 2021-09-14 at 19 10 47](https://user-images.githubusercontent.com/79845719/133311326-ec1ebe60-d7a4-4b93-b446-0368b6900962.png)

## Installation

### To clone the repo
```shell
$ git clone https://github.com/jen0828/chitter-challenge.git
$ cd chitter-challenge
```

### To set up the database

Connect to `psql` and create the `chitter` and `chitter_test` databases:
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```

### To run the Chitter app

Start the server in the terminal using:
```
rackup
```

### To run tests:

```
rspec
```

