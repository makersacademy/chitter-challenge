Chitter Challenge
==================

Week 4 weekend challenge to create a web app that allows a user to mindlessly blurt their thoughts all over the internet.

Requirements 
-------

Running locally for development:

+ PostgreSQL installed
+ A local postgres database named 'chitter_development'
+ gem 'dm-postgres-adapter': 
+ gem 'sinatra': DSL which sits on top of rack webserver
+ gem 'sinatra-flash': Displays dynamic messages on pages 

All gem requirements can be installed by installing the bundler gem (`gem install bundle`) and then running `bundle install` in the project directory.

Using the deployed app on heroku: None

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

- Launch the site: run `rackup` in the project root folder
- Navigate to the site by navigating to http://localhost:9292 in your browser
- Enter at least one player name. To play against the CPU, just press Submit. To play multiplayer, check 'Multiplayer?' and add a second player name.
- Choose your move! (If multiplayer, player 2 should look away. Once player 1 has chosen, the players will swap so p2 can make a move)
- The result will be displayed on the screen. Click 'New game' to start a new game of Rock, Paper, Scissors

+ https://infinite-river-43450.herokuapp.com/

