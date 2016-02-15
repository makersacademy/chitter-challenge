Chitter-Challenge set by MakersAcademy.


Technologies used

Postico to view, monitor and edit databases.
DataMapper to interact between Ruby and PostgreSQL
Framework was Sinatra
Rspec and Capybara for testing
bcrypt for encryption
database_cleaner


Specific user stories given!

Drive the creation of your app using tests - either cucumber or rspec as you prefer.

Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).

The username and email are unique.

Peeps (posts to chitter) have the name of the maker and their user handle.

Use bcrypt to secure the passwords.

Use data mapper and postgres to save the data.

You don't have to be logged in to see the peeps.

You only can peep if you are logged in.

Setting up testing and development environments



In order to use this app, I recommend cloning it, by following these instructions.

$ git clone
https://github.com/ScottGledhill/chitter-challenge.git

$ bundle install

$ psql

$ create database chitter-test;

$ create database chitter-development;

To check tests you may use $ rspec

To run in a localhost setting use $ rackup and visit
 http://localhost:9292/

Created by
Scott Gledhill
