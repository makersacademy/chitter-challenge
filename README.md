Chitter
=======

Chitter is a Twitter clone that allows users to post messages to a public stream, the week 4 weekend challenge at Makers academy. Demo available here: https://chitter-week4.herokuapp.com/peeps

User Stories
-------
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

Notes on functionality
------
* Users sign up to chitter with their email, password, name and a handle. Bio and avatar are optional fields.
* The handle and email must be unique.
* Peeps (posts to chitter) have the handle of their user.
* bcrypt is used to secure the passwords.
* data mapper and postgres are used to save the data.
* You don't have to be logged in to see peeps or user profiles.
* You only can peep if you are logged in.

Screenshots
-----------
*New peeps*

![Peeps](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/peep.png)

*User profiles*

![Profile](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/profile.png)

*Homepage*

![Homepage](htt)

Technologies used
-------
Backend
Ruby
Sinatra
postgres

Frontend
html
css
bootstrap

Testing
rspec
capybara

Deployment
Heroku

Installation
------

Potential improvements
-----
* In order to start a conversation as a user I want to reply to a peep from another user.
* Feature: Follow and unfollow other users, with a user specific Peeps page.
* Password validation.
* Password recovery.
