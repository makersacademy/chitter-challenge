Chitter
=======

Chitter is a web application build on the Sinatra framework that emulates the core functionality of Twitter. Users are able to register with a unique email address and once signed-in, can post 'Peeps' (tweets) with tags and images to a public stream.

Users can also:
- View user profiles
- Update a user profile
- Sign out
- Reply to Peeps
- Search Peeps by tag
- Sort peeps in ascending or descending order

A demo of the application can be found at https://chitter-week4.herokuapp.com/peeps

User Stories
-------
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
```

Notes on functionality
------
* Users sign up to chitter with their Email, Password, Name,  Handle, Biography and Avatar.
* The email and handle must be unique.
* Biography and Avatar are optional.
* Peeps (posts to chitter) show the handle of the authoring user.
* Users can only can peep if logged in.
* Users don't have to be logged in to see peeps or view user profiles.
* Peeps can be created with an image URL which will display in the peep.

Screenshots
-----------
*New peep*

![Peeps](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/peep.png)

*User profiles*

![Profile](https://github.com/joemaidman/chitter-challenge/blob/master/screenshots/profile.png)

*Replies*
![Homepage](htt)

*Homepage*

![Homepage](htt)

Technologies used
-------
*Backend*
- Ruby
- Sinatra

*Database*
- Postgresql
- Datamapper (ORM)
- BCrypt (Password encryption)

*Frontend*
- Bootstrap
- CSS

*Testing*
- RSpec
- Capybara

*Deployment*
- Heroku

Installation
------------
- Clone the repo
- CD to the project folder
- Run bundle install
- Create two local postrgresql databases called chitter_development and chitter_test
- Run rake db:auto_migrate_test to build test database
- Run rake db:auto_migrate_dev to build dev database

To test:
- Run rspec

To run the application on localhost:
- Run rackup
- Visit http://localhost:9292/

Potential feature improvements
------------------------------
* Follow and unfollow other users.
* Password validation.
* Password recovery.
