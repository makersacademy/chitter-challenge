Chitter
=================
## Introduction
This is a little website application where you can post your message and thoughts for public.

## How to use
You need to sign up and sign in to post.
But, you can view all the posts without signing up or signing in.

## How to install
Please do the following:
In your terminal
```
$ git clone https://github.com/nfabacus/chitter-challenge.git
$ bundle
```
Go to your psql from your terminal,
- create db chitter_development
- create db chitter_test
Then, in terminal
```
$ rake auto_migrate
$ rspec
$ rackup
```
Enjoy!

## User Stories based which this application was made

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
## Notes
This application was made by Noby Fujioka as one of the Makers Academy weekend challenge assignments.
