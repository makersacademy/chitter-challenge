Chitter Challenge
=================

Note: Sorry it's not very pretty. I was at a wedding this weekend. Future plans will be:
  .add the option to reply to peeps
  .display username on peep
  .add password recovery
  .remove the need to put your name and email in for sign in (I miss-read one of the user stories)
  .make it pretty

File tree

├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app
│   ├── chitter.rb
│   ├── data_mapper_setup.rb
│   ├── models
│   │   ├── peep.rb
│   │   └── user.rb
│   └── views
│       ├── layout.erb
│       ├── peeps
│       │   ├── home.erb
│       │   └── new_peep.erb
│       ├── sessions
│       │   └── sign_in.erb
│       └── users
│           └── new_user.erb
├── config.ru
├── coverage
├── disabled.yml
├── docs
│   └── review.md
├── enabled.yml
└── spec
    ├── feature
    │   ├── homepage_feature_spec.rb
    │   ├── peeps_feature_spec.rb
    │   ├── signin_user_feature_spec.rb
    │   ├── signout_user_feature_spec.rb
    │   └── signup_feature_spec.rb
    ├── spec_helper.rb
    └── web_helpers.rb

10 directories, 25 files


You can see the whole project on line at https://smitter-chitter-chatter.herokuapp.com/

(You'll need to sign up to start peeping)

Alternatively you can run the site locally using Sinatra or on your own heroku site by following the below installation and operation guides.

Installation Instructions

1. Go to the link below and fork the repository
(note: you will need to be signed in to your GitHub account to view or fork)

	https://github.com/rachelsmithcode/chitter-challenge.git

2. Clone the repository by typing:

	$ git clone <the SSH or HTTP link from your new forked repo on your GitHub account>

(note: Make sure you are in the directory that you wish the challenge folder and it’s content to be stored in. Cloning creates the new directory so there is no need to make a rps-challenge directory)

3. To install the gem files run the command:

	$ bundle
  $ gem update bundler

(note: If this returns an error you may need to install the bundler gem first, using the command: $ gem install bundler
for further details check the website: http://bundler.io)

****------BEFORE THE NEXT STEP ADD and COMMIT everything you want saved to git hub.-------******

4. Install the heroku tool belt and then run:

  $ heroku create <enter a unique name for your website>
  $ git push heroku master


5. You need to create the databases that work with the chitter program. To do this run the below 3 commands in command line:

  $ rake db:auto_upgrade
  $ rake db:auto_upgrade RACK_ENV=test
  $ heroku run rake db:auto_upgrade

The website should now display locally or on your own heroku site.

Operating guide

1. From the root of the “chitter-challenge” directory run the chitter.rb file by typing:

ruby app/chitter.rb

(this will start the local server running and allow you to load the page up in your browser)

2. Navigate to the home page in your browser.

http://localhost:4567/

3. Click "Sign Up" and enter your details on the next screen. Click “Sign up”

4. Click "New peep"

5. Fill in the details of your new peep and click "Peep!"

6. It will take you back to the home screen. Peeps are displayed in reverse chronological order.



* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
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
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
```

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you submit a pull request, and you can also get a summary locally by running:

```
$ coveralls report
```

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.
