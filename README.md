=================

Chitter Challenge

=================

### Setting up the database 

Connect to psql by typing `psql postgres` in the command line

Create the database using the psql command `CREATE DATABASE chitter_app;`

Connect to the database using the pqsl command `\c chitter_app;`

Run each query saved in the folder db > migrations to create the relevant chitter and user databases

Repeat the aboive 

To create the test database use the psql command `CREATE DATABASE chitter_app_test;` and follow the instructions in the file 01_create_chitter_table.sql

### Comments

User Story 1 (Complete)  
As a Maker  
So that I can let people know what I am doing    
I want to post a message (peep) to chitter  

I made a new route for '/chitter/new'. I wrote the feature test for adding a new post then created a new.erb in the views that gave the option to type up a post in the box and submit it to the /chitter page via a post method. This meant using params on 'post'. I created and tested a self.create method that interacted with pg to get the new post added to the data table and showing up on the /chitter page that it had been redirected to. 

User Story 2 (Complete)  
As a maker   
So that I can see what others are saying    
I want to see all peeps in reverse chronological order  

I attempted User Story 2 first as it seemed like viewing all posts would come before being able to add to those posts. This was done by testing and creating a .all method in Chitter.rb. I then had to edit the chitter.erb page to display the posts. The results displayed were initially in chronological order, which was changed using 'reverse_each' in chitter.erb. 

User Story 3 (Complete)  
As a Maker  
So that I can better appreciate the context of a peep  
I want to see the time at which it was made  

Earlier on, I added an additional column to my data tables called 'time'. I can see that this is working and shows the date and time of when each entry is made. In order to get this showing on the /chitter page, I did some editing to chitter.rb. I initialized @post and @time and made them available in the attr_reader. I was then able to call them both in chitter.erb. I'm unsure what I did in chitter.rb with this code Chitter.new(post: chitter['post'], time: chitter['time']) which I think cmeant that each new chitter post had two arguments. 

User Story 4 (Complete)
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

Further comments: 

I will ask a coach to review my code so far, and ask about my two remaining failing Rspec tests. I think I need to alter my unit test to expect it to show time. 

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

ADDITIONAL FEATURES 

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
**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra & ActiveRecord setup](https://learn.co/lessons/sinatra-activerecord-setup)

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
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
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

Running the app
----------------------

To run the app type `rackup` in the command line. The app will run on `http://localhost:9292/`

