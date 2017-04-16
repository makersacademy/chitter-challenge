Chitter
=================

Message posting board / Twitter clone - written over the weekend of my fourth week at Makers Academy.

#### Instructions for use:
- Clone this repo
- Run ```bundle``` to install dependencies
- Run ```rspec``` to view tests
- If you don't already have PostgreSQL, use homebrew to install it ```brew install postgresql```
- To create databases:
```
$ createdb chitter_development
$ createdb chitter_test
```
- Run ```rackup``` to auto-upgrade and start server
- In your browser, visit http://localhost:9292/

---

#### Technologies used:
- Ruby
- Sinatra
- RSpec
- Capybara (for feature testing browser tasks)
- DataMapper (a Ruby ORM)
- BCrypt (for password hashing)
- PostgreSQL (a relational DBMS)


![Sign in](https://github.com/rorymcgit/chitter-challenge/blob/master/Chitter_signin.png)  
![Post peep](https://github.com/rorymcgit/chitter-challenge/blob/master/Chitter_postpeep.png)  



## User Stories:
```
As a Maker,
So that I can post messages on Chitter as myself,
I want to sign up for Chitter.

As a Maker,
So that I can post messages on Chitter as myself,
I want to log in to Chitter.

As a Maker,
So that I can avoid others posting messages on Chitter as me,
I want to log out of Chitter.

As a Maker,
So that I can let people know what I am doing,
I want to post a message (peep) to chitter.

As a Maker,
So that I can see what others are saying,
I want to see all peeps in reverse chronological order.

As a Maker,
So that I can better appreciate the context of a peep,
I want to see the time at which it was made.
```
