[![Build Status](https://travis-ci.org/michaellennox/chitter-challenge.svg)](https://travis-ci.org/michaellennox/chitter-challenge)

#Chitter Challenge

This is my solution for the [Chitter Challenge](https://github.com/michaellennox/chitter-challenge/blob/master/MAKERS_README.md) carried out at the end of my fourth week at Makers' Academy. It's a basic twitter clone which people can leave messages on.

##How I worked

I aimed to complete this challenge in a test driven manner, using automated feature and unit tests with rspec and capybara. I created feature tests using capybara to test how a user would interact with the app, I tested model logic by creating unit tests with rspec for each class.

##Installation Instructions

Clone the game from github and move into the directory from the command line, bundle all requirements with `bundle` then set up the database.

```
$ git clone https://github.com/michaellennox/chitter-challenge
$ cd chitter-challenge
$ bundle
$ createdb chitter_development
$ rake db:auto_migrate
```

Start the server with rack.

```
$ rackup
```

Go to http://localhost:9292/ in your browser, you can log in and start leaving messages!

Enjoy!

##Usage Instructions

You can either interact with this on your own machine or on the web at [chitter.michaellennox.me](http://chitter.michaellennox.me/).

When you first arrive at Chitter it should look like as follows

![chitter-page](http://i.imgur.com/AAFmbZM.png)

In the centre are peeps left by other people, you can sign in to your account if you have one on the right, or sign up if you don't.

Once you're signed in, press Peep a Peep to get to the peep creation screen, write what you want and then post away!

##Brief

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

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

###Notes on Functinoality

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution. However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

###Bonus level

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).
