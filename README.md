Chitter Challenge
=================

I've rebranded my app as PeepShow since this seemed appropriate. It runs on
Sinatra with a PostgreSQL database and DataMapper ORM. I used RSpec, Capybara
and FactoryGirl for testing the code. It's styled with CSS.

Users can sign up, log in, log out. Emails and handles (ie usernames) have to
be unique. The passwords are encrypted using BCrypt. I haven't implemented
password confirmation or recovery.

Anyone can view the peeps but you have to be logged in to peep yourself. Peeps
are displayed in reverse chronological order with a timestamp and the peeper's
name and handle.

The database comprises two tables, peeps and users, with a many-to-one relation
from the former to the latter. The pages are served up in two halves, a top box
that varies depending on the router logic, and list of all peeps below it.

Next on the to-do list is implementing a reply function.
