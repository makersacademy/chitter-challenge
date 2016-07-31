Chitter Challenge
=================

Makers Academy Weekend Challenge no. 4
--------------------------------------

For this week we were challenged to create a simple twitter clone.

'Chitter' is a simple app that allow a user to create an account, log in and post 'peeps'. I created a local database using psql, and used DataMapper for my CRUD needs. Passwords are looked after by BCrypt.  My approach was to create create two models, one to handle the user accounts, and the other to look after the peeps. The user class has a one to many relationship with the peep class. This allow's chitter to display who peeped what. Views were kept to a minimum, one for logging in, one for singing up and one for viewing and posting peeps.

======================================================

The requirements for signing up are:
 - Email needs to be a valid format and must be unique
 - User's name must be entered
 - User must create a user name which must be unique
 - Password required and must be confirmed by retyping

The requirements for logging up are:
 - Email must be registered
 - Password must be correct

To post a 'peep':
 - User must be signed in  

Peeps must display:
 - User's name
 - User's username
 - Time of peep
 - Be displayed in reverse chronological order

________________________________
Follow these steps to have a go:
--------------------------------

 - Clone this repository
 - Bundle install
 - psql a chitter_development database (CREATE DATABASE chitter_development)
 - psql a chitter_test database if you want to run the tests
 - rake db:auto_migrate
 - ruby ./app/app.rb
 - http://localhost:4567/
 - In the browser, create a user account and start peeping
