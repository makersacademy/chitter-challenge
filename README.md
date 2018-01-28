Chitter Challenge
==================

Week 4 weekend challenge to create a web app that allows a user to mindlessly blurt their thoughts all over the internet.

Requirements 
-------

#### Running locally for development:

+ PostgreSQL installed
+ A local postgres database named 'chitter_development'
+ Major gems:
  + gem 'data_mapper': ORM to talk to database
  + gem 'dm-postgres-adapter': Adapter for postgres database
  + gem 'sinatra': DSL which sits on top of rack webserver
  + gem 'sinatra-flash': Displays dynamic messages on pages 

All gem requirements can be installed by installing the bundler gem (`gem install bundle`) and then running `bundle install` in the project directory.

#### Using the deployed app on heroku: 
+ None

User Stories implemented
-------

```
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```



Instructions
-------

#### Running locally for development:

- Launch the site: run `rackup` in the project root folder
- Navigate to  http://localhost:9292 in your browser


#### Using the deployed app on heroku: 

+ Visit the webpage: https://infinite-river-43450.herokuapp.com

#### Once the app is launched:

+ You'll see your homepage with a feed of existing peeps
+ Click 'Sign in' button to log into your account to begin posting peeps
+ If you don't have an account, you'll see a button ('Sign up') which will allow you to register. Ensure you pick a unique username and email address.
+ Once you're signed in, peep away!