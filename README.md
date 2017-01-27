# Chitter Challenge

Disembodied communication system for humans.

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

### Skipped / Still To Do

09 set up datamapper table object (link in this case)
10 And set erb in relation to viewing links
11 set up test and form to create link (ie a peep for us)
15 Adding tags - test, erb, model, controller
16 filtering by tag - tests, route patterns, has n update to model
17 multiple tags - tests, controller, use of rakefile on Cmd line

### Done

12 Set up database cleaner
  todo lines 42-45 in spec_helper - may work once data in db?
13 config.ru, DataMapper.setup(...) datamapper_setup, app.rb, spec_helper.rb
14 Heroku

### Current Location

18 signing up
