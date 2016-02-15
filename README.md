Chitter Challenge
-----------------------------
Makers Academy Week 4 weekend challenge

The task is to build a Twitter clone that will allow users to post messages to a public stream.

App is available at: http://chitter-example.herokuapp.com/

Functionality:
* Users sign up to chitter with their email, password, name and a user name
* The username and email are unique.
* Peeps (posts to chitter) have the name of the user and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* Users don't have to be logged in to see the peeps.
* Users can only can peep if logged in.

Technologies used:
* Testing - RSpec, Capybara
* Back-end - Ruby, ERB
* Front-end - HTML, CSS
* Other - PostgreSQL, DataMapper, Sinatra, Database Cleaner, BCrypt

To download and use...

```
$ git clone https://github.com/vickymg/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ ruby app/app.rb

```

User stories provided:

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

Open browser at http://localhost:4567/ to use.
