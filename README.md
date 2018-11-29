Chitter Challenge
=================

A Twitter clone built using Sinatra, Datamapper and PostgreSQL.

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

## Technologies used

- [Sinatra](http://sinatrarb.com/intro.html)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Datamapper](https://datamapper.org/)
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
- [RSpec](https://github.com/rspec/rspec)
- [Capybara](https://github.com/teamcapybara/capybara)
