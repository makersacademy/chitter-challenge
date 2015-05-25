[![Build Status](https://travis-ci.org/andygout/chitter-challenge.png)](https://travis-ci.org/andygout/chitter-challenge)

[![Coverage Status](https://coveralls.io/repos/andygout/chitter-challenge/badge.png)](https://coveralls.io/r/andygout/chitter-challenge)

Chitter Challenge
=================

Challenge:
-------

A Twitter clone that will allow the users to post messages to a public stream.

Next Steps
-------

- Raise error if user tries to respond to own peep (can this also be enforced at DB level?).
- Additional tests to ensure user feed page includes no other user's peeps.
- Additional tests to ensure no blank entries for: username/name/email/pword/pword confirmation; peeps; replies (again, can this be enforced at DB level?).
- Password recovery functionality.
- Styling for sign-up/sign-in error msgs.
- Styling: only display certain links ('Add Peep', 'Reply') when user is signed in.
- Partials.

Technologies Used
-------

- Ruby (language) on Sinatra (Web Application Framework)
- PostgreSQL Database (using DataMapper (Object Relational Mapper written in Ruby))
- Tested using RSpec (behaviour-driven development framework)
- Rake gem (*While much of your application is built to (swiftly) respond to a web request, there are many scenarios where you would like to access and run pieces of your application outside of that request/response cycle. You may want to run maintenance tasks, periodic calculations, or reporting in your production environment, while in development, you may want to trigger your full test suite to run. The rake gem is Ruby’s most widely accepted solution for performing these types of tasks.*)

Links:
-------

[Makers Academy Bookmark Manager tutorial](https://github.com/makersacademy/course/blob/master/bookmark_manager/bookmark_manager.md)

Database layout:
-------

![Screenshot DB Layout](/public/git_img/db_layout.png)

Images:
-------

- Sign Up
![Screenshot Sign Up](/public/git_img/sign_up.png)

- Sign In
![Screenshot Sign Up](/public/git_img/sign_in.png)

- Home Page
![Screenshot Home Page](/public/git_img/home_page.png)

- Add New Peep
![Screenshot Home Page](/public/git_img/add_new_peep.png)

- Reply
![Screenshot Home Page](/public/git_img/reply.png)

- User Feed
![Screenshot User Feed](/public/git_img/user_feed.png)

- Goodbye message
![Screenshot User Feed](/public/git_img/goodbye_msg.png)

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
