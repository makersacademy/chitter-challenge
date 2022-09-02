Chitter Challenge 
=================

Task:
=================
Create a Twitter clone that will allow the users to post messages to a public stream.

Technologies used: Ruby, Sinatra, Postgresql, Capybara, Rspec

###User stories:
=================
```
As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Installing, testing and running the app:
------

* Clone this repo
* Run `gem install bundler` then `bundle` to install the gems used by the app
* Run `brew install postgresql` to install postgresql
* Create the `chitter_test` databases in postgresql

* Run `rspec` to run the tests

* Run `rackup` to start the server and app
* Visit [http://localhost:9292](http://localhost:9292) to use the app

Interacting with the app:
-----
When you enter the homepage you are presented with an option to create an account / log in. Click `sign up` to register a new account.

When you have logged in, enter a message on the left hand side and hit `tweet` to submit it

Your message will now appear in the list of chitter tweets.

You can tag other users in your post - any user tagged in a tweet will be notified via email.