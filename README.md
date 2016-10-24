Chitter Challenge
=================

This is a basic functional recreation of Twitter whereby users can sign-up to the service and post 'peeps'. Peeps are shown on the homepage in most recent order, along with the name and username of the user who posted it, and the date and time.

Technologies used
------------------
It was written in Ruby using the Sinatra MVC framework. I used the object-relational mapper, DataMapper, to communicate with a Postgres database. User passwords are encrypted and authenticated using BCrypt. I test-drove the development using RSpec/Capybara.

Instructions
-----------
To install, go to the directory of your choice and follow these instructions:
```
$ git clone git@github.com:francesmx/chitter-challenge.git
$ cd chitter-challenge
$ bundle
```
If you want to, you can view test coverage:
```
$ rspec
$ coveralls report
```
To play with the app using the web interface, start the server:
```
$ rackup
```
then visit  [http://localhost:9292/](http://localhost:9292/) in your browser.

Screenshots
------------
![Homepage (not logged in)](http://i.imgur.com/iisz0yq.png)

![Sign-up](http://i.imgur.com/7sBgMSu.png)

![Log-in](http://i.imgur.com/thn4xCb.png)

![Homepage (logged in)](http://i.imgur.com/o2OCAG6.png)

Features:
-------

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

Approach
---------
1. Setup the environment, including Sinatra, RSpec, Capybara, Postgres, BCrypt and DataMapper
2. Initialised using rspec-sinatra, setup the folder structure, ran bundle.
3. Wrote and passed tests for user sign-up.
4. Wrote and passed tests for user log-in.
5. Wrote and passed tests for user log-out.
6. Realised that user sign-up needs to include a unique username. Wrote and passed tests for this.
7. Wrote and passed tests for posting a peep.
8. Wrote and passed tests for including timestamp on peep. Included "ordering by the 'created at' timestamp" with the Peeps database query so that peeps would appear in order (wasn't sure how to write a test for this - presumably using TimeCop?)
9. Wrote and passed tests for including username on peep.
10. Realised that user sign-up needs to include an actual name. Wrote and passed tests for this.
11. Refactored to extract controllers.

Somewhere along the line I managed to break my local coveralls reporting so I was unable to view my test coverage. I still have no idea how to fix this. The stack trace didn't really help me!

Next steps
----------
I would like to apply CSS to improve the presentation, introduce new features, such as 'reply' or 'like' and profile pictures for users, and also deploy it to Heroku so it doesn't require local installation.
