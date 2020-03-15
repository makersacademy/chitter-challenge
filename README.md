Chitter Challenge
=================

Challenge:
-------


Features:
-------

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

Technical Approach:
-----

Integrated the databases using active record.  

The MVC should look like:

Views and Routes -

index

/ - homepage, with list of peeps in reverse chronological order, login button, new peep button

new

/:id/new - form to enter a new peep, saves the time and id and content, redirect to homepage

login

/login - where users can login, if they don't already have an account

register

/:id/registration - where users can create a new user account. Form collects, name, user name, assigns a user id and takes and email and password. redirects to homepage 'logged in view'

/:user_id/account
displays just the peeps and details of a specific user

Models -

User and Message

User contains all of the information regarding the user - their name and login details, is responsible for speaking to the users table in the database.

Message is responsible for fetching the messages, fetching messages of a certain user and for adding new messages to the database with their timestamp, user details and content


Notes on functionality:
------

## Databases

In chitter and chitter_test databases these two tables exit:

Messages
id | content | time_created | user_id

Users
id | email | password | name

User_id is a foreign key that links to the Users id and maps the one to many relationship.

## Models

Integrated my databases using ActiveRecord. Cleared test databases with PG and SQL.

Used the following resources to setup and drive my first ActiveRecord application:

https://guides.rubyonrails.org/active_record_basics.html
https://github.com/sinatra-activerecord/sinatra-activerecord


Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)
