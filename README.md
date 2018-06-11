Chitter Challenge
=================

### Quickstart:
#### How to install the code:
1. Fork this project
2. Run ```bundle``` to ensure you have all the relevant gems
3. Use Ruby 2.5.0
4. Run ```rake setup``` to generate the test and non test databases
5. When finished with the application, run ```rake teardown``` remove databases

#### How to use the website:
1. Load localhost server via ```rackup config.ru``` and note the port number listed.
2. Visit 'localhost:9292'.

#### How to run the tests:
Spec file includes unit tests and feature tests sub folder.
All tests can be run via ```rspec```.

### Approach to solving the challenge:
1. Set up Sinatra file system and frame work with Controller and Views.
2. Created Capybara feature tests for ensuring the user behaviour was as expected.
3. Worked through the Red, Green, Refactor process to address each user story via TDD.
4. Set up PG database with one to many relationship between users and peeps (messages).  

### Status at point of push:
100% test coverage.
No rubocop issues.
Issue - due to PSQL queries, peeps (messages) must not include an apostrophe.

### Description of what code does:
Chitter is a social messaging web application that enables visitors find out what others are up to. The site shows a thread of messages posted. Users can also sign up and then post peep messages themselves.

### Code Style:
Standard Ruby, with Capybara and Rspec syntax for testing.

### Features:
1. Past peeps (messages) are displayed in reverse chronological order.
2. Only users who have signed up can post to Chitter.
3. Optimising for user sign up with click through to sign up where relevant.
4. Email and username user for sign up must be unique otherwise an error message will be shown.
5. Passwords are securely encrypted in the user database.

### Code Example:
Extract from the code:
```
def self.new_user(name, username, email, password)
  encrypted_password = encrypt_password(password)
  return false unless valid_sign_up?(username, email)
  result = add_to_database(name, username, email, encrypted_password)
  ChitterSignUp.new(result[0]['user_id'], result[0]['name'],
    result[0]['username'], result[0]['email'], result[0]['password'])
end

def self.all
  result = DatabaseConnection.query("SELECT * FROM users")
  result.map do |user|
    ChitterSignUp.new(user['user_id'], user['name'], user['username'],
                      ]user['email'], user['password'])
  end
end
```

Instructions Set by Makers Academy
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

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
