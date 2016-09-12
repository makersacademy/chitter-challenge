Chitter Challenge
=================
Welcome to this funky app! You can register, log in and out and post peeps that appear in reverse chronological order with the time of the peep attached. Enjoy the beautiful interface.

To get started:
- clone this repo
- run `bundle`
- run `rackup`

Features:
-------
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
Tests:
-------

* user visits homepage and logs in
* user logs in with unfound details and gets flash error
* user logout
* lists peeps in reverse chronological order
* logged in user posts a peep
* user can visit homepage and register
* Peeps
  create a peep entry
  has the time of the peep attached
* User
  has a name, handle, email and password + confirmation
  creates a user upon registration
  authenticates a user who logs in
  encrypts a password
  validation
    validates password with confirmed password
    validates email and handle are unique in db
    validates an email is given
