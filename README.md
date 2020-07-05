# Chitter Challenge

#### Instructions

To make a Peep, a user visits the root page, enters their name and their message and then hits submit. The Peep will appear on the 'chitter-board' page. The Peeps appear in reverse chronological order, and you can see the timestamp and the user name.

#### Tests

To run the tests, you will need to set up a test database. To do so, create a database called 'chitter_test_db', containing a table called 'messages'.

The messages table will have the following column names, and datatypes:

* id = SERIAL PRIMARY KEY
* name = VARCHAR
* message = VARCHAR
* timestamp = TIMESTAMP

#### Notes on functionality

Currently, the app will only display the name of the user, their message and the time that they created it.

This does not fulfil the last user story - that a user should be able to 'sign up' for Chitter. I basically ran out of time and energy to fulfill this last requirement! If I was to implement that feature, this is how I think I would do it:

* Create a table within chitter_db called 'users'
* It would contain columns for id, name, username, email and password.
* Instead of asking for a name and a message, the root page would simply display both 'sign up' and 'log in' buttons.
* 'Sign up' would take you to a page with text fields for all of the required data. The program would then check the 'email' and 'username' inputs against the database and throw an error if either of them existed already, and prompt the user to try again. If successful, their details would be added to the database, and a session variable 'session_user' would be set to their unique id. They are then taken to the 'chitter_board' page, and can enter a message to post. When they post a Peep, they do not have to enter their name, as the details displayed along with their message would be read from the database using the 'session_user' variable.
* 'Log in' would take you to a page that would you to a page with 'username' and 'password' fields. When you hit submit, the username is checked against the database. If it exists, the password is then checked to see if it is correct. If either of these steps fail, the relevant error message is displayed.
