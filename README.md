CHITTER CHALLENGE

This is a simple clone of a famous social media website.

To run this you will need to set up 2 databases, each with 2 tables. Run the commands below in PSQL.

  - CREATE DATABASE chitter_test;
  - CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(50), real_name VARCHAR(50), user_handle VARCHAR(20), password VARCHAR(20));
  - CREATE TABLE peeps (id SERIAL PRIMARY KEY, timestamp VARCHAR(100), body VARCHAR(500), user_handle VARCHAR(20), real_name VARCHAR(50));
  - 'CREATE DATABASE chitter;
  - CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(50), real_name VARCHAR(50), user_handle VARCHAR(20), password VARCHAR(20));
  - CREATE TABLE peeps (id SERIAL PRIMARY KEY, timestamp VARCHAR(100), body VARCHAR(500), user_handle VARCHAR(20), real_name VARCHAR(50));

  This will create one db purely for passing rspec and capybara tests. The other db is for the live website.

  ---------------------------------

  For this I created 2 classes, Person and Peep (a peep is like a tweet). The functionality of those was very simple. For better or worse, I ended up leaving alot of the code in standalone methods, as opposed to class methods. I wish I hadn't done this now, as it is not particularly great. However, that being said it completely behaves as it should, so I am pretty pleased with the result.

  ----------

  Functionality of the website is as follows:

  Homepage - With signin and signup buttons. Also displays peeps in reverse chronological order with name, username and timestamp.

  Sign up page - here a user can add name, username, email and password to sign up. If the username or password have been used before, it will just go back to the homepage. If they are both new, it will register the data in the database and sign the person in, taking them back to the home page.

  Sign in page - Here it asks for user name and password, if they are a match with something in the database, it will take you back to the homepage, but you will now be signed in.

  Once you are signed in the homepage has an add button and a 'my peeps' button. 

  Add - this will allow you to type in the body of a new peep. It will store it in the database. Once you hit submit, it will take you to the homepage, where your peep will now be visible.

  My peeps - This displays all peeps by the currently logged in user.

  Logout - simple logs the user out.

  -----

  There were other aspects I would like to learn more about, mainly how I can use '.travis.yml'.
