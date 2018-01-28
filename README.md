Chitter
=================

How to use Chitter and peep from your computer:

1. Open command line on your Mac
2. Go to a folder where you want to clone the Chitter
3. Type ```git clone git@github.com:AlexandraGF/chitter-challenge.git```
4. Run ```bundle install``` in order to install the gems
4. Change directory to be in the root of Chitter ```cd chitter-challenge```
5. From command line type ```ruby './app/app.rb' ``` or ```rackup```
This will start the server, so you can run the app in your browser.
6. On any browser type ``` localhost:4567/ if you've run with ruby``` or ```localhost:9292/ if run with rackup``` to run the app
7. On the homepage, please fill in the fields and then click Submit button
8. From your browser, type ``` localhost:4567/peeps/new_peep ``` or ```localhost:9292/peeps/new_peep ``` to write a new peep and click the button Send
9. Every time you want to write a new peep, you can write under the same maker name and just type ``` localhost:4567/peeps/new_peep ``` or ```localhost:9292/peeps/new_peep ``` to write a new peep and click the button Send or you can change your name by typing ```localhost:4567/ ``` or ```localhost:9292/``` in your browser and then follow the same steps from 7 - 8 and the new peep will be under the new maker name.

```
Side note: Chitter is still in development and I would like to thank you for using it and also for your patience!
```

Technologies used:

```
I had created a single controller to manage all the logic in app.rb

I had created the app in Ruby and also adopted the Sinatra framework.

For testing, I've used Rspec and Capybara. As for storing the makers
and peeps, this was achieved by using DataMapper and PostGresQL.
I had also used the 'Bcrypt' gem to encrypt passwords.

```

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
