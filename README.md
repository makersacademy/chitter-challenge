Chitter Challenge
=================

Challenge:
-------
 To build a online messaging service (similar to somthing that rhymes with chitter) so you can share your thoughts with the internet.

 Built with Ruby, Sinatra, ActiveRecord and tested with Rspec and Capybara.


 #### Master branch build status:
 ![](https://travis-ci.org/naeglinghaff/chitter-challenge.svg?branch=master)


 ## Setup

 ```
 $ git clone https://github.com/naeglinghaff/chitter_challenge
 $ bundle
 $ rspec
 $ rackup
 ```

Features:
-------
The web application should address the following user stories:

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
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

Technical Approach and Plan of Attack:
-----

## The MVC:

### Views and Routes -

Possible routes and views include:

index at '/' - homepage, with list of peeps in reverse chronological order, login button, new peep button

new at '/:id/new' - form to enter a new peep, saves the time and id and content, redirect to homepage

login at '/login' - where users can login, if they don't already have an account

register at '/:id/registration' - where users can create a new user account. Form collects, name, user name, assigns a user id and takes and email and password. redirects to homepage 'logged in view'

view account at '/:user_id/account' - which displays just the peeps and details of a specific user

### Models

#### User and Message

User contains all of the information regarding the user - their name and login details and it is responsible for speaking to the users table in the database.

Message is responsible for fetching the messages, fetching messages of a certain user and for adding new messages to the database with their timestamp.

Notes on functionality:
------

### Databases

In the chitter and chitter_test databases two tables exit:

### Messages

id | content | time_created | user_id

### Users

id | email | password | name

User_id is a foreign key that links to the Users id and maps out the one to many relationship between a user and their messages or peeps.

### Models

Wrapped my data using ORM (ActiveRecord) and set up 2 environments - development and test. Cleared test databases with PG and SQL.

Used the following resources to setup and drive my first ActiveRecord application:

https://guides.rubyonrails.org/active_record_basics.html
https://github.com/sinatra-activerecord/sinatra-activerecord

Added helpers to my Capybrara feature tests to help keep them DRY.

Had some issues midway through the project with travis builds. Updated the YAML to correct the database setup and SQL queries that were causing the builds to fail.


### Next steps

- To make the username and email fields unique
- To add a logout button
- To add CSS
