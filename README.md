# Paul's Chitter Challenge

*[Exercise instructions](INSTRUCTIONS.md)*  

## Installation

1. Clone the repo
2. `bundle install`
3. Create a PostgreSQL database 'chitter_test'
    1. e.g. start `psql` from the command line
    2. then run `CREATE DATABASE chitter_test;`
    3. refer to `psql` documentation if you're having trouble with that
4. Set up the database by connecting to 'chitter_test' and running the migration file in db/migrations
    1. e.g. in `psql`, connect with `\c chitter_test`
    2. then run `\include db/migrations/01_create_peeps_table.sql`
5. Start the server with `rackup`
6. Go to `localhost:9292` in your browser
7. Peep away to your heart's content

## Tests

1. Run the tests with `rspec` in the project root

## Some notes as I'm going along...

[A nice blogpost](http://launchware.com/articles/acceptance-testing-asserting-sort-order) on testing that content appears in a particular order with Capybara/RSpec
