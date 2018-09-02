# Chitter Challenge
=================

This challenge aims to build a clone of 'Twitter' using the framework Sinatra, Ruby and PostgreSQL databases.
This program was built test-first using RSpec and Capybara.

At the moment, this program doesn't include the following functionalities:
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Preview
-------
![Chitter Preview](./public/img/chitter.gif)

Run the app
-------

To download and run the app:
```sh
$ git clone git@github.com:ChocolatineMathou/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ rackup -p 4567
```
Then in your favourite browser, type `localhost:4567/` to access the homepage.

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
```

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.
