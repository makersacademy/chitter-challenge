Chitter Challenge
=================

## Client Request

## How to use
git clone git@github.com:Stegosauruss/chitter-challenge.git
bundle install
rake setup
rake migrate
rspec
rackup

## User Stories

### Viewing Messages
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
At first I hard coded the peeps but then added databases for production and testing. Timestamping the peeps seemed more tricky so I used the id as a quick fix at first.

### Posting Messages
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
This one was pretty straightforward as it was very similar to the weekly challenge.

### Including Dates
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
I had already put a timestamp into my tables however converting this into a time object so that I could play around with the format was a little more tricky. Testing can also be quite difficult for time. If I get time I will add tests in for this feature.

### Logging in
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
I added registration but still have to add authentication.

## Changes to Implement
Full testing for timestamps
Authentication
css