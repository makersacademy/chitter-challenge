# Chitter Challenge
This web application allows users to post 'peeps' to a public stream.
### Features
-Once signed up, users can log in with the correct username and password.
-Any logged in user can post a peep.
-The peep will appear on the peep page with the time and the user that posted it.
-Users can tag peeps with subjects when they post them.
-Users can view all peeps in chronological order or filter by tag.

How to Install
-----
Clone this repository by typing 'git clone https://github.com/jenniferbacon01/chitter-challenge' into your command line.  
To set up the databases in psql, type the following into your command line:  
````
  $ psql
  $ create database chitter_development
  $ create database chitter_test
````
In your command line, 'bundle install' to install all the relevant gems.

How to Run
-----
In your command line:  
````
  $ rackup
````
How to Test
-----
Run all feature tests and unit tests in your command line by typing
````
  $ rackup
````
Tests are available to view in chitter-challenge/spec directory.  

Comments
-----
