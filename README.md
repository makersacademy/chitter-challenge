## Chitter Challenge ##

### How to use ###
- Fork this repo
- Run ```bundle install```
- Set up databases (file database_setup for instructions)
- To start the server, from the command line run the program either straight from the ruby file or using rackup. Visit the site on localhost:4567 or localhost:9292 respectively.  

### My approach ###
This program replicates Twitter: Users are able to sign-up and post 'peeps', and view other users' peeps. This web application was built using Ruby, Sinatra, and PostgreSQL databases. Tests were written using RSpec and Capybara.

### User stories implemented ###
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
```
