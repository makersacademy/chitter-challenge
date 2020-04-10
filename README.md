# Chitter Challenge

A small Twitter clone project to practice TDD, OOP, Database Integrated Web Apps.

## User Stories

Must have:

> As a Maker  
> So that I can let people know what I am doing  
> I want to post a message (peep) to Chitter

> As a maker  
> So that I can see what others are saying  
> I want to see all peeps in reverse chronological order

> As a Maker  
> So that I can better appreciate the context of a peep  
> I want to see the time at which it was made

> As a Maker  
> So that I can post messages on Chitter as me  
> I want to sign up for Chitter

Should have:

> As a Maker  
> So that only I can post messages on Chitter as me  
> I want to log in to Chitter

> As a Maker  
> So that I can avoid others posting messages on Chitter as me  
> I want to log out of Chitter

Nice to have:

> As a Maker  
> So that I can stay constantly tapped in to the shouty box of Chitter  
> I want to receive an email if I am tagged in a Peep

> As a Maker  
> In order to start a conversation  
> I want to reply to a peep from another Maker

> As a Maker  
> So that my eyes do not hurt  
> I want the site to be nicely styled

## Additional requirements

- Use the `PG` gem and `SQL` queries to interact with the database.
- You don't have to be logged in to see the peeps.
- Makers sign up to Chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to Chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.
- High test coverage and all tests passing
- Configure Travis,[Travis Basics](https://docs.travis-ci.com/user/tutorial/), [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

## Technical Approach

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
DataMapper

- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

ActiveRecord

- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

## Instructions

_Coming soon_

## Screen Previews

_Coming soon_

## Development Journal

### Development Approach

I approached this project using Test Driven Development strategies:

- Only write the most basic test you need to fail.
- Only write production code to pass a failing test.
- Only write the most basic production code to pass the test.

I approached this project with object oriented programming in mind:

- Objects should encapsulate methods that are related to one another in purpose.
- Methods should have a single responsibility, so they do not do too much, and are concise.

In order to keep code clear and readable, I used rubocop for linting.

### Domain Modelling

I wrote a short CRC card model and an outline of Table Scheme:

![CRC Cards and Table Schema](./images/Chitter_CRC_Table_Schema.png)

### Prepare Testing Infrastructure

- Added Sinatra and Capybara to the gemfile.

- Added testing gems and app file to `spec_helper.rb`, also configures Capybara app.

- Wrote Hello World test to check Sinatra and Capyara all working correctly. Red.

- Created `app.rb` with route for '/' returning Hello World. Green.

### User Stories 1, 2, 3

> As a Maker  
> So that I can let people know what I am doing  
> I want to post a message (peep) to Chitter

> As a maker  
> So that I can see what others are saying  
> I want to see all peeps in reverse chronological order

> As a Maker  
> So that I can better appreciate the context of a peep  
> I want to see the time at which it was made

Core functionality:

- See peeps, newest first
- Each peep has a timestamp
- Post a peep, entering the content

#### Seeing some preloaded peeps

On the home page there should be a list of peeps.

Wrote a feature test to visit '/' and see a list of peeps. Red.

- 
