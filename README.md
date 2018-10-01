Chitter Challenge
=================

Instructions:
-------------
To play the game first clone this repository.

`git clone https://github.com/JonathanAndrews/chitter-challenge.git`

To run the tests move to the directory the repository has been cloned to and run rspec.

There are 27 tests, which are all passing, with 100% coverage of the lib files and feature tests for the web features.

To see the repository in action first install the dependencies (just Sinatra for actually running the app) by running

`bundle install`

and then load the webpage by running

`rackup config.ru -p 4567`

Navigating to localhost:4567 in your web browser will then allow you to play the game.

Features:
-------

```

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Usage:
------

*Sign Up*

<img src="./readme_pics/Screen Shot 2018-10-01 at 09.18.54.png" />

*Enter your email, password, Username and Name*

<img src="./readme_pics/Screen Shot 2018-10-01 at 09.19.09.png" />

*User page welcomes User*

<img src="./readme_pics/Screen Shot 2018-10-01 at 09.19.56.png" />

*Chitter Homepage*

<img src="./readme_pics/Screen Shot 2018-10-01 at 09.20.09.png" />

*Post a peep*

<img src="./readme_pics/Screen Shot 2018-10-01 at 09.20.23.png" />

*Chitter Homepage*

<img src="./readme_pics/Screen Shot 2018-10-01 at 09.21.07.png" />
