README Edit: My approach and code review
=================

My approach
------
Pre-code:
* First, I read through the User Stories and drew the Domain Models in a table in order to have a clear idea about the main objects and messages of the app.
* Secondly, I drew a relational diagram focusing focusing on what happens after every step in the app. For example: the user opens the website, then peeps are displayed (no login required). The user can choose to sign-up and/or log-in to post new peeps.
* Finally, I drew a quick mock-up of the pages, to have a better understanding on where to place the different sections, etc.

Regarding the development process, I tried to stick by this flow as much as possible:
* Feature Test
* Unit Tests
* Implementation
* Refactoring

Next focus
------

* If I had more time, I would like to work on validations when signing up and signing in. I started working on them a bit, but this is something that can be greatly improved within the app.
* More CSS Styling would be great too if I had had more time.

Personal code review
------

* I keep having trouble being led by TDD, especially when it comes to Unit Tests (I haven not managed to finish all of them in the way I wanted to). I tried to implement the one line of code at a time without breaking old tests when refactoring or adding new code, and for a while it seemeded to help, but then I got lost in my code once again and I had to separate from the optimal flow for a bit.
* I had not many difficulties with Capybara and Feature Tests though. I found myself testing a lot on the browser and changing many things in the Model. I also spent quite a few hours to get familiar with DataMapper, which is the first ORM I have come across so far.
* Regarding databases, I am happy that I understand how relations between tables work and what kind of relations there are.
* Finally, I have observed that in many occasions I struggle to access specific data in my code, or to differentiate among them, especially when dealing with hashes in objects, symbols... I feel like I rush a bit sometimes and start typing and testing the different options rather quickly instead of thinking about what I really want to do, which would save me some time definitely.


Technologies used
------

* Capybara
* CSS Flexbox
* DataMapper (ORM)
* PostgreSQL
* RSpec
* Ruby
* Sinatra


Installation Instructions
------
To install all the dependencies needed for the project, please install **bundler** by running ```gem install bundler``` in the terminal. Then, simply run ```bundle``` to install the gems included in **Gemfile**

In order to set up the databases needed for this project, please run the following commands:
```rake
rake setup
rake setup_test_db
```

If you want to clear the databases, simply run ```rake clear_db```

Finally, simply type one of the following commands in your terminal to navigate around the app:
* ```rackup```
* ```ruby app.rb```

How to run the tests
------

* To run the tests, simply type ```rspec``` in your terminal. Please make sure you run ```rake setup``` before using RSpec as you need to create the databases for the project.

Screenshot
------

[TBC]

Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

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

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
