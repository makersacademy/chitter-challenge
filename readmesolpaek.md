*README*

the first thing that we must do is install the necessary gems to complete this
challenge. i have added the following gems to my gemfile:
sinatra, pg, capybara, and rspec
these will be necessary in order to create an interactive web environment, one
that can be accessed and tested appropriately.

on to the user stories:

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

this app is set to interact with the table 'chitter' within the database chitter

using Chitter.post("message") will add a new row to the chitter table, with a new
id and the message will be stored in the message column.
