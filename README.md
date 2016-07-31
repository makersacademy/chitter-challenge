# **Chitter Challenge**
=================

A little Twitter clone that allows users to post status updates (peeps) to a public stream. Users can view this stream but must be signed up and logged in to chitter to post a peep.

##### https://chitter-clone.herokuapp.com #####

![chitter screen 2](https://cloud.githubusercontent.com/assets/18379191/17279754/9e8bbd3c-5774-11e6-9dfd-0f008edb15f8.png)

Instructions:
-------
* Clone the repo to your own computer with the following command:
```
git clone git@github.com:richo225/chitter-challenge.git
```
* Run bundle to make sure you have the required gems and are using the same ruby version:
```
bundle
```
* Create a test and/or development database on your own computer:
```
createdb chitter_test
createdb chitter_development
```
* Run Rspec and check that all the tests are passing.
* Run the chitter program through sinatra and have fun:
```
ruby app/app.rb
```

User stories:
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
Outlook:
------
* Validate password with a "confirm password" field or replace it with a "forgotten password" link.
* Throw an error if a user trues to sign up with an already taken email-address.
* Finish off styling of buttons
* Extra user story? => In order to start a conversation as a maker I want to reply to a peep from another maker.
