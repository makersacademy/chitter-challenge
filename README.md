## Bernard's Chitter

# Domain Model

Made domain model on draw.io, plan to start with Users and Peeps databases.

# Database Setup

Create database in postgres with "CREATE DATABASE dbname;" and run the sql commands found in db/migrations to setup the dev database.

# Process

Created database and test database with users and peeps see migrations.
With dev and test databases setup and table init's placed into migrations, I'm ready to start test driving some features. 

Test drove posting messages or 'peeps' and them showing up on screen by sending form to post route where PG talked to the 
databases, creating entries and reading them. This logic was refactored into a Peep class in the model.

In the time available I managed to get messages showing in reverse order with date posted, and implemented a user sign up which 
stores entry in a users table.

If time permitted, the next steps would be to have current user logged in's user id attached to their message, and their name
to be shown by the peep message from a table join.

The passwords are stored in plain text which is wrong, but yet to move onto how to encrypt passwords.