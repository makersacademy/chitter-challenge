Chitter - Maker Challenge \# 4
=======================

## Synopsis
Make a Twitter clone

## Technologies Used
- ruby
- sinatra
- postgreSQL
- rspec
- travis ci
- rubocop
- simplecov

## To run this project

git clone <repo>
bundle install
create postgreSQL database chitter_development
rake auto_migrate
ruby ./app/chitter.rb

## User stories

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

## Functional representation

Objects  | Messages
------------- | -------------
`maker` |
`website` | `sign in`, `sign out`, `sign up`,
`message` | `post`, `view reverse chronological`, 'time'

## Job List

- [Refactor controller]
- [CSS/make beautiful ]
- [ ]
- [ ]

## Still to complete/refactor

- [ ]
- [ ]
