# Chitter Challenge by Pablo Joyce
=================

* This project is a solo Ruby project completed at the end of the web applications module of the Makers Academy bootcamp.
* The application is built with the Sinatra web framework, rendering view files using ERB
* The application uses a PostgresSQL database
* The database connection is established in `lib/database_connection.rb` using the `pg` gem
* Seed data for tests is included in `spec/seeds.sql`

The Brief:
-------
To create a basic Twitter clone that will allow the users to post messages.
We were given the following user stories as a starting point:

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

We were given the following notes on functionality:

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

## Getting Started

At time of writing, this project has a version deployed on Render at [https://chitter-7pam.onrender.com/](https://chitter-7pam.onrender.com/). Please note that this may take 30 seconds or longer to 'spin up' as it is deployed on a free tier of Render.
At some point in the future, this version may be taken down as Render only allows a single database instance on the free tier.

For the local version, clone this repository to your local machine:
`git clone https://github.com/pablisch/chitter-challenge.git`

Switch to the `local-server` branch:
`git switch local-server`

cd to the project and install dependencies:
`bundle install`

Ensure that your postgres server is accessable at the IP address 127.0.0.1.
Create the postgreSQL databases for running and testing the project:
```bash
createdb chitter
createdb chitter_test
```
Create the tables in the databases:
```bash 
psql -h 127.0.0.1 chitter < spec/tables.sql
psql -h 127.0.0.1 chitter_test < spec/tables.sql
```
Populate the test database with seed data:
```bash
psql -h 127.0.0.1 chitter < spec/seeds.sql
psql -h 127.0.0.1 chitter_test < spec/seeds.sql
```
Start the development server:

`rackup`

Access the website in your browser at [localhost:9292](http://localhost:9292/).

## Using the application

Be default uses can see all messages posted by all users, but cannot post messages.

Follow the link to register as a user, you will then be prompted to redirect to login.

After login, you will be redirected to the home page where you can post a new message. messages posted by all users will appear here in reverse chronological order.

## Running the tests

`rspec`

All tests should pass with a total code coverage of 98.57%

## Design

The design planning used at the time of making can be seen in recipes/chitter_plan.md.

I started by creating a [diagram of the user experience](.images/chitter3.png).

* This application follows a model - view - controller design pattern.
* In the directory [./lib](./lib), each table in the DB has a corresponding Ruby class defined with a singular version of the name of the table.
* Each table has an additional 'TABLENAME_repository' class with methods that allow for CRUD operations on the DB.
* Route handling occurs in the `Application` class defined in [./app.rb](./app.rb). [./config.ru](./config.ru) executes the code inside of `Application` when `rackup` is run at the command line.
* The database tables have the following relationships: `users` has a one-to-many relationship to `peeps` (synonymous with 'messages' - a further iteration would be to rename these uniformly), users and peeps have a many-to-many relationsip with respect to tags, so these are stored in the `tags` join table.
* Given the brief, I began the planning process with an intial digram of how the application could be structured:
  ![initial diagram](./chitter-initial-diagram.png)
* The [route recipe](./route_recipe.md) and [schema recipe](./schema_recipe) files were created to aid in design.
* The flow of execution for detecting tags in a message and storing these in the DB was conceptualised in this diagram:
  ![chitter tags diagram](./chitter-tags-diagram.png)
* Passwords are hashed using the [BCrypt](https://rubygems.org/gems/bcrypt/versions/3.1.12) gem.
* User input to messages is santized with basic measures to defend against cross-site scripting injection. In a real-world application I would consider instead using a dedicated and maintained library to provide a more robust defence here and would consider whether the use of the `pg` gem, and existing architecture, is enough to guard against a SQL injection attack.

## Technologies used

This project uses:
* Ruby
* PostgreSQL
* ERB
* Rackup
* Sinatra
* Webrick
* Git
* GitHub
* Bcrypt

In development, this project also used:
* Postman
* TablePlus
* RSpec

## Notes on test coverage

The following code **AT THE TOP** of spec_helper.rb causes test coverage stats to be generated
on pull request:

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
