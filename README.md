Chitter Challenge
=================

## Completion notes

The approach I'm taking is TDD with

1) Capybara feature tests
2) UI code (MVC)
3) RSpec unit tests
4) Backend code (lib)

I'm still pretty wobbly on the way to marry TDD with frontend and backend dev.

## Domain model

The two db tables and classes I'm using are Users and Peeps.

These will also form part of the URLs for the relevant sections.

I'm developing the domain modelling for each story as follows:

### As a Maker. So that I can post messages on Chitter as me. I want to sign up for Chitter

Users:

* new - GET '/users/new' producing POST to '/users'

### As a Maker. So that I can post messages on Chitter as me. I want to log in to Chitter

Users:

* login - GET '/' producing POST to '/sessions'

### As a Maker. So that I can avoid others posting messages on Chitter as me. I want to log out of Chitter

Users:

* logout - GET '/' producing DELETE to '/sessions'



# Original challenge Readme

* Challenge time: Friday afternoon (+ weekend if you need it)
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan (if you haven't already)
* Forking this repo

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!
