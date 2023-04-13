Chitter
=======

Demo: https://chitter-xylv.onrender.com/

Technologies used:
------------------
* HTML
* CSS
* Ruby
* Sinatra
* PostgreSQL
* RSpec
* Bcrypt  

Features:
---------
Users can:
* Sign up
* Login
* Logout
* Create a new peep

Additionally:
* Peeps can be viewed by guests
* Peeps are ordered by most recent
* Peeps display the author's full name, username and posted date
* Usernames and email addresses must be unique
* Passwords are encrypted via Bcrypt for database storage
* Current page is highlighted in the navigation
* Basic form validation

Installation:
-------------
* bundle install
* Database schema can be found in `recipes/tables_recipe.md`
* Seeds can be found in `spec/seeds`
* rackup

Access via http://localhost:9292