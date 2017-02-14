Chitter Challenge
=================

Challenge:
-------

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

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

### Install and run this project

* Clone this repository to your local machine.
* Run `bundle` to get all the necessary dependencies
* Run `createdb chitter_challenge_development` to set up the database on your local machine
* Run `rake auto-migrate`
* Run `rackup` to start the local server
* Visit localhost:9292 in your browser

To run the test suite for this project run `rspec`

Or visit my app on Heroku!

https://amanda-chitter.herokuapp.com

### How to use

Sign up by entering name, username, email and password. Email and username must be unique, and password must be confirmed

![Imgur](http://i.imgur.com/PhIZtCb.png)

If they already have an account, a user can simply sign in

![Imgur](http://i.imgur.com/kafTCOb.png)

Once signed in user can peep all they like! A welcome message is displayed upon sign in

![Imgur](http://i.imgur.com/N96woBr.png)

Click sign out to sign out...user will still be able to read peeps when they are not logged in. A goodbye message is displayed

![Imgur](http://i.imgur.com/Nk2IKmb.png)

### Things still to do

Need to tidy up controller
