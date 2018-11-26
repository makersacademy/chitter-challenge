Chitter Challenge
=================

INSTALLATION INSTRUCTIONS
----------
- `git clone` this repository
- change into the directory with `cd chitter-challenge`
- run `bundle install` to install gems and dependencies
- run the app with `ruby app.rb`
- visit `localhost:4567`


DATABASE SETUP INSTRUCTIONS:
----------
- Connect to `psql`
- Create the database: `CREATE DATABASE chitter;`
- Connect to the database: `\c bookmark_manager;`
- Run the query in the file `01_add_peeps_table.sql`
- Run the query in the file `02_add_users_table.sql`
- Create the test database: `CREATE DATABASE chitter_test;`
- Connect to the database: `\c bookmark_manager_test;`
- Run the query in the file `01_create_bookmarks_table.sql`
- Run the query in the file `02_add_users_table.sql`


TESTING INSTRUCTIONS:
----------
- Ensure the app is fully installed (see installation above)
- run `rspec` inside the repo for unit and feature tests
- run `rubocop` inside the repo for linting feedback
