Approach
========

I went into this weekend very unsure of databases, and so most of the construction was around simply making peeps appear and how they were displayed. I then worked my way up towards integrating users, before finally adding in the ability to assign peeps to users.

I modelled mine after the bookmark manager earlier in the week. Rather than simply copy-paste over, I used it as reference when I wasn't sure the syntax or formatting of something or, if a test was failing, just to see if I was missing any required elements. I would then add those elements in to see what they did.

The bookmark manager uses a many-to-many relationship, and I made the mistake at first of just using the same syntax without understanding what it did - this created a join table I didn't really need, and lead to my code not working. I then went back to the documentation and re-wrote. I figured out all I really needed was an association where one User could have many peeps, but I didn't actually need to assign all those tweets under any kind of join table between users and peeps; it was sufficient, in order to display user details next to peeps, to assign each peep the user id.

I worked also on understanding the way ruby code functions inside those special <% %> tags in an erb page, which allowed me to introduce conditionals to hide or display content depending on whether a user was signed in or out, as well as to display a 'Welcome back' message when they were a returning user (versus a new sign-up).


Difficulties/Challenges/Construction notes:

- I got my code working and the front-end looking presentable, but I'd like to do some more refactoring. I'm not sure, but I think some things could either be written neater or passed back to the models. I tried this at least with peep-time-stamping method.

- In order to check the order of items, I originally used a trick specified in here: launchware.com/articles/acceptance-testing-asserting-sort-order to check the index of items within the page. The same people point out they built a Gem to do this, so I installed that after trying their approach, and used that to test order
    - However, I'd have preferred a way that let me count the numbers inputted by the ordered list, which capybara seems to drop when examining item order
    - Same deal with Timecop -- I figured out how to do it manually, but Timecop is so much more convenient

- There isn't really any stubbing in my tests; I need to figure out how to construct tests in a doubles-way, to use fake versions of models outside the model I'm testing, but I've not got time left to figure it out at this stage


The Chitter Challenge I Was Set
===============================

Challenge:
-------

As usual please start by forking this repo.

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
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

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things). <--- I selected this one instead


Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.
