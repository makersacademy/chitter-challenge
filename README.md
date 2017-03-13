Chitter Challenge
=================

Features:
=========

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Technologies Used:
==================
- DataMapper
- DataMapper(timestamps)
- SQL/postgres
- Sinatra
- Rspec
- Database Cleaner
- Capybara
- Rake
- HTML
- Flash

How to use
==========
To use chitter please do the following:

```
$ git clone git@github.com:ayanit1/chitter-challenge.git
$ cd chitter-challenge
$ run 'bundle'
$ run 'rackup'
```
Make sure you sign up and you can then post peeps.

If I had more time
==================
- Validation of forms. Make sure name only contains letters, email_address have an "@" sign
- Users are unable to create an account with the same email address. Username cannot be the same as email address.
- Password recovery. If user loses/forgets their password
- Use rake/rakefiles to refactor datamapper tasks like upgrade and migrate database methods
- Didn't know how to test for a time constraint
- Testing for edge casing
- Add buttons for users to move throughout pages
- Instead of peep Id have username
- Ensure assest routes are set correctly
- Make feature test more unlike unit tests
- Refactor routes into separate controller files
- Use module for my helper in app.rb file
- Use placeholder in html and remove labels
