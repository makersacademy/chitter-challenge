Chitter Challenge
=================

Introduction
------------

The fourth weekend challenge at Makers Academy was called Chitter and the task was basically to build a twitter clone with the following user stories implemented.

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
Currently, all of the user stories have been implemented except the last two.

Instructions
------------

The instructions below guide you on how to clone repo if you wish to play with the code or locally run the program

```
git clone https://github.com/jameshamann/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ # once all gems are installed, launch the application:
$ coveralls report #to view all test coverage information
```

To use the application online visit:
https://chitterchallengeapp.herokuapp.com/

Technologies used
-----------------

- Ruby
- RSpec
- Capybara
- Sinatra
- PostgreSQL
- Coveralls

Test Coverage
-------------

The screenshot below displays the test coverage.

![Imgur](http://i.imgur.com/ornS6bZ.png)


Future Considerations
---------------------

Given more time I would look to implement the last two user stories which focus around sorting the peeps as well as displaying the time that they were submitted. I would also like to work on the aesthetics of the site and improve this using some CSS to make the appearance more appealing.

Author
------

James Hamann - https://github.com/jameshamann
