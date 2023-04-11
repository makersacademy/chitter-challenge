# _Chitter Challenge_

#### By _**Sidra Iqbal, adapted from Makers Academy**_

Technologies Used
-----

* Ruby
* CSS
* HTML
* Postgresql
* Sinatra

Description:
-------

This project is designed to mimic the popular 'Twitter' app for Makers student use. Chitter will have basic functionality like: creating peeps, viewing peeps (including the time of peep in chronological order), as well as login, sign-up and logout capabilities. 

The user should have visibility to the login and register links when they are not logged in and similarly only have visibility to the sign-out link when they are logged in, to give a positive user experience. 

Features:
-------

* Register: User can register to Chitter with their email and create an account with a username and password. 
* Login: User can login to their account from the homepage by entering their email address and password.
* Logout: User can logout from the homepage by clicking on the logout link. 
* New Peep: Logged in user can have the option to create a new peep by clicking the new peep link on the homepage, where they are directed to the /new_peep page and can submit a peep
* View Peeps: Irrespective of logged in status, peeps will be shown on the homepage in order of the most recent peep first. The peep contents and time are shown on the homepage.

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Dependencies
------

Ruby Gems:
```ruby
gem "sinatra", "~> 3.0"
gem "sinatra-contrib", "~> 3.0"
gem "webrick", "~> 1.8"
gem "rack-test", "~> 2.1"
gem 'bcrypt', '~> 3.1.7'
gem "pg", "~> 1.4"
```