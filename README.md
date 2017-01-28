# Chitter Challenge

Implement a disembodied communication system for humans.

## User Stories

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

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Summary of functionality
```
Sign up

Login

Logout

Post a peep

View all peeps reverse order

View time of peeps

Optional extras: reply to peep; css
```

## Set Up

```
$ git clone https://github.com/makersacademy/chitter-challenge
$ bundle
$ create databases chitter_development and chitter_test
$ rake auto_migrate
$ rspec
$ rackup
```

## Pages Summary

Logged in: "You are logged in as <email>" at top + logout link/btn

Not logged in: "Login/register to peep" + login/register link/btn

**signup**
-> **peeps** ...
FAIL -> **signup** + msg + link to **peeps**

**login**
[has: link/btn to **signup**]
-> **peeps** ...
FAIL -> **login** + msg + link to **peep**

**peeps**
[has: **peep** btn/link if logged in]
Displays all peeps in reverse

**peep**
-> **peeps** ...
FAIL ->  **peeps**

## TODO

- location and caching for css files
- feature tests with many expects for efficiency
- use spec helpers appropriately, see code review notes

## Bookmark Reference Work Through

### Skipped / Not relevant

14 Heroku

### Skipped / Still To Do

15 Adding tags - test, erb, model, controller
16 filtering by tag - tests, route patterns, has n update to model
17 multiple tags - tests, controller, use of rakefile on Cmd line
25 Refactor dir structure. Nice to do at end

### Done

08 View peeps - test
09 peeps - model, inc in spec_helper
10 view links - controller, views, modular sinatra  
  todo get all tests to pass with instantiation obj row in test
12 Set up database cleaner
  todo lines 42-45 in spec_helper - may work once data in db?
13 config.ru, DataMapper.setup(...) datamapper_setup, app.rb, spec_helper.rb
18 sign up - tests, model, bcrypt, erb. Confirmation to do
19 Confirmation password - test, view, model and controller
20 confirmation fail - flash message with test, controller, model, view
  todo get email to persist on reload
21 validate blank email - test, view/html5, model/dm required/not null
22 No duplicate blank or invalid emails - test, flash erb update
23 login - tests, erb, controller, model inc fail if wrong password/email
24 logout - tests, flash, controller method override delete

### Current Location

All tests passing, can view peeps.
However unable to instantiate Peep in line 5 of peep_spec yet.
wrt to user stories - 'post a peep'
note did 'view peeps' out of sequence which may not have been easiest

11 set up test and form to create link (ie a peep for us) is next to look at
Issue will be joining User and Peep tables via datamapper so is similar
