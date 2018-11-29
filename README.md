Chitter Challenge
=================

A Twitter clone built using Sinatra, Datamapper and PostgreSQL.

[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

### Screenshots

![chitter homepage screenshot](/public/images/homepage.png)
![chitter peeps screenshot](/public/images/peeps.png)
![chitter log-in screenshot](/public/images/log-in.png)
![chitter sign-up screenshot](/public/images/sign-up.png)

### User Stories
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
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
### Installation

Download or clone the repository to your local machine. Then run `bundle` to make sure you have all the necessary dependencies installed.

```
$ git clone https://github.com/tomasdoh/chitter_challenge
$ bundle
```

### Usage

Create a database and then use `rackup` to run a local server.
```
$ createdb chitter
$ rackup
```

### Approach

I decided to use Datamapper ORM for this challenge, both so that I could understand how an ORM design pattern works in practice and so that the code required to interact with database could be kept to a minimum.
Some of the challenges I encountered:

- It was difficult to get all of the dependencies working together. The default json gem (2.1) was conflicting with DataMapper 1.2. In the end I had to use json 1.8.6.
- Initially I wasn't using a test database and instead used Database Cleaner to ensure any test data was removed after each test. I've now implemented the use of a test database along with Database Cleaner.
- I didn't use unit tests for the User and Peep classes during the development of the application as I wasn't sure how to test DataMapper. I've since used some [specific RSpec matchers](https://github.com/greyblake/dm-rspec) for DataMapper.
- I found it challenging to get the authentication system working with an encrypted password without any clear guidance on how to implement this using DataMapper. I did find a solution in the end and the system now works consistently.

## Technologies used

- [Sinatra](http://sinatrarb.com/intro.html)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Datamapper](https://datamapper.org/)
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
- [RSpec](https://github.com/rspec/rspec)
- [Capybara](https://github.com/teamcapybara/capybara)
