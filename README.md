Chitter Challenge
=================

## User Stories
#### Completed
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

```
#### Not complete
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
## Approach

I decided to use Datamapper ORM for this challenge, both so that I could understand how an ORM design pattern works in practice and so that the code required to interact with database could be kept to a minimum.

Some of the challenges I encountered:

- Initially it was difficult to get all of the dependencies working together (in the end I had to use Sinatra 1.4.8 and json 1.8.6).
- I didn't use a test database and instead used Database Cleaner to ensure any test data was removed after each test. However, I'm not sure it's working as it should be right now.
- I didn't use unit tests for the User and Peep classes as I wasn't sure how to test DataMapper. I've since come across some [specific RSpec matchers](https://github.com/greyblake/dm-rspec) for DataMapper and will try to implement them.
- I ran out of time to implement a fully functioning authentication system, including encrypted password.

## Technologies used

- [Sinatra](http://sinatrarb.com/intro.html)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Datamapper](https://datamapper.org/)
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
- [RSpec](https://github.com/rspec/rspec)
- [Capybara](https://github.com/teamcapybara/capybara)

## Installation instructions

```
$ git clone https://github.com/tomasdoh/chitter_challenge
$ bundle
$ rspec
$ rackup
```
