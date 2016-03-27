# Chitter Challenge [![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

#### User stories:
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

### Design an implementation:
Features/languages used:
* Ruby
* HTML                        
* CSS
* Sinatra
* Postgres database
* DataMapper
* RSpec unit testing
* Capybara feature testing.

I completed the app by following each user story above in order. I started by creating two databases, `chitter_test` and `chitter_development`. The test database was used for testing and uses a gem called `database_cleaner` to wipe the database after each test. The development database was for running the web app on a local server. The gem `data_mapper` is used to use basic SQL commands in the Ruby code.

In the databases are two models: `User` and `Peep`. The User model contains the following properties:
* id
* username
* email
* password.

It also has a *one-to-many relationship* to the `Peep` model (user can have many peeps). The Peep model has the following properties:
* id
* message
* time_stamp
* user_id.

The controller is split from one large controller to four small controllers: *home, peeps, sessions and users*. Each controller has many view files including `layout.erb`, the main layout which yields all of the views. The flash error messages are implemented with the `sinatra/flash` gem and are implemented in the layout.erb using partials.

When a user signs up to a new account, DataMapper validations gem `dm-validations` is used to validate the password and password confirmation given. It is also used to validate a correct email address. Additionally, both the username and email have to be unique. If the username given is already taken an error message pops up using the `sinatra/flash` gem.


Test driven development was used with the BDD cycle to complete the app. Feature testing is implemented with Capybara and unit testing of the models is with RSpec.
**Testing coveralls are currently at 100%.**

#### Installation and usage instructions:

* **Setup:**
  * git clone https://github.com/yasgreen93/chitter-challenge.git
  * run `bundle install`
* **Testing with RSpec:**
  * to test, run `rspec`
  * to see coveralls report, run `coveralls report`
* **To view web app:**
  * run `rackup` in your terminal
  * in your browser visit `localhost:9292`
  * or visit the live version on heroku [here](https://chitter-better-than-twitter.herokuapp.com/)
  * alternatively, see screenshots below.

#### Screenshots:
*Home Page:*
![Imgur](http://i.imgur.com/QYLnI0s.jpg)

*Viewing feed as a guest:*
![Imgur](http://i.imgur.com/ogDJHbm.jpg)

*Signing up for an account:*
![Imgur](http://i.imgur.com/1tJMbHD.jpg)

*Signing in to an account:*
![Imgur](http://i.imgur.com/DRd9I11.jpg)

*Signing in/up allows you to post a peep:*
![Imgur](http://i.imgur.com/BulpYYg.jpg)

*Error message on sign up:*
![Imgur](http://i.imgur.com/CwkNPTK.jpg)

*Error message on sign in:*
![Imgur](http://i.imgur.com/rl67etA.jpg)



**Author: Yasmin Green**
