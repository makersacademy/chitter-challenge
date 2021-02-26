# Chitter Challenge #

My answer to the almighty Chitter Challenge! I have created a Twitter clone that fulfils the following use stories:

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

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
## How to use Chitter to grace the Social Skies ##

You can use the app here on Heroku:

???

Alternatively, you're also welcome to clone this repo and play around with it. Make sure to follow these steps first:

1. Connect to ```psql```
2. Create two databases with these ```psql``` commmands:
  ```CREATE DATABASE chitter;```
  ```CREATE DATABASE chitter_test;```
3. Connect to the databases, one by one, using the ```psql``` commands:
  ```\c chitter;```
  ```\c chitter_test;```
4. Run the query listed in the ```01_create_chitter_table.sql``` file within the db/migrations directory.

You can then run the web app on your local machine with this command:
```rackup -p 4567```
