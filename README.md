Chitter Challenge
=================
Link to original readme:

https://github.com/ahopkins94/chitter-challenge/blob/master/README.md

How to use:

Run ruby app.rb in your terminal and locate the port number e.g. 4567 and in your browser type localhost:portnumber

You can view peeps on the homepage as a non-user

To post a peep you need to sign up or sign in

The code is runs from chitter_manager database and the test code runs from the chitter_manager_test database

For more info on how the tests work, please look in the spec helper

Peep model looks after posting peeps and viewing all peeps. It interacts with the user class to post the name and username in the peep without the user having to type it in themselves

User model looks after signing up, signing in and signing out

Database connection model looks after connecting to the databases and running sql queries

Unfortunately at the moment functionality is missing/incomplete for people not being able to sign up with the same email/username 
