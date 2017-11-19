# Chitter Challenge

This project is live [here](https://afternoon-inlet-98969.herokuapp.com/).
---
The following user stories have been implemented in this application.
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
To run this app locally, run
```
$ git clone https://github.com/cazwazacz/chitter-challenge.git
```
Then once in the project directory, run
```
$ bundle
$ rackup
```
And visit localhost:9292 in your browser.

To run tests, run
```
$ rspec
```

To do
---
- Implement functionality to email user their password token
- Implement functionality to be 'mentioned' in peeps and received an email
