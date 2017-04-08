# Domain Models

### Key steps:
1. Set up / TDD(RSpec)
a) Install data_mapper and dm-postgres-adapter
b) Added rspec, capybara, rack in Gemfile
c) Added 'capybara/rspec' to spec_helper
d) Set up rack and required all files
Set up testing and development environments
f) Added Database Cleaner
g) Deployed Heroku
h) Extracted datamapper setup

2. Welcome to Chitter!

Sign up (email, password, name and username)
- Registration
- User name and email must be unique
- User BCrypt to secure passwords


3. Log in
4. Log out
5. Peep (post message)
- Name of maker and user handle
- Don't have to be logged in to see other's peeps
- You can only peep when you're logged in
6. Peeps in chronological order
7. Time which peep was made

### Key parts:
1. TDD
2. DataMapper and Postgres to save data
3. Update README.md

### User Story 1

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

### User Story 2

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

### User Story 3

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

### User Story 4

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

### User Story 5

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

### User Story 6

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
