Chitter Challenge AKA The Rumour Mill
=================
## Challenge:

This is a small Twitter clone that will allow the users to post messages to a public stream.
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

+------------+         +----------+      +----------+     +-----------+      +---------+
|            |all peeps|          |all peeps        |all peeps        |all peeps       |
|            +-------> |          +----> |          +---> |           +----> |         |
| Database   |         | peeps.rb |      |  app.rb  |     | index.erb |      |  user   |
|(postgreSQL)|         |          |      |          |     |           |      |         |
|            |  user   |          |user  |          |user |           |user  |         |
|            |  input  |          |input |          |input|           |input |         |
|            | <-------+          | <----+          | <---+           | <----+         |
+------------+         +----------+      +----------+     +-----------+      +---------+


As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter


```

## Instructions to use:
Open terminal in your computer
```
git clone https://github.com/AlexMcCarroll/chitter-challenge.git
cd chitter-challenge
bundle install
rake setup
rake test_environment
```
In order to test it run ```rspec```.

To run the programme in ```localhost:``` run ```rerun app.rb``` in your terminal.

Now, go to ```localhost:``` in your browser and enter in the ```port``` digits
given in your terminal.

For example: ```port=4567``` therefore, enter ```localhost:4567``` in browser.
