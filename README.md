Chitter Challenge
=================

I am are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Functionality:
------------------

* Users can sign up using their email, username and password.
* All usernames and emails have to be unique.
* Peeps can be posted by all users that have signed in.
* All peeps display a Date/Time of posting along with the username of the user who posted them.
* Bcrypt was used to secure passwords.
* SQL databases and DataMapper is used to save data.
* Users don't have to be logged in to view the peeps.

Technologies Used:
------------------

* The application was codded in Ruby using Sinatra
* Rspec and Caypybara were used for testing
* DataMapper was used to save data to tables
* Sinatra-flash was used to display error messages and notices
* Sinatra-partial was used to refactor code

Instructions on installing and running tests :
----------------------------------------------

Clone this repo and use Rackup to run the app on your localhost. Once cloned you can also check tests by running RSpec in the root folder of this app in terminal.
