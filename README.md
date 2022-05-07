Chitter Challenge
=================
This Chitter project is a small Twitter clone. This Sinatra web app allows users post to and read from a feed of posted messages (peeps). It also allows users to sign-up and login to control their own posts.


#### Technologies used

- Ruby
- PostgreSQL (database manager)
- Rspec (test framework)
- Sinatra (Ruby web framework)
- Capybara (web feature test library)


#### Personal motivation

- Building a web app with a database
- Improved debugging process for web and database applications
- Use of and better understanding of the Object Relational Model (ORM) design pattern
- Set up and use of test and dev database environments


## Steps to download

1. Fork this repo

2. `git clone `

3. Run `bundle` in the root of the project


## Database setup instructions

### Dev database setup

1. Connect to psql in terminal `psql postgres`
2. Run `CREATE DATABASE chitter;`
3. Run `psql \c chitter;` (to connect to new db)
4. Create `peeps` table using the query saved in `01_create_peeps_table.sql`


### Test database setup

1. Connect to psql in terminal `psql postgres`
2. Run `CREATE DATABASE chitter_test;`
3. Run `psql \c chitter;` (to connect to new db)
4. Create `peeps` table using the query saved in `01_create_peeps_table.sql`


### Add timestamp column (to both dev and test dbs)

1. Run `psql \c chitter;` (to connect to dev db)
2. Add `created_at` column using the query saved in `03_add_timestamp_to_peeps.sql`
3. Repeat for `chitter_test` db by first running `psql \c chitter_test;` to connect


### Create users table (in both dev and test dbs)

1. Run `psql \c chitter;` (to connect to dev db)
2. Create `users` table using the query saved in `04_create_users_table.sql`
3. Repeat for `chitter_test` db


## Add user_id column to peeps table (both dev and test dbs)

1. Run `psql \c chitter;` (to connect to dev db)
2. Add `user_id` column to `peeps` table using the query saved in `05_add_user_id_to_peeps_table.sql`
3. Repeat for `chitter_test` db


## Steps to run

1. Run `ruby app.rb` or `rackup -p 4567` in root project directory

2. Visit `http://localhost:4567/peeps`


## To run tests

Run `rspec` directly in root of your local project


## My approach


1. Break down first user stories into an object model
2. Add capybara config requirements into `spec_helper.rb`
    - `config.include Capybara::DSL`
    - `require File.join(File.dirname(__FILE__), '..', 'app.rb')`

3. Add necessary gems to Gemfile (`sinatra` as a minimum at this stage)

4. Write first feature test - testing infrastructure on `home (/)` route

5. Make it pass by following command line error messages
    - `LoadError` requiring `app.rb` controller
    -  Index `"/"` route required

6. Check in client by running `ruby app.rb` and visiting `localhost:4567`

7. Extract `view` by creating `index.erb` view file for `"/"` route

8. Initial commit and push to github

9. Refactors infra test and message to homepage welcome message

10. Test drive first user story (posting a peep) using Capybara feature tests and Rspec unit tests
    - `peeps/new` GET route
    - postgres db and peeps table setup
    - extract `peep` class, requiring `pg` gem
    - `peeps/new` POST route

11. Repeat red/green/refactor process using feature and unit tests
   


#### Structure

- Controller: `app.rb`
- Views: `views/<name>.erb`
- Models: `lib/<name>.rb`
- Migrations: `db/<name>.sql`


#### User stories

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
