# Chitter (Twitter Clone)

I created a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
User Story

As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter


Technical Approach:
-----

This application integrated a database using the `pg` gem and Repository classes. I implemented the web applications using Sinatra, RSpec, HTML and ERB views to make dynamic webpages. 


Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Users sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the user and their user handle.

