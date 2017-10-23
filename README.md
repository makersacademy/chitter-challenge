Chitter Challenge
==================
 User Stories
 --------
```
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
 Approach
 --------

 Technologies
 --------
 Database created in PostgreSQL
 Object Relational Mapper (ORM) - DataMapper
 Passwords hashed using - bcrypt
 Web application framework - Sinatra

 Install
 -------

 1. Fork this repo, and clone to your local machine
 2. Run the command `gem install bundle` (if you don't have bundle already)
 3. When the installation completes, run `bundle`
 4. Run using `rackup` and identify URL from server log.

 Unfinished business
 --------
There is ambiguity between the sign up and sign in functions. This needs clearing up with appropriate navigation implemented.
The name and username for each 'Peep' should be generated from the current_Maker functionality rather than be entered manually each time. Currently any user could post form any username.
CSS needs work.

Credit
--------

The CSS Stylesheet is based on one originally created by David Halewood which we used together during a pairing project in Week 4.
