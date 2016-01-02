Chitter Challenge
=================

Author: Emma Beynon

Github: https://github.com/emmabeynon

Email: emma.beynon@gmail.com


This is my submission for the Makers Academy Week 4 Weekend Challenge: https://github.com/makersacademy/chitter-challenge

Overview
---------
We have been asked to create a Twitter clone (Chitter) that will allow users to post messages to a public stream.  Users sign up to chitter with their email, password, name and a user name, and the username and email must be unique.  Users don't have to be logged in to see the peeps, however you only can peep if you are logged in.

User Stories
------------

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

Instructions
------------
1. Fork this repo and clone to your local machine.
2. Run ```gem install bundle```
3. Once installation is complete, run ```bundle```
4. Create a .env file in your root directory and input ```RACK_ENV=development```.  Make sure you add this file to .gitignore.
5. Run ```psql``` and create the following databases: ```chitter_development```, ```chitter_test```.
6. To view locally, run ```rackup``` or use your preferred interface. View at: http://localhost:9292
7. To run the tests, run ```rspec``` in the root directory.

Approach
---------
This project was test-driven using RSpec and Capybara to test user interaction.  I started by creating a simple sign-up form to satisfy the first user story.  In order to store the details entered in the sign-up form I created a development and test database with a users table, and used DataMapper to map between the programme and the databases.  At this point I employed the BCrypt gem to ensure that the password is stored securely as a salted hash.  After signing in, the user is displayed a welcome message featuring their username.  If the user enters a mismatching password confirmation then an error is displayed and they are unable to proceed with the sign up process.  Additionally if the user attempts to sign up with an email address or username that is already in use, then an error is displayed and they are unable to sign up.  

With many tests being run already at this point, I decided to use Database Cleaner to remove the contents of the test database after every set of tests is run and ensure it doesn't become too messy.  Next I created log in functionality for users, with a welcome message displayed after successful login.  I then created authentication functionality so that a user can only log in if they enter the correct email address and password.  If they do not, an error message is shown and they are unable to proceed.  The final piece of user management work was to create a log out button that invalidates the session for the user logging out. When the user logs out, they see a goodbye message confirming they have logged out.

This last piece of functionality is very important for the next step, which is to allow users to post messages to Chitter.  Users should only be able to post a message when they are logged in, so it was important to get the log out functionality right.  I created a simple form for logged in users to post their message, and an error is displayed if a logged out user tries to do so.  If the user successfully posts their message, then it is stored in the messages table of the database and displayed on the page.  In order to identify who has posted which message, I edited the display of the message to include the user's name and username.  Then, I added a time column to the messages table to store the time the message was posted.  I also added this to the display of the message, and altered the sorting of the table so that the messages display in reverse chronological order

Finally, in order to make navigation a bit easier in this programme, I created a homepage with buttons directing users to sign up, log in or view messages.


Further Work
-------------
