## Chitter Challenge

This is a small Twitter clone that will allow the users to post messages to a public stream. It is a Ruby app using the Sinatra framework (Modular style), with PostgreSQL database and ActiveRecord ORM.

### Premise
The fourth weekend challenge of [Makers Academy](https://makers.tech/) bootcamp, the goal was to satisfy these user stories:

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter


#--------------------------------- haven't done these ones yet
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

I wrote this app in the MVC pattern.
My plan:
![class diagram](/public/class_uml.png)

The model part of the MVC is taken care of by the ORM ActiveRecord. This meant I didn't need to write any code to access the database or wrap data from there.  The controller is in `app.rb`, it holds all the Sinatra routes.  I used a `layout.erb` file to set CSS styling for all the view pages.

Testing is done using Rspec with Capybara for feature tests. I wrote it using TDD/BDD so it's fully tested.

The app currently looks like this:  
![progress so far](/public/end_of_weekend.png)

### How to install the app, set up databases and run tests
* Make sure bundler is installed
* Run `bundle` to install all the gems from the Gemfile
* Run `rake db:create` to create the test and development databases
* Run `rake db:migrate` to create the correct tables in the development database
* Run `rake db:migrate RACK_ENV="test"` to do the same for the test database
* Run `rspec` to run the tests and make sure it's working
* Run `rackup` or `ruby app.rb` to run the app on localhost. Optionally specify which port to use like `rackup -p 3000`
* In a client (browser) go to `localhost:3000` or whatever the port used is, to play with the app

I didn't write any seed files, so there is no data to populate the database with to start. The test database is cleaned out before each test anyway.

### Known problems
Aside from the inability to log out, I have not implemented any validation or edge cases! eg checking if a password is valid, an email address is already being used, can't log in twice etc.
