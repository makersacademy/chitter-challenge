#Chitter Challenge - Weekend Wk 4

- As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

- As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

- As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

- As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

- As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

- As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made


#Issues

- A feature test that I wanted to write (comparing the password on the database with that provided by the current user) was beyond my reach.

In order to pass the less robust test that I ended up going with I disabled the 'after' block of the Database Cleaner in my spec_helper file, so that my test had something to match against. This was not ideal but I couldn't figure out a way around it yet.

#Things I would like to implement given more time.

- Error message when blank fields are submitted.

- Avoidance of double login.
