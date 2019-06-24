Chitter Challenge
=================

## Approach

### 1. Research and planning

I decided to use DataMapper to model my database relations.

DataMapper resources used:  
- [official documentation](https://datamapper.org/getting-started.html) 
- [this video tutorial](https://www.youtube.com/watch?v=G93-ZVw_S2c)

I decide not to worry too much about security of my users because implementing registration is a new thing for me so I start with the basics

**CRCs:**

I used my data mapper classes to appropriately plan the database relations. 

### 2. Setup

- added data mapper gems, pg, sinatra etc, ran bundle
- checklist for setting up Ruby projects completed
- added a db.rb with data mapper setup and my CRC models in README 
- testing my db locally
- many failed attempts later, I use [this repo](https://github.com/Rosa-Fox/todo-sinatra-datamapper) and [this resource](http://cheat.errtheblog.com/s/datamapper) to refactor my setup

### 3. Writing the code

I decided not to use TDD for this project, as it adds another level of difficulty. Learning this new tool is my priority, so I leave writing tests for later.

Once my setup seems to work and app racks up, I add a feature test to test rspec implementation.

### 4. To dos/unfinished business

- [ ] add test coverage for features
- [ ] use the database cleaner gem for test db setup
- [ ] no idea if I'd set up the test database correctly - check
- [ ] refactor app.rb to move classes to lib files
- [ ] add unit tests for the above


### Instructions:
-----
1. clone this repo
2. bundle install
3. rackup
4. open in browser at localhost:9292


Features:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```







