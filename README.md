# Chitter Challenge

The features built in this project are based on [user stories.](./resources/user_stories.md)
The features built in this project are structured on a [CRC and process models.](plan.md)

https://jasonrowsell-chitter.herokuapp.com/

![domain](./resources/domainmodel.png)
![domain](./resources/domainmodel2.png)

- The client issues a request for the /users URL.
- Rails routes /users to the index action in the Users controller.
- The index action asks the User model to retrieve all users (User.all).
- The User model pulls all the users from the database.
- The User model returns the list of users to the controller.
- The controller captures the users in the @users variable, which is passed to the index view.
- The view uses embedded Ruby to render the page as HTML.
- The controller passes the HTML back to the browser.

![arb](./resources/arb.png)

- Both User model and the Peep model inherit '<' from ApplicationRecord
- ApplicationRecord inherits from ActiveRecord::Base
- ActiveRecord::Base is the base class for models provided by Active Record
- Inheriting from ActiveRecord::Base let model objects gain the ability to communicate with the database
- Treat the database columns as Ruby attributes

## Getting Started

To get started with the app, clone the repo then install the required gems:

```sh
bundle install --without production
```

Next, migrate the database:

```sh
rails db:migrate
```

Run the test suite to verify that everything is working correctly.

```sh
rails test
```

If the test suite passes, run the app in a local server:

```sh
rails server
```

## Technical Approach:

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

## Notes on functionality:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## Bonus:

If you have time you can implement the following:

- In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

- Work on the CSS to make it look good.

Good luck and let the chitter begin!

## Code Review

In code review we'll be hoping to see:

- All tests passing
- High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
- The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md). Referring to this rubric in advance may make the challenge somewhat easier. You should be the judge of how much challenge you want at this moment.

## Automated Tests:

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

## Notes on test coverage

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
