Chitter Challenge
=================

Week four weekend challenge at Makers Academy: write a little Twitter clone that can allow users to post messages to a public stream.

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

Functionality I plan to implement:
------------------
* Users can sign up using their email, username and password
* All usernames and emails have to be unique
* Peeps can be posted by all users that have signed in
* All peeps display a Date/Time of posting along with the username of the user who posted them
* Users don't have to be logged in to view the peeps

Technologies Used:
------------------
* The application was codded in Ruby using Sinatra
* Rspec and Caypybara were used for testing
* DataMapper was used to save data to tables
* Sinatra-flash was used to display error messages and notices
* Sinatra-partial was used to refactor code

Progress:
------------------
So far I have created the following features with passing tests:
* user can sign up
* user gets sign up confirmation and welcome message
* passwords are checked when logging in
* users cannot signup with emails and passwords that have already been taken
* email and passwords are required before a suer is able to sign up
* Bcrypt was used to secure passwords
* PostgreSQL and DataMapper is used to save data
* users can sign in
* users can log out 

Improvements: 

I am currently working on peeps and the ability for users to post peeps and reply to peeps. I would also like users to be able to sign back in once signed out. Lastly, some CSS is required to make the app look more appealing. 

Instructions on installing and running tests :
----------------------------------------------
Clone this repository:
```
$ git clone https://github.com/catherinestevenson/chitter-challenge
```
Once cloned change into the directory and run bundle install to install all gems. 
```
$ cd chitter-challenge
$ bundle install
```
You can then use RSpec to check tests:
```
$ rspec
```
To run the app on your localhost browser use rackup and open the application on your browser, eg: http://localhost:9292 :
```
$ rackup
```
