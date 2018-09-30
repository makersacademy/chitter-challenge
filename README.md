Chitter Challenge
=================

This is my proposal for the Makers Academy Weekend Challenge 4: The Chitter Challenge.

Technologies used
----
- Ruby as the programming language
- Sinatra as the framework
- HTML and CSS to create the views of the website

Tests:
- RSpec to create and run the unit tests
- Capybara to create and run the feature tests

Databases:
- Datamapper as the ORM
- PostgreSQL to create the databases
- Rake as the task runner so that other developers can use this app without having to create the databases manually

Setup
----
1. Download this repository.
2. Run _bundle install_ in the command line to make sure all gems are installed.
3. Run _rake setup_ in the command line so that the production and test databases are created.
4. Run _rackup_ or _ruby app.rb_ in the command line to launch the local server.
5. Go to http://localhost:9292 in your browser to see and use the app.

Test with Rspec
-----
1. Open this directory in the command line
2. Run _rspec_ (remember to run _bundle install_ and _rake setup_ beforehand)

What is this challenge about?
----
This program is a small version of Twitter, where users can post messages so that everyone can read them:

-You can see all messages posted in descending chronological order
-You can sign up by creating your own account with your own credentials
-You can log in
-You can log out
-You can post a message (you have to be logged in in order to be able to do so)

Approach to solve the challenge
----
To solve the challenge, the following structure has been implemented:
- A Rake file to create the two databases used: the production (chitter) and the test database (chitter_test).
- A lib folder with the models(classes): a User and a Message class, together with the DataMapper and Models files to set up Datamapper:
    - The User class is connected to a table called "Users" in the database. It stores stores the credentials of the user (name, email, username and password).
    - The Message is connected to a table called "Messages". It stores the message texts posted, their timestamp and the user ID of the person who posted it.
- A views folder
- A public folder with the .css file
- An app.rb file as the controler
- A spec folder with all our tests (feature and unit tests)

Challenge instructions
-------

Full instructions [here](https://github.com/makersacademy/chitter-challenge)

User Stories
-------

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
```
