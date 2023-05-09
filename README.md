Chitter Challenge
=================

Write a small Twitter clone that will allow the users to post messages to a public stream.

## How to use

```ruby
rackup
http://localhost:('Port in use')/
```

## Initial plan

![initial plan](./initial_plan.png "initial plan")

## Approach

1. Set up the Chitter database with test accounts and test peeps so that the homepage has some information prepopulated

2. Create AccountRepository, Account & PeepRepository, Peep classes so that new instances of each can be made

3. Create the homepage using GET request so that the test peeps are shown

4. Create a sign up page so that details are added to the database and user is registered

5. Create a form to add new peeps using POST request

6. Once form is submitted, return to homepage with list of peeps

7. Add a log in and log out page, which checks the database to match log in details

8. Send an email when someone has been mentioned in a post

## Changes to plan

## Techonologies used

- Ruby
- RSpec
- PostgreSQL
- Sinatra