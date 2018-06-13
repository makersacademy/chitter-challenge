
### CHALLENGE

To write a small Twitter clone that will allow the users to post messages to a public stream. This challenge was set 3 weeks into our Makers Course to complete over the weekend.   

### USER STORIES

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

### APPROACH

I used TDD to build each feature. I ended up creating 3 different classes and used PostgreSQL as a database. I used the BCrypt gem to encrypt the usernames and passwords. This was our first week working with a framework and database and so a lot of time was spent familiarising myself with that. If I had more time I would have, created a rakefile, worked on the final feature and used an email API to acheive this. I also would have worked on the CSS and formatting. 

### INSTALLATION AND TESTS

Clone this repo, run: git clone https://github.com/ljcphillips/chitter-challenge.git  
To install all the dependencies, run: bundle install  
To set up the database run brew install postgresql and create two databases, one for testing, using the following PostgreSQL commands  
  - CREATE TABLE peeps (id SERIAL PRIMARY KEY, username VARCHAR(15), message VARCHAR(150), time VARCHAR(60));')  
  - CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(15), email VARCHAR(60), username VARCHAR(15), password TEXT);')  
After setting up, run: rackup config.ru and you will be able to access the app at localhost:9292  
To Test: run rspec
