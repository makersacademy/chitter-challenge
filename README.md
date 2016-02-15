# Chitter Challenge
--------

**Deployed on Heroku: https://alexavlonitis-chitter.herokuapp.com**

How to Use:
-----------

```
* git clone https://github.com/AlexAvlonitis/chitter-challenge.git
* cd chitter-challenge
* bundle
* create database chitter_development; (Postgres SQL)
* rake db:auto_migrate
* rackup (will run a web server on localhost:9292)

```

What is it?
---------

Chitter challenge is a simple clone of the famous website Twitter.
Technologies used: Ruby/Sinatra, datamapper, postgresql, Capybara/RSpec for TDD,
Bootstrap/CSS for some styling and Mailgun API to send emails.
A user creates an account and then he can post a peep(tweet),
he can reply to other peeps and view all the replies.

Stories:

```
As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that I can post messages on Chitter as me
I want to log in to Chitter

As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
Bonus:
-----
```
* In order to start a conversation as a user I want to reply to a peep from another user.

* Work on the css to make it look good (we all like beautiful things).

```

Build Process
-----

Used TDD with Capybara/RSpec, implemented all aspects of a basic authentication
from scratch, Signup, Login, Forgot password with token generation send via
email, also the token expires after an hour and gets deleted if they use it.
Used Bootstrap CSS for fast and easy css styling.
Separated my DBs to test and development, to isolate tests from the actual data.
Used database cleaner gem for my test environment, to ensure every test has a
clean database.

**Helpful resources:**
* http://getbootstrap.com/
* http://www.sinatrarb.com/intro.html
* https://mailgun.com/
