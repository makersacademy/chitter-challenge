Chitter [![Coverage Status](https://coveralls.io/repos/github/makersacademy/chitter-challenge/badge.svg?branch=rjlynch)](https://coveralls.io/github/makersacademy/chitter-challenge?branch=rjlynch)   [![Build Status](https://travis-ci.org/joemaidman/chitter-challenge.svg?branch=master)](https://travis-ci.org/joemaidman/chitter-challenge)
=======

Chitter is a web application build on the Sinatra framework that emulates the core functionality of Twitter. Users are able to register with a unique email address and once signed-in, can post 'Peeps' (tweets) with tags and images to a public stream.

Users can also:
- View user profiles
- Update a user profile
- Sign out
- Reply to Peeps
- Search Peeps by tag
- Sort peeps in ascending or descending order

A demo of the application can be found on Heroku at https://chitter-week4.herokuapp.com/

## User Stories
```
As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that I can post messages on Chitter as me
I want to log in to Chitter

As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a User
So that I can be involved in the community
I want to be able to reply to peeps

As a User
So that I can see information about myself and other Users
I want to be able to visit a profile page for users
```

## Notes on functionality
* Users sign up to chitter with their Email, Password, Name,  Handle, Biography and Avatar.
* The Email and Handle must be unique.
* The Biography and Avatar are optional.
* Peeps (posts to chitter) show the handle of the authoring user.
* Users can only can peep if logged in.
* Users don't have to be logged in to see peeps or view user profiles.
* Peeps can be created with an image URL which will display in the peep.

## Screenshots
**Homepage**

![home](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/peeps.png)

**User profiles**

![Profile](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/profile.png)

**New Peep**
![peep](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/peep.png)

**Replies**

![reply](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/replies.png)

## Technologies used
**Backend**
- Ruby
- Sinatra

**Database**
- Postgresql
- Datamapper (ORM)
- BCrypt (Password encryption)

**Testing**
- RSpec
- Capybara

**Frontend**
- Bootstrap
- CSS

**Deployment**
- Heroku

## Installation
- Clone the repo
- `cd` to the project folder
- Run `bundle install`
- Create two local postrgresql databases called `chitter_development` and `chitter_test`

To test:
- Run `rspec`

To run the application on localhost:
- Run `rackup`
- Visit http://localhost:9292/

## Potential feature improvements
* Follow and unfollow users.
* Password validation.
* Password recovery.
* Improve responsiveness of design.
