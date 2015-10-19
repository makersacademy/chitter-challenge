Challenge:
-------

* Create a Twitter clone web app (Chitter) that allows the users to post messages to a public stream.

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

How to run:
------
* For web viewing, simply click on [Chitter](https://zhivko-chitter.herokuapp.com/).
* For local use, clone the repo to your local machine and run `bundle install`.
* Tests can be run by running `rspec` from the command line.

Technologies used:
-----

* Production: Ruby, DataMapper, PSQL, BCrypt (for passwords), Sinatra, Heroku, HTML, CSS
* Testing: Rspec, Capybara, Database Cleaner (for test database), Rubocop, Coveralls.

Screenshots
----------------------

* Home Page
![Home Page](https://github.com/zsid/chitter-challenge/blob/master/app/public/images/homepage.png)

* Signed in
![Signed in](https://github.com/zsid/chitter-challenge/blob/master/app/public/images/signin.png)
