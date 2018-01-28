# Chitter Challenge
-
This was an exercise in creating a Twitter clone written in Ruby and HTML using Sinatra and the [DataMapper gem](http://datamapper.org/) in ruby to access a PostgresSQL database. The test framework uses the [orderly](https://github.com/jmondo/orderly/blob/master/README.md) and [timecop](https://github.com/travisjeffery/timecop) gems in order to test the chronological aspect of the app.

It uses Capybara and Rspec for testing, with database cleaning functionality provided by Rake.

The app is hosted online using Heroku and is available [here](https://glacial-meadow-18204.herokuapp.com/users/new)

The app fulfills the following user stories:

```

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

Use the following commands to get set up, run the tests and run the app locally:

```

$ git clone https://github.com/edpe/chitter_challenge
$ bundle
$ createdb chitter_test
$ createdb chitter_development
$ rspec
$ rackup
```

If necessary, the database can be purged using the command:
```
rake db:auto_migrate
```
