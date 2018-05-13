Chitter Challenge
=================

Task:
-----

We are going to write a small Twitter clone that will allow the users to post messages to a public stream. The aim of this weekend challenge was to implement our newly gained knowledge of databases into the context of a basic web app that mocked the functionality of twitter. This would be done with the usual TDD approach and would combine all previously learned skills in Ruby, Sinatra, Rspec/Capybara, and PostgreSQL.

Approach:
---------

My approach was to start with the basic set up, installing all the relevant gems, creating all the directories etc. I wrote a small plan of how my database would look, and how it would interact with the model within the app.

I ended up with two separate databases, and two separate classes. One for Peeps, and one for Users. Currently the two databases do not really talk to each other, which I believe was intended upon completion of the task.

I have implemented sign up functionality, which then allows a user to log in and write a peep. Without signing up or logging in, the user cannot write a peep. After signing up or logging in, the user can log out, refreshing the homepage so that the user can no longer write peeps. All the peeps are displayed on the homepage in reverse chronological order and have time stamps.

The app has some very basic inline html styling so it is not so boring!

This task allowed me to solidify my understanding of how databases can interact with Ruby within a sinatra application, and I found the challenge of implementing log in and log out functionality very fun and rewarding, as I managed to get it working (albeit somewhat primitively), without any form of external help.

Currently this application has 100% test coverage and raises 0 offences with rubocop, that picky, but wonderful little gem.

User Stories:
-------

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

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Instructions:
------------
Run
```sh
bundle install
```

Use rackup to open the app in the web browser
```sh
rackup config.ru
```

Enter the local-host into your web browser to start the game
```sh
http://localhost:9292
```
