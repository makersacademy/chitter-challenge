# Chitter Challenge Makers Weeks 4

Features.
-------
- I want to post a message (peep) to chitter. (Done)
- I want to see all peeps in reverse chronological order. (Done)
- I want to see the time at which it was made.(Done)
- I want to sign up for Chitter.(Completed).
- I want to log in to Chitter.(In Progress)
- I want to log out of Chitter.
- I want to receive an email if I am tagged in a Peep.

# To Use Application.
- Fork this repo.
- Clone the repo to your computer.
- cd into ``chitter-challenge`` directory.
- ``run bundle install``.
- run rspec to test application.
- run ``rackup`` in terminal to run server.
- visit this **[url](http://localhost:9292/)**.

# Database Setup.
- Before you start.
- check if you have homebrew installed with ``brew - v``.
- If you have, go the the next step else copy and paste this in your terminal ``mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew`` .
- Brew install ``postgresql``.
- Wait for it it install.
- Then install brew services with ``brew services``.
- To start server type ``Brew services start postgresql``.
- Now type psql postgres to switch to posgres database.
- Type CREATE DATABASE chitter.
- To switch or connect to chitter type \c chitter.
- chitter=# ``CREATE TABLE peep_table (id SERIAL PRIMARY KEY, peep VARCHAR(240) NOT NULL, created_at TIMESTAMP NOT NULL DEFAULT NOW());``.
- This will create a table in the peep_table database with 3 columns. ``cd into ',/db/migrations to find out more``.

# Improvements.

- Work on hashing users details when they sign up.

# Technologies Used.
- Sinatra.
- CSS3.
- Sass.
- Twitter Bootstrap.
- HTML5.
- RSPEC.
- Capybara.


