![RPS Logo](public/img/logo.jpg)

Chitterz
========

A little Twitter clone that allows users to post messages to a public stream

Sign up online at https://chitterz.herokuapp.com/users/new

Objectives of exercise
----
Build a web app that uses a database

Technologies used
----
- Sinatra
- Ruby
- Postgres
- Data Mapper

How to use
----
- To sign up:             https://chitterz.herokuapp.com/users/new
- To log in:              https://chitterz.herokuapp.com/sessions/new
- To view peeps:          https://chitterz.herokuapp.com/peeps
- To create a peep:       https://chitterz.herokuapp.com/peeps/new
- To filter peeps by tag: https://chitterz.herokuapp.com/tags/(tag_name)

Tested using:
----
- Capybara
- RSpec

How to run tests
----
```sh
$ cd chitter-challenge
$ rspec
```

User stories:
-------

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
