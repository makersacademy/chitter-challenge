Chitter Challenge
=================

This was my first real introduction to the MVC pattern. I am using Sinatra and PostgreSQL with DataMapper as an ORM.

Chitter is a little Twitter clone that will allow the users to post messages to a public stream.

User Stories:
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

Site setup:
----------
Run site on local server: $ rackup

Testing setup:
--------------
Run RSpec tests: $ rspec

Technologies:
-------------
* Ruby, tested with Rspec and Capybara
* DataMapper and Postgresql for DB
* Bcrypt for password encryption
* Sinatra, HTML, CSS, Bootstrap

### User Interface Sketch

This is the basic view of the webapp.  <br />
Deploy to Heroku:

[https://chitter-post-app.herokuapp.com/](https://chitter-post-app.herokuapp.com/)

#### Homepage
![alt text](public/img/chitter.png "Homepage page")

#### Error messages
![alt text](public/img/error.png "Error messages displayed")

#### Sign up form
![alt text](public/img/signup.png "Sign up form")
