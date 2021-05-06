[![Build Status](https://travis-ci.com/kerisic/chitter-challenge.svg?branch=master)](https://travis-ci.com/kerisic/chitter-challenge)

Chitter Challenge
-------

This is a twitter clone that implements the below user stories and features. Written in Ruby, the app is run by Sinatra and while its database is managed by postgresql. Users can sign up - posting a 'peep' is only possible while logged in. Each peep consists of a message, the name and username of the poster, and the time it was posted.

<img src="https://user-images.githubusercontent.com/71288920/109436561-fcdb5080-7a17-11eb-9692-3cfadee05019.gif" width='600'>

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

Install
-------
- Fork this repo
- `bundle install`
- Connect to `psql`
- Create databases and tables according to queries stored in db/migrations/01_create_peep_database_and_tables.sql
- Run `rackup` to see app on local server - http://localhost:9292/peeps
