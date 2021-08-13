Chitter Challenge
=================
A small web app mimicking Twitter that allows users to post to a public stream. Completed for the purpose of practising databases & web apps.

## Setup
Run
```shell
bundle install
```
to install gems

Create databases and tables via psql using sql instructions in db/migrations. Remember to create the tables in both databases.

## Database Connection
I have setup the connection to the database with ActiveRecord. This should work once you have bundle installed.

## Usage
Run
```shell
rackup
```
and visit localhost:9292 to view online website. Feel free to sign up to post peeps and explore! You will need to sign 2 people up if you would like to tag them in your peep.

Run
```shell
rspec
```
for testing.

## Diagrams
User Table
|id|name|email|username|password|
|--|--|--|--|-|

Peep Table
|id|message|created_at|user_id|
|-|-|-|-|

Tag Table
|id|peep_id|user_id|
|-|-|-|

I wanted to call the user_id column in the tag table "tagged_user_id", and call "peep.tagged_users" to retrieve them, but couldn't quite figure out how to change the names via activerecord.

## My learning

#### Advice needed:
Project Setup - I tried but haven't yet worked out how to run the database migrations using rake. Help needed here!

MVC - I think some of my controller is too 'fat' but I'm not sure how to make them thinner. Not sure I've got the MVC balance correct as the views also seem to be doing quite a lot. Is flash[:notice] done correctly? I haven't used next or now. Also, should I have more views? For example, one view for viewing the peeps before logging in and another view for viewing the peeps once logged in? This would minimise some of the <% if %> statements in the views, but just not sure if it's considered to be a better approach or not. Any advice would be really appreciated.

CSS - I've managed to connect a separate .css file to the html! Hooray! Created a public/stylesheets directory which I link at top of html file. My design skills are terrible though! I should probably have multiple css files for each page but have done it all in one here.

#### Reflection:

User Story 1:\
To make the most of the ActiveRecord syntax Peep.create(params[:peep]) I needed to name the "message" box peep[message]

User Story 2:\
Fairly straight forward. Consolidated understanding of the <class='peep'> to allow spec to find first('.peep')

User Story 3:\
Consolidated use of .strftime

User Story 4:\
Use 'user[name]' as names for inputs so that names are all associated as params of user. Not sure I've done flash[:notice] correctly in terms of where things are in MVC. Need to include bcrypt gem and has_secure_password in user.rb

User Stories 5 & 6:\
Logging in and out of chitter needs sessions enabled. Need to store the user_id in the session variable and access that session variable for each route. Routes needed for this step are get '/sessions/new', post '/sessions' and get '/sessions/destroy'

User Story 7:\
I have enabled tagging one user only in a post but have not got as far as initiating an email sent automatically to the tagged user.

## References to Others' Code:
I looked at previous pull requests to see what they had included in the .travis.yml file to get a green tick. Even after seeing this I couldn't find anything about it in the travis documentation or online so I've no idea how I would have found this.


## Makers Instructions

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

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
