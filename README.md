## Approach

I used TDD to develop my app. Used Sinatra framework and Capybara for testing.
I tried to use REST (however I used usernames instead of id's since they are uniqe as well. I thought it provide better user experience.)
Pony and Mail is used for email functionalities.
Later on I want to add the comments and beatify the views.

## Extra functionality
- User profile with user's peeps only
- Every peep has the peer's username with a link to the user's profile.
- Tagging link automaticly created if tagged user exsists.
- Tagged user get an email via Pony/Mail.

### Used extra gems

- Pony for email
- Mail for testing emails (comes with Pony)

## User stories

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.


## How to use
 
### Getting started

To get started with Chitter:

```
bundle install
rake setup
```

This will give you the application, and set up two databases: `chitter` for the development environment, and `chitter_test` for the test environment.

### To run the Chitter app:
 
 ```
 rackup -p 3000
 ```
 
 To view Chitter homepage, navigate to `localhost:3000`.
 
### To run tests:
 
 ```
 rspec
 ```
 
### To run linting:
 
 ```
 rubocop
 ```