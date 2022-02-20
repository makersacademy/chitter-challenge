Chitter Challenge
=================

A Twitter clone built with Ruby, Sinatra and PostgreSQL.

Instructions
---

### Database set-up

1. Install PostgreSQL: `brew install psql` [More instructions](https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3)
2. Launch the service: `brew services start postgresql`
3. Run `psql`
4. Create a Bookmarks database: `CREATE DATABASE "chitter";`
5. Connect to the database: `\c chitter;`
6. Run the SQL queries in [`/db/migrations/`](./db/migrations/01_create_peeps_table.sql) to create the production table.

### Test Database set-up

1. Run `psql`
2. Create a Test database: `CREATE DATABASE "chitter_test";`
3. Connect to the database: `\c chitter_test;`
4. Run the SQL queries in [`/db/migrations/`](./db/migrations/01_create_peeps_table.sql) to create the test table.

### Run the app

1. Clone this repository.
2. `cd` into the directory.
3. Run `bundle` to install dependencies.
4. Run `rackup` to start the local server.
5. Browse to `localhost:xxxx`, where `xxxx` is the port number indicated by `rackup`.
6. Get peeping!

### Run the tests

Run `rspec` to run the tests.

Features
---

- [x] Posting peeps
- [x] List all peeps in reverse chronological order
- [x] Display when each peep was posted
- [ ] Sign up to Chitter
- [ ] Log in to Chitter
- [ ] Log out of Chitter
- [ ] Email alert if tagged in a peep

Technical Approach
-----

- Followed steps 1-11 of [Bookmark Manager](https://github.com/makersacademy/course/tree/main/bookmark_manager) to implement the features.
- Used the [`orderly`](https://github.com/jmondo/orderly) gem to feature test the reverse chronological order of peeps.
- Used default `(now)` to automatically add the peeps' timestamps to the database.
- Used SQL's `ORDER BY xxx DESC` to sort peeps by reverse chronological order directly from the database.
- Added some basic CSS.
- Attempted to format the output of the timestamp by looking at the `DateTime parse` methods, but didn't implement it.

Screenshots
-----------

![](/docs/chitter-home.png)
![](/docs/chitter-peep.png)
