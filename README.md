Chitter Challenge
=================

Weekend challenge (week 4) of Makers bootcamp. I have written a basic Twitter clone (Chitter) that allows users to post messages(peeps) to a public stream.

The Chitter database is integrated using PG gem and SQL. The database stores peeps (content, time posted) and users (username, handle) in separate tables. 

Features:
-------

```
On the /peeps/index view, a form allows the user to post a peep, to satisfy: 
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

sort_all_peeps method, which is then called within the get /peeps route, to satisfy:
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

timestamp added using Time.now in the Peep.add method, to satisfy: 
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

Authenticate method in User class checks that the user has entered the correct username and password, to satisfy:
So that only I can post messages on Chitter as me
I want to log in to Chitter

Sign-out button on /peeps page. This points back to the post /sessions/destroy route, which clears the user data from the session, to satisfy: 
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

Features not yet implemented
-------

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

#### Setting up the databases

You can setup the test(chitter_test) and development (chitter) databases using rake.
1. Make sure you have run bundle install to install all gems required for the program, including rake. 
2. Run the setup databases rake task saved in the rakefile by typing: 
```$ rake initial_databases_setup```
3. Note that rspec is configured (in the spec_helper) to connect to the test database before each test, using the rake task :test_database_setup