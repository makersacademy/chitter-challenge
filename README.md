Chitter Challenge
=================

My first attempt at the Chitter challenge, the challenge was to build a twitter clone from scratch. There were various guideline user stories to accompany this challenge:

```
HAS BEEN MADE:

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

YET TO BE IMPLEMENTED:

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
**Sequence**

![Chitter diagram](/img/Chitter_diagram.png)

Starting from this sequential diagram and following the principles of TDD I first built the ability to 'peep', starting with a database to store the peeps, before building the ruby class to iterate over the database, and finally the erb file to view it in the browser. From there I built the page that stores all the peeps, and finally I began to build the User class, which took in User data from the sign up screen. At the moment it only returns the name you put in, but in the future this User database should be able to store and call back various information given by the user on sign up (and hopefully the passwords would be encrypted!).


Notes on functionality:
------

* You don't have to be logged in to see the peeps.

*Technically* this is true in my code, if you go to the right page (/peep/index) you can see the peeps, but I don't yet know how to keep adding information to the main page, rather than creating different pages! Will fix at a later point.

Code Review
-----------

As far as I can tell, my coverage is at 100% from the 5 tests that encompass the feature and the unit tests.

Notes on test coverage
----------------------
The tests use the rake test enviroment and subsequently connect to my test versions of the databases. These databases reset at the beginning of every test in order to keep the space clean to work with. See the spec_helper.rb file for more.

In order to create this project, I utilized and used Atom, TablePlus, Ruby, Sinatra, SQL, Capybara and RSpec for testing and the command line to work with all of these tools.
