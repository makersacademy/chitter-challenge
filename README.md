Chitter Challenge
=================


Description
---------

The fourth weekend challenge for Makers involved creating my own version of Twiiter called Chitter. I used the Sinatra framework to create this web application alongside postgresql to generate the databases. Worked with Http Get requests to display the correct data from my erb files and Post requests to send the relevant data to said databases.  

User stories
-------

```
As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that only I can post messages on Chitter as me
I want to log in to Chitter

```

How to run
-------

1. Clone this repo to your local machine
2. cd into the directory
3. Run rackup in your terminal to initiate the server
4. On your browser go to the localhost port displayed in the terminal
5. Now you will be on Chitter!!

Tests
-----

- The Rspec gem is used to create the tests
- rspec can be installed by running gem install rspec in your terminal
- cd into the chitter challenge repo
- type rspec in the terminall to run the tests
