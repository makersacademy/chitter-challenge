

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


Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests

Mini code review:
-------------

Overall I feel that I have managed to improve on many of the concepts that were introduced to us last week:

* I have been more careful in naming my routes. They now define actions that apply to resources e.g. Users/new, Peep/new, Sessions/new etc.
* My controllers have been split for each route.
* I have made some progress with the concept of mocking once more. I had an attempt at mocking DateTime using Timecop in my specs.
* I used more helpers to keep code and tests DRY.
* Debugging across MVC and databases- diagnosed issue of outdated gems, also regarding databases, I diagnosed that my development database needed to be reset after I set the belongs_to relationship between Users and Peeps as it was preventing me from racking up whilst tests were passing on rspec.

Areas to improve:
* My form information stopped persisting after I added fields for firstname, lastname and username. This needs to be fixed.
* Refactor my views using partials!
* Refactor viewing peeps spec- use another helper perhaps.
* Take time to learn CSS stylising.
