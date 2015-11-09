[![Build Status](https://travis-ci.org/forty9er/chitter-challenge.svg)](https://travis-ci.org/forty9er/chitter-challenge)

# @Chitter.

### Installation

Visit:
https://cryptic-citadel-4502.herokuapp.com/

Alternatively, download the files in the repo, install the required Gems and run via a Sinatra server via Rackup on your local machine. You will also need a working PostgreSQL installation (you can install this via Brew).
The main controller is 'app.rb' in the 'app' directory. You will need a Ruby interpreter (if you are running OS X you already have this) and RVM installed.

To clone the repo on your machine, initialise git and clone:

```
$ git init
$ git clone https://github.com/forty9er/chitter_challenge
```

Then from the root folder, install the Gems, create and initialise the database and finally run the app:
```
$ bundle
$ createdb chitter_development
$ rake db:auto_migrate RACK_ENV=development
$ rackup app/config.ru
```

Now navigate to http://localhost:9292/ in your browser.


### Usage

You can view 'Peeps' simply by navigating to the website, or by clicking on the "@Chitter" logo.

![Main Peep Feed](https://www.dropbox.com/s/m9pmcm94ssdckeo/CHITTER_1.png?raw=1)

In order to 'Peep' you need to create an account and log in. 

![Sign up](https://www.dropbox.com/s/1l1l5hj9a2umjc4/CHITTER_2.png?raw=1)

You can then hit the Peep! button and submit your Peep.

![Peep](https://www.dropbox.com/s/snudd7s4camv1m8/CHITTER_3.png?raw=1)

Once you are finished 'Peeping' you can log out using the 'Log out' button.

![Feed and log out](https://www.dropbox.com/s/sd3d945xdu25dcm/CHITTER_4.png?raw=1)


### Testing

The app was built using TDD. Before running you will need to initialize the test database:

```
rake db:auto_migrate RACK_ENV=test
```

Rspec tests can be run from the root directory simply by running:

```
rspec
```


### TODO

* Consider using partials.
* Consider whether controllers can be slimmed down further.
* Use view helpers to remove amount of embedded Ruby and comply with SRP.
* Correct semantics for HTML form markup.
* Use article etc. not div in HTML.
* Integrate tagging other users to create conversations.
* Rake task for first DB setup.
* More comprehensive feature testing.
* More CSS/styling (larger buttons, position elements, logo and backdrop.)


### Technologies used

* Ruby
* PostgreSQL
* DataMapper
* HTML
* CSS
* TDD (via Rspec & Capybara)
* Sinatra
* Heroku
* Rake





# Original instructions


Chitter Challenge
=================

* Challenge time: The weekend and up to 9am Monday morning
* Feel free to use google, your notes, books, etc but work on your own
* You must submit a pull request to this repo with your code by 9am Monday morning
* Please feel free to submit pull requests early at any time during the weekend to get automated feedback from Hound and test coverage stats from Coveralls

Challenge:
-------

As usual please start by 

* Filling out your learning plan self review for the week: https://github.com/makersacademy/learning_plan_september2015 (if you haven't already)
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

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear! 
```

Note that you can replace `Coveralls.wear!` with  `SimpleCov.start` to get coverage stats locally
Then run `open coverage/index.html` from the command line to view details
