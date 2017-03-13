Chitter
=======

A Twitter clone that will allow the users to post messages to a public stream, the week 4 weekend challenge at Makers academy. Demo available here: https://chitter-week4.herokuapp.com/peeps

User Stories
-------

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

Notes on functionality
------

* rspec
* Makers sign up to chitter with their email, password, name and a handle (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The handle and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* bcrypt to secure the passwords.
* data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

Screenshots
-----------
New peeps
![Peeps](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/peep.png)

User profiles
![Profile](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/profile.png)

Potential improvements
-----
* In order to start a conversation as a maker I want to reply to a peep from another maker.
* Password validation.
* Password recovery.

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.
