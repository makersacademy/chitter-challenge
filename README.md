<style>
.object {
    color: #799bef;
}
.action {
    color: orange;
}
</style>

# Chitter Challenge

[![Build Status](https://app.travis-ci.com/PKilgarriff/chitter-challenge.svg?branch=main)](https://app.travis-ci.com/PKilgarriff/chitter-challenge)

Weekend Challenge from Makers to create a *legally distinct* webapp that nevertheless behaves almost exactly like Twitter.

## Set-Up

### Local codebase

Clone this repo to your local machine, then run `bundle` to install the required gems.

```shell
$ git clone https://github.com/PKilgarriff/chitter-challenge
$ bundle
```

### Database set-up

These instructions assume you have PostgreSQL installed on your machine, if not please follow the instructions [here](https://www.postgresql.org/download/) before proceeding.

1. Connect to PostgreSQL's terminal interface with `psql` in your terminal.
2. Create a production and testing database for Chitter, and then connect to the production database with the following commands:

```psql
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
\c chitter;
```

> The test database only needs to be created, all other table creation will be done by the testing suite

3. Create the 'peeps' table in the production database with this command:

```psql
CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(60), maker_id INT, created TIMESTAMP with time zone DEFAULT now());
CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(60), username VARCHAR(60), created TIMESTAMP with time zone DEFAULT now());
```

4. Confirm successful creation of the *peeps* table with `SELECT * FROM peeps;` your expected output should be the following:

  ```
   id | content | maker_id | created 
  ----+---------+----------+---------
  (0 rows)
  ```

5. Repeat for *users* table with `SELECT * FROM users;`

  ```
   id | name | email | password | username | created 
  ----+------+-------+----------+----------+---------
  (0 rows)
  ```

## Usage

Chitter is a webapp, with instructions given on the site itself.

1. Start the server with `rackup` in the terminal.
2. Navigate to `http://localhost:9292/`

## Running tests

Run `rspec` from within the root of the repository.

```
rspec --format documentation
```
 
You can see the expected current testing output [here](#current-testing-output)

## My Approach

- Created a notes file for documenting process and planning next steps
- Analysed the [user stories](#user-stories) for actions and objects
- Set up the production database and peeps table to test syntax for SQL commands and required database structure
  - noted these commands in the readme
- Chose at this time not to use an [ORM](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping)
  - want to focus on consolidating current learning instead of introducing a new technology such as ActiveRecord
- Wrote feature test for first User Story 'Post a peep to Chitter'
  - created views folder with index.erb
  - changed '/' route in controller
  - add GET '/peeps/new'
  - add POST '/peeps'
    - following RESTful practices
  - created new_peep.erb
    - has a form to submit a new peep
    - form posts to '/peeps'
  - create unit tests for PeepManager class
    - add explicit initalize method
      - create @peeps array of peeps
    - add #peep_count method
    - add #add(content) method
    - add singleton method instance to class for persistance
      - make initialize/new private
- First User Story implemented
  - moved onto second: 'See All Peeps in Reverse Chronological order'
- Began integration of database
  - used previous work on [Bookmark Manager](https://github.com/PKilgarriff/Bookmark_manager) as template for testing and creation of DatabaseManager class
  - Reused setup_test_database.rb from [above](https://github.com/PKilgarriff/Bookmark_manager) so that RSpec has a default set of peeps and tables
    - added before loop to spec_helper
  - add #peeps_from_database method to PeepManager
  - drive creation of Peep class
    - initializes with each column from db:
      - id
      - content
      - maker_id
      - created
    - attr_reader for each of the above
  - Updated PeepManager class
    - add #error_peep method
    - add #create_peep method
    - add #reset_peeps_array method
    - above three methods set to private
- Second User Story now implemented
  - peeps display in reverse chronological order on home page
    - used 'ORDER BY created DESC' in SQL query
- Third User Story 'View Time on Peep'
  - Update the Peep class
    - new private method #creation_timestamp
      - handles nil values and parsing timestamps from SQL
    - add #format_time method
      - returns formatted string of timestamp
  - Update view to use new method
- Created layout.erb file based on [Adding CSS to Sinatra Project](https://medium.com/arren-alexander/adding-css-to-your-sinatra-project-f82190e26ca0)
- Wrote feature test for signing up (User Story 4)
  - add new view for adding a new user
  - add GET /users/new
  - add POST /users
    - UserManager class now needed
- add users table to database
- Drive creation of UserManager class
  - based on PeepManager
  - adds a new user to the database
- Drive creation of User class
  - based on Peep
  - stores user information
  - has password testing method
- add add_default_users_to_test_database method to database setup helper

## Technologies Used

- Ruby
- Sinatra
- PostgreSQL
- RSpec
- Rubocop (Currently angry about a 6 parameter method)
- Capybara
- SimpleCov
- Travis CI

## Next Steps

1. Link the User accounts with the posts
  - would require working out the relationship between user and post
    - one to many?
  - then adding business logic to properly link them
2. Add a CSS Stylesheet
  - already have the layout.erb so would be a DRY place to make link
3. Continue with the User Stories
  - Have only done the 4 from the Straight-Up section at this point

## Further Questions

- How do you set up Capybara to also use method_overrides (For PUT PATCH DELETE)
  - alternatively, how do you test properly that your rackup method_overrides are working?

------------

# Appendices

## User Stories

#### Straight Up

> As a Maker<br>
> So that I can let people know what I am doing<br>
> I want to <span class='action'>post</span> a <span class='object'>message (peep)</span> to <span class='object'>Chitter</span>

> As a Maker<br>
> So that I can see what others are saying<br>
> I want to <span class='action'>see all <span class='object'>peeps</span> in reverse chronological order</span><br>

> As a Maker<br>
> So that I can better appreciate the context of a peep<br>
> I want to <span class='action'>see the <span class='object'>time</span> at which it was made</span><br>

> As a Maker<br>
> So that I can post messages on Chitter as me<br>
> I want to <span class='action'>sign up</span> for <span class='object'>Chitter</span><br>

#### Harder

> As a Maker<br>
> So that only I can post messages on Chitter as me<br>
> I want to <span class='action'>log in</span> to <span class='object'>Chitter</span><br>

> As a Maker<br>
> So that I can avoid others posting messages on Chitter as me<br>
> I want to <span class='action'>log out</span> of <span class='object'>Chitter</span><br>

#### Advanced

> As a Maker<br>
> So that I can stay constantly tapped in to the shouty box of Chitter<br>
> I want to <span class='action'>receive an <span class='object'>email</span></span> if I am <span class='action'>tagged</span> in a <span class='object'>Peep</span><br>

## Current Testing Output

```
Home Page
  demonstrates correct infrastructure

Posting Peeps
  posting a peep will display it on the homepage

Sign Up Page
  allows a new user to sign up

DatabaseManager
  .setup
    connects to a specified database via PG
  once .setup has run
    .connection
      returns the connection to the database
    .query
      sends a query to the connected database

PeepManager
  #add
    adds a new peep to the database
  #all_peeps
    when there are no peeps
      returns an array containing an Error Peep
    when there are peeps
      returns an array of the current peeps
  #peeps_from_database
    querys the database for all the peeps

Peep
  stores an id
  stores the content
  stores the maker_id of the author
  stores the timestamp of peep creation
  #format_time
    returns a formatted time

UserManager
  #add
    adds a new user to the database

User
  stores an id
  stores the name
  stores the email
  stores the username
  stores the timestamp of user creation
  #correct_password?
    when given the correct password
      returns true
    when given an incorrect password
      returns false

Finished in 0.78977 seconds (files took 0.7012 seconds to load)
23 examples, 0 failures

COVERAGE: 100.00% -- 261/261 lines in 17 files
```


