Chitter Challenge
=================

I have written this code to complete the challenge below to meet the user stories provided.

I have aimed to solve this challenge using the BDD cycle, with a test driven approach.

Given more time I would have extended the code to include the advanced features. I did however implement a email feature which sends an email to the user
following successful registration.

As the mail client using personal API details to run the code you need will need to provide your own api key by environment variables called MY_API_KEY and mailgun_domain_name.

The project uses the Sinatra framework, and the app is routed through a controller following the MVC framework. I have followed RESTful url naming conventions within the application. User details and peeps are stored in postgres database. I have used an ORM (DataMapper) to communicate with the database.

## Getting started
* git clone git@github.com:Leigan0/chitter-challenge.git
* cd chitter-challenge
* bundle
* rackup
* visit http://localhost:9292/
* or use app on [Heroku](https://lei-chitter-chat.herokuapp.com/)

## Usage

* The website will open at the peeps feed page, before you are able to post a peep you must sign in
* Sign in will validate that you provide a unique username and email address, and password confirmation
* Once signed in, you are able to post a peep
* To post a peep, click link post peep
* To view peeps click link - peeps feed
* To sign out click button sign out

## Technologies used

* Ruby
* HTML
* CSS
* Sinatra
* DataMapper
* orderly
* timecop
* mailgun
* dotenv
* RSpec
* Capybara

Challenge:
-------

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
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
