Chitter Challenge
=================

Challenge:
-------
Write a little Twitter clone that will allow users to post messages to a public stream.

Instructions:
-------------

```
git clone git@github.com:mihobo/chitter-challenge.git
cd chitter-challenge
bundle
createdb chitter_development
rspec
rackup
```

* Git clone the link and run bundle install to get the correct and latest gems for this project.
* Create databases for development and/or tests
* Use rspec and/or cucumber to check tests password
* Use rackup to see how your code looks before it goes live


User Stories:
-------------

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

Features:
--------
* Sign up
* Sign in
* Sign out
* Peeping
* Peeps are listed in reverse chronological order
* Peeps are timestamped
* CSS styled

Functionality:
--------------
* All rspec tests pass
* Used data mapper and postgres to save the data
* You don't have to be logged in to see the peeps
* Users sign up to Chitter with their username, email and password
* The username and email are unique
* Use bcrypt to secure the passwords
* You only can peep if you are logged in

Screenshot of Chitter:
----------------------
![Imgur](http://i.imgur.com/90dwLhM.png)

This is the homepage - it lists the peeps that have already been posted, in reverse chronological order with timestamps. There's also a button to post a new peep, along with sign in and sign up buttons.

![Imgur](http://i.imgur.com/qVA5oEa.png)

For new users, they can sign up to peep on this page. New users must provide a username, email, password and matching confirmation password.

![Imgur](http://i.imgur.com/R9Td9fE.png)

This is the sign in page which requires a valid e-mail and password.

![Imgur](http://i.imgur.com/040CvR1.png)

![Imgur](http://i.imgur.com/HQuTb2y.png)

You receive the errors/notifications as shown in the above two images, when providing incorrect information.

![Imgur](http://i.imgur.com/YOZR79n.png)

Once signed in, the user is redirected to the homepage and the username appears in the top right hand corner with a button to sign out.

![Imgur](http://i.imgur.com/jRctCMx.png)

Here, the user can post a new peep to the page and add tags if they want

![Imgur](http://i.imgur.com/zEqoos8.png)

A user can see specifically filtered tagged peeps e.g. table flip, as shown above

![Imgur](http://i.imgur.com/hWGLOIj.png)

When the user logs out, there is a "See you again!" message displayed at the top of the page


Things I'd like to add to my Chitter:
-------------------------------------
* Peeps (posts to chitter) have the username of the user
* Users can reply to a peep from another user
* Better functionality of the buttons and how they appear on each page (hide login buttons when already on the login page, etc)
