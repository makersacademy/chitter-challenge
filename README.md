Chitter Challenge
=================


Synopsis:
-------

Chitter is a replication of Twitter. In this challenge I created a twitter like application to which users are able to sign up and peep (equivalent of tweet). Peeps are visible by anyone who visits the website and users that have signed up can post peeps. The peeps display the date and time of when they were posted along with the username of the person who posted them.

Features:
-------

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------
* Users can sign up using their email, username and password.
* All usernames and emails have to be unique.
* Peeps can be posted by all users that have signed in.
* All peeps display a Date/Time of posting along with the username of the user who posted them.
* Bcrypt was used to secure passwords.
* SQL databases are used and DataMapper is used to save the data.
* Users don't have to be logged in to view the peeps.


Technologies used:
------
* The application was coded in Ruby using Sinatra.
* RSpec was used in order to conduct test-driven development.
* DataMapper was used to save the data to the tables.
* Sinatra-flash was used in order to display error messages and notices.
* Sinatra-partial was used to refactor some code.


Bonus:
-----

I have used bootstrap to add some css to the application.


Installation:
------

To run the application you can either visit it on Heroku (https://usmanchitter.herokuapp.com/)

-- or --

Download a clone of this repo and use Rackup to run it on your localhost. 


Tests
------

You can check the tests by running 'rspec' in the root folder in terminal.
