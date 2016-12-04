Chitter Application
==================

Introduction
-------
The Chitter application is the fourth weekend challenge at Makers Academy in London. The challenge was to build an application that could handle a user sign up system that would allow users to post peeps to a 'Peep Board'. I have built the application in a test driven approach using RSpec and Capybara. I built my application via the Sinatra framework and the intent was to implement techniques related to relational database mapping. I have used DataMapper and Postgres as the adapter to set up my database. I have added client and database validation to the application in order to enhance user security.


You can check out the application via https://stark-coast-79964.herokuapp.com/users

Features that have been implemented:
-------

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Features that are yet to be implemented:
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

Installation
-----
* Run the command 'bundle install' in the project directory to ensure you have all the gems.


Technologies used
-----
* PostgreSQL database
* DataMapper
* Sinatra framework
* Database Cleaner
* RSpec & Capybara testing
* Heroku for web hosting


Areas to improve
-----
* Styling and front-end need a lot of work.
* Reverse chronological order of peep board needs implementing.
* Need to use one-to-many database relationship between Peep and User.
