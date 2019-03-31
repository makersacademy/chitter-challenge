# Paul's Chitter Challenge

[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

*[Exercise instructions](INSTRUCTIONS.md)*

<img src='img/animation.gif'>

## Chitter

Like Twitter but way better

Using:
- Ruby
- Sinatra
- PostgreSQL database
- DataMapper ORM
- RSpec/Capybara for testing
- Bootstrap CSS
- Heroku + Heroku Postgres

Check it out here: <https://hivemind-chitter.herokuapp.com/>

## Installation

1. Clone the repo
2. `bundle install`
3. Set up your databases and user e.g. by running:  
   `psql -f db/migrations/set_up_databases.sql`
4. Copy `.env-example` to `.env`.(`.env` is included in `.gitignore` in case you want to keep your database credentials secret)
5. Start the server with `rackup`
6. Go to `localhost:9292` in your browser
7. That should work 🤞

## Tests

1. Run the tests with `rspec` in the project root

## What I did

I implemented all the user stories except the last one. I didn't look at the bonus task about replying to peeps. I did a little bit of styling with Bootstrap.

I used DataMapper for an ORM (seems *much* easier than dealing with the database directly!)

It took me a couple of goes to set the database up correctly, but the Travis build is passing.

I deployed to Heroku using the Heroku CLI. Heroku Postgres was pretty easy to configure via DataMapper.

TDD-ed everything, but almost all the model logic was handled by DataMapper, so there wasn't much in the way of unit tests, which felt... weird... Test coverage is ~98%: everything except the lines setting up the database in the development and 'production' environment.

### Things I could have done differently

No doubt this list will increase dramatically when I properly go over the rubric, but for now...

- Would have been good to do the bonus round
- I didn't feel like I was on top of the database set-up and deployment. Need to look into Rake more. Or whatever is the equivalent for Javascript now I guess...
- Could have more detailed validation messages on sign-up page. Currently all errors give the same generic message.
- Should do some validation on the length of a peep
- My gif was a bit low-quality :(

[Here are some other notes I made along the way](notes.md)