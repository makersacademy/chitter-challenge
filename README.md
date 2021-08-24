Chitter Challenge
=================

Challenge:
-------

Write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------------------------------------------------------------------------------------------------------------

```
USER_STORIES

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

Setup:
------------------------------------------------------------------------------------------------------------

To implement this app you will need to install two databases on your computer. To do this follow these steps: 

1. ### Install gems 
   
   * Run bundle install inside project directory
   
2. ### Creating the databases

To setup the databases for production and testing, also run:

* psql \i <then the FULL PATH to the two files found in db/migrations>
   

3. ### Testing 

  * run the command 'rackup' to start the server 

  * visit localhost:9292 to checkout the app ! 
  
  
  Further_features to add later:
  ------------------------------------------------------------------------------------------------------------
  
  * Users can add their username, password and name to sign_up form 
  * Would like to verify the email address is real
  * Add the user that posts a tweet 
  * Create login and log out function 
  * Send emails when usernames are tagged in "cheet" 
  * Use more HTML syntax and CSS to create a jazzy looking website 
