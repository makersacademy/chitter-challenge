Chitter Challenge
=================

Challenge is to create a twitter clone based on the meeting the following user expectations:

Features:
-------

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

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```


Currently implemented:

* User can sign up and a record is created within the database
* User can sign in with correct credentials, but if an incorrect password or email is given they are redirected.
* 'Peeps' can be created and are displayed with time of creation on the 'peeps' index.
* All peeps can be seen regardless of who is logged in.
* User can only sign up with a unique email address (not already in database)
* Users must supply matching password confirmation in order to sign up
* displaying the peeps in reverse chronological order


I want to implement:

* Allowing a user to log out
* only allowing a user to 'peep' if they're logged in
* displaying the username next to the peep
* displaying the time the peep was created in a more legible fashion
* making the flow more user friendly - peeps should be visible on index & there should be a sign up/ log in button there. Once logged in a button should appear for 'Write a peep' or something similar.
* styling the application!



Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!
