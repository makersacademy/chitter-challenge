Chitter Challenge
=================

Challenge:
-------

Create a clone of Twitter, called Chitter! Users should be able to sign up, log in and post 'peeps'

Installation:
-------

* Start by forking the repository on Github and cloning locally.
* Install bundler (if not already installed) and run the command 'bundle' to install the gem dependancies
* Create two databases for the test and development environments called 'chitter_test' and 'chitter_development'      respectively
* Run the rake command 'rake db:auto_upgrade' and  'rake db:auto_upgrade RACK_ENV=test' to update the databases with the appropriate data schema as per the models.
* Run the 'rackup' command to start the sinatra server, and visit the project at localhost at the port specified by rackup


Features:
-------

The home page displays all current peeps, but the user won't be able to send peeps until they are signed in.

![Screenshot](https://www.dropbox.com/s/pc6c9a216cnt3ct/Screenshot%202016-02-15%2011.30.23.png?dl=0)

To sign up a user clicks the signup button in the header, and is taken to the signup page where they enter their name, username, email, password and password confirmation.

![Screenshot](https://www.dropbox.com/s/mhn0nqg91jmbtud/Screenshot%202016-02-15%2011.32.58.png?dl=0)

When a user has signed in they are greeted with their name then able to create peeps to be displayed on the page

![Screenshot](https://www.dropbox.com/s/s6hn6aj077rw44w/Screenshot%202016-02-15%2011.36.34.png?dl=0)

Peeps are displayed in reverse chronological order with a timestamp and the name and username of the peeper.

Features to add:
-------

* Improve the functionality to allow users to reply to the peeps of other users, and delete peeps that they have posted
* Improve the user experience so that users will only see the signin/up buttons if they are not signed in, and the      signout buttons if they are signed in.
* Add a 'forgot password?' service so that users can recieve a link to reset their password if they've forgotten.

Technologies used:
-------

* Sinatra and rack for the server
* PostgreSQL and DataMapper for the database
* BCrypt gem to encrypt Passwords
* Rake
* Rspec/Capybara for testing, along with Coveralls and Travis CI
