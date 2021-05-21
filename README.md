:hatching_chick::speech_balloon:BecaLParker's Solution to Chitter Challenge: QUACKIE'S DUCKBOARD :hatching_chick::speech_balloon:
============================================================================

What does this code do?
-----------------------
In honour of Quackie (the Makers' Academy rubberducky debugger), I've made a small Twitter clone that will allow users (**Quackers**) to post messages (**Quacks**) to a public stream (**the Duckboard**).

Here are the [Class Responsibility Cards](https://docs.google.com/spreadsheets/d/11LzZXDbAgK_YshhwBttdjJfsn3WNQv_rbeffG_7G9rg/edit?usp=sharing) I made to plan this build.

Credits
-------
I referred to the [code review rubric](https://github.com/makersacademy/chitter-challenge/blob/master/docs/review.md) for this challenge during my build. 

Technologies used
-----------------
Integrated database using the `PG` gem and `SQL` queries.

How to install and run the tests
--------------------------------
|| PLACEHOLDER ||

$ git clone https://github.com/BecaLParker/chitter-challenge

$ bundle

$ rake setup

$ rake migrate

$ rspec

$ rackup


screenshots of how the app works, or perhaps even a link to the deployed version on heroku?



Features
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

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.


