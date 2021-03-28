Chitter Challenge
=================

## My approach:

### Step 1: Fully read user stories and create domain models

- I created the domain, database and req/res models below from the first 4 user stories

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

![Chitter Domain Model (1)](https://user-images.githubusercontent.com/74908625/112628934-891c4000-8e2b-11eb-97a0-3a284fa2790a.jpg)

![Chitter Domain Model](https://user-images.githubusercontent.com/74908625/112629115-c7b1fa80-8e2b-11eb-9821-58bd0b6b86a7.jpg)

### Step 2: Implement User story 1, 2 & 3

• I wrote the first feature test which is to post a message. In order to test   whether we added something to a database I would need to be able to   return what is in the database. So this step requires us to build and return   the database as well as a method to add data to the database.  

**.all method**

• The first step as per the feature test is to create a POST/peep/new channel   where a user can enter text into a field and press a button. This   required use of erb and an app.rb file. Using the simplest possible solution   I was able to use sessions to save this input and return it to a   GET /peep page.

• I then built a chitter and chitter_test database to hold 3 tables. One for message information, one for user information and one for security information.

• I set up the testing environment in which I could run a test database and then built the .all method within a User class. The User class is designed to return information such as all peeps from a User, their User ID and the time of their posts.

• I wrote 2 tests expecting an input to be returned when .all was called and then pulled the message table into the method and iterated over it pulling the information out.

• I wrote code to pass the tests and now my User method could successfully return a Users peeps to the model.

• Finally I wrote a peep.erb file which returned the message and time of posting. In covering the next user story returned that information to an array and used the SORT BY DESC keywords to display the information in reverse chronological order.

• I then wrote a feature test to determine that the order that information was displayed on the page was newest peeps at the top using a gem called 'orderly' and the appears_before keyword which allows you to test the order of content on a page.

**.add method**

• In order to add data to the database tables I designed a second class Messages, which would be responsible for holding code to post information to a table.

• I wrote a feature test which testing the use of a new all method adding data to the database

• I also wrote a unit test which would return information from a database but would depend on a new .add method to add that data.

• Once this was failing I was able to write the method using "INSERT INTO" to add the message content, id and timestamp to the table.

• The unit tests passed meaning the logic was working in the code.

• Finally to pass the 2 feature tests I created a variable of @messages within the GET /peeps page and then iterated over the hash in the peep.erb folder pulling out the content and time information allowing messages to be displayed in reverse chronological order, showing the time and date the message was created.

**timestamp**

• I used a timestamp keyword within the postgres database which automatically timestamps data.

# User story 4














## Course Instructions

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

Technical Approach:
-----

In this unit, you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [Datamapper wiki](https://en.wikipedia.org/wiki/DataMapper)
- [Sinatra, PostgreSQL & DataMapper recipe](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-datamapper.md)

**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

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

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want at this moment.

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

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
