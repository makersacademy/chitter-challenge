Chitter Challenge - Author Harsheet Patel
[![Build Status](https://travis-ci.org/hkp108/chitter-challenge.svg?branch=master)](https://travis-ci.org/hkp108/chitter-challenge
[![Coverage Status](https://coveralls.io/repos/github/hkp108/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/hkp108/chitter-challenge?branch=master)

=================

Instructions
-------
Chitter is a little Twitter clone that will allow the users to post messages to a public stream. Users can sign up in order to post peeps (messages) that will be displayed on the chitter feed page (public).

1. Running the app using local server
  1. Clone repo ```git clone URL```
  2. Run ```bundle```
  3. Configure database
    -Install postgres SQL database if not using remote database
    -Configure the Data Mapper settings in `app/data_mapper_setup.rb` to point to your database
  4. Run the app ```ruby app/app.rb``` to start the server.
  5. In web browser, type `localhost:port` where port is the port number specified when starting web server.
  6. Peep away

2. Running the app on remote server e.g. heroku
  1. Upload/push repo to the remote server
  2. Ensure postgres database is set up, or `ENV['DATABASE_URL']` points to your production database
  3. Check out the current version of this project on heroku: http://chitter-.heroku.com

Features:
-------

```sh
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


This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.
