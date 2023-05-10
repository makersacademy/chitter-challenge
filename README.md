Chitter Challenge
=================

Write a small Twitter clone that will allow the users to post messages to a public stream.

## How to use

```ruby
$ git clone https://github.com/aliceswood/chitter-challenge.git
$ cd chitter-challenge
$ bundle install
$ createdb chitter_test
$ psql -h 127.0.0.1 chitter_test < spec/seeds/accounts_and_peeps_tables.sql
$ rspec
$ rackup
$ http://localhost:('Port in use')/
```

## Initial plan

![initial plan](./initial_plan.png "initial plan")

## Approach

1. Set up the Chitter database with test accounts and test peeps so that the homepage has some information prepopulated

2. Create AccountRepository, Account & PeepRepository, Peep classes so that new instances of each can be made

3. Create the homepage using GET request so that the test peeps are shown

4. Create a form to add new peeps using POST request

5. Once peep is submitted, return to homepage with list of peeps

6. Create a sign up page so that details are added to the database and user is registered, with error for non unique details

7. Add a log in and log out page, which checks the database to match log in details

8. Send an email when someone has been mentioned in a post

## Upcoming to-dos

- Add condidtions to the sign in and post a peep
- Refactor
- Update tests for creating a peep to link to the logged in user - when sessions are implemented
- Encrypt passwords stored on DB
- REGEX test for @ sign in email addresses
- Errors for empty fields in post a peep form
- Better CSS

## Techonologies used

- Excalidraw
- Ruby
- RSpec
- PostgreSQL
- Sinatra
- HTML