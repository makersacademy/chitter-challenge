# Maker's Week 4: Weekly challenge
This challenge was the fourth of my Maker's weekend challenges.
This was by a noticeable margin the more complex of the challenges I had been given so far, but not so difficult to achieve.
The learning objectives for this week were:

* Built a web app with data permanence, allowing rendered data to persist between page refreshes
* Allow a user to input new data in order to change what is rendered, and have these changes persist
* Using a Ruby based ORM to interface with SQL based database

Successes
-----

* All but advanced challenge feature implemented with full test coverage
* Successfully implemented authentication and login, as well as time formatting
* Everything until Bcrypt and styling done without references/ documentation


To improve
-----
* Styling is weak and took far too much effort, would use a front end framework next time
* More detailed planning, needed to remake a table because I couldnt work out how to add a relationship to an existing table
* User name attached to messages is done by current user, leading to incorrect display when different users log in, needs refactoring to use user data on message creation. 



Chitter Challenge
=================

![alt text](https://github.com/MattDawson2020/chitter-challenge/blob/master/public/Screenshot%202021-04-25%20at%2021.02.28.png)

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

Setup:
-------

* Clone this repo and run bundle migrate to install any dependencies
* Run migration files 1, 4 and 5. Files 2 and 3 are redundant after an SQL issue prevented database alteration  
* Use < rackup > command in terminal to launch Sinatra server, and go to localhost:9292 to interact with the app

