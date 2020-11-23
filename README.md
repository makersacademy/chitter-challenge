# Chitter challenge

This is my solution to [this](https://github.com/makersacademy/chitter-challenge) challenge, in which a "twitter clone" is to be made following the below user stories

## Instructions for use

To use the app, navigate to the directory you want to clone the repo to and enter

```
$ git clone https://github.com/AdamusBG/chitter-challenge.git
$ cd chitter-challenge
$ bundle install
$ psql
```

Now in the psql command line interface

```
=# CREATE DATABASE chitter;
=# \c chitter
```

Now enter the sql lines seen in the db/migrations directory to create the tables and enter '=# quit'

Finally, enter '$ rackup' and go to http://localhost:9292/ in your browser to test the app


## User stories

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


> Class Responsibility Collaborator cards for the above four user stories [here](https://imgur.com/a/tWSZoO1).
