Chitter Challenge
=================

This is the project for week 4 of the Makers bootcamp. It uses Ruby, Sinatra, PostgreSQL and Mailgun.

A production version is available to use at https://chitter-gap8.onrender.com

All RSpec tests are passing, and simplecov is reporting 97% test coverage.

There's some very basic `@mention` functionality which will send a notification to the tagged user. See `Notes` below for more on this.

## Deploying

I've deployed this on [Render](https://render.com), but it should deploy anywhere that supports Ruby and Postgres (and Mailgun if you use the email notifications).

1. Clone the repo.
2. Create a Postgres database using `spec/table_schemas.sql`.
3. If you're testing it locally, you'll need to populate the database with `spec/seeds.sql` to make sure the RSpec tests continue to pass.
4. Set these environment variables:
  - `ENV['DATABASE_URL']` should be set the the URL of your Postgres host.
  - If using the email notification functionality, you'll need to set:
    - `ENV["MAILGUN_API_KEY"]` is your Mailgun API key.
    - `ENV["CHITTER_FROM"]` is the address that Chitter will send notifications from.
    - `ENV["CHITTER_SENDING_DOMAIN"]` is your Mailgun sending domain.

## Notes

- In this version, if you @mention another user, it will send a notification to their registered email address. This currently only works:
  - If `@name` is at the start of the Peep.
  - If the user has registered with a single name. If they registered with their full name, it won't work. To help with this, I need to add a separate username field to the database (it's currently just using name, email address and a unique user ID that isn't accessible to the user).
  - If the capitalisation is exactly the same as the name the user registered with.

## Todo
- Add a username field.
- Make the `@mention` parsing more robust.
- Implement threaded replies (will probably need to add a join table between Peeps and their replies for this).
- Add more robust input validation and sanisation.
