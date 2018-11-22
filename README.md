# Chitter Challenge

This will be a social messaging app, created for Makers Academy (MA) as part of their apprenticeship program.

Initially, users will be able to submit a message and see a list of all messages that have been posted.

Later the app will require users to create an account and be logged in before they can submit a message. They will be able to view the list of messages without logging in. Each message will include details (name and username) of the user who submitted it.

User accounts will require a username and email address (both of which must be unique to the account) and the user's real name (which does not have to be unique). The account will also require a password; MA have not specified a format for the password, but I have chosen to limit its size to no less than 6 characters and no more than 16 characters. I will also require the name to be comprised of only alphabetic characters, allowing the apostrophe and dash if this can be achieved.

---

### Instructions

1. Clone this repo
2. Run `bundle` from the command line while inside the repo
3. To run the app, type `rackup` from the command line while inside the repo, then open your browser and enter `localhost:9292` in the address bar (9292 is the default port for `rackup` - you can optionally specify a different port e.g. `rackup -p 1234`)

Tests have been set up to run with RSpec and Capybara. You can run the full suite using `rspec` or run a specific feature/unit spec file e.g. `rspec spec/features/chitter_spec.rb`

---

### Implementation

The `docs` directory includes a `db-model` file with details of the planned database contents, and a `user-stories` file listing the features specified by MA.
