Chitter Challenge
=================

Write a small Twitter clone that will allow the users to post messages to a public stream.

## How to use

```ruby
rackup
http://localhost:('Port in use')/
```

## Initial plan

![initial plan](/chitter-challenge/initial_plan.png "Initial Plan")

## Approach

1. Set up the Chitter database with test accounts and test posts so that the homepage has some information prepopulated

2. Create the homepage using GET request so that the test posts are shown

3. Create a sign up page so that details are added to the database and user is registered

4. Create a form to add new posts using POST request

5. Once form is submitted, return to homepage with list of posts

6. Add a log in and log out page, which checks the database to match log in details

7. Send an email when someone has been mentioned in a post

## Changes to plan
