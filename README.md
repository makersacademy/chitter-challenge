Chitter Challenge
=================


Challenge:
-------


This project is a small Twitter clone web app that allows users to post messages to a public stream.


[See here](https://github.com/makersacademy/chitter-challenge) for Makers' original repo.


### Getting started
```
Fork or clone this repo:      
`git clone git@github.com:arthurashman/chitter-challenge.git`    
`gem install bundle`     
`bundle`     
```
### Usage

Run server 
`
ruby app.rb
`
or
`
rackup
`

### Testing

`rspec`

## User stories

User Stories:
-------

```sh

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
## Approach

Taking direction from the user stories, broke down the problem into feature tests and used these to build using TDD. For each feature test, I tried to break out smaller unit tests.

