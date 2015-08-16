Chitter
=================

This is my fourth weekend challenge while at Makers Academy. After a week of learning how to use an ORM to connect domain models up to a SQL database the challenge was to make **Chitter**. A clone of twitter that allows users to post messages to a public stream.

Technologies used
-----------------

Application is written in ruby and runs on a Sinatra. Datamapper has been used for the ORM and postgres as the SQL database. Bcrypt is used to salt and hash the passwords. For testing rspec and capybara with Factory Girl for testing database models, and also timecop and ordely gems for testing tine and order of posts peeps are correct.

Sinatra has been set up in a modulare style with a module per controller inhereting from a Base class. The main sinatra server file app.rb requires and routes the controller modules.

HTMl and CSS have been used on the front end.


Installation guidelines
-----------------

Clone this directory. Requirements are that you have RVM, Homebrew and Bundle. Postgres database is also required with two databases set up. Chitter_development and Chitter_test. Once installed run bundle. You can then use Sinatra rackup to launch the app.


User Stories
------------

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


* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.

