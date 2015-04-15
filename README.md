Chitter Challenge
=================

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
```

I used Rspec and capybara for testing, sinatra to run the server, and DataMapper/Postgres to handle databases. To install, just run bundle in the root directory.

To run the tests, run rake in the root directory.

If deploying, bear in mind you will need to set up postgres on the server. 
