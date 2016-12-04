# Chitter Challenge

## Brief
Create a Twitter clone with a stripped-down featureset. [Find it online here](https://serene-lake-95161.herokuapp.com/).

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
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Approach
Two classes were created for this app:

* User: stores identifying user data. Required in order to send peeps.
* Peep: a short message that users can post (like a tweet).

The classes are created as tables in the database with DataMapper. The app is tested with RSpec. So that the database doesn't get dirty whenever tests are run, DatabaseCleaner was used to truncate the database before the suite was run, and then rollback transactions after each example.

However, to check during development that that data were persisting in the database, Rack was used to switch databases depending on environment: dev, test, or production.

The web server for this project is Sinatra.

## How to Install
Download or clone this repo to your local machine then run `bundle install`. You may need to set your version of Ruby to match the version specified in the Gemfile.

You will need to create two Postgres databases locally: chitter_development and chitter_test.

## Getting Started
First, you will need to create your database schemae. Run `rake db:auto_migrate` on first run to set up a clean development database. Append `RACK_ENV=test` to that command to set up the test database.

If you make any changes to the models, it is recommended that you run `rake db:auto_upgrade` to non-destructively update your databases. However, if you make major changes to the models you will need to migrate and lose your data.

To launch the app, run `ruby app/app.rb`. This will launch the app; navigate to `localhost:4567` (or whatever port you've set Sinatra to run on) to see it.

You should see a screen like this:

![chitter screenshot](http://i.imgur.com/dgEk5ry.png)

Navigate to `/users/new`, fill in and submit the form and you're ready to start peeping!
