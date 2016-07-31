Chitter Challenge
=================

A bootstrapped version of the popular social media website Twitter.

## Prerequisites
* Postgres

## Instructions
Clone the repository from github and then cd into the cloned directory.
```
$ git clone git@github.com:mannieg/chitter-challenge.git
$ cd chitter-challenge
```
Load dependencies with bundle.
```
$ gem install bundle
$ bundle
```
Create the following databases in Postgres.
```
$ psql
$ CREATE DATABASE chitter_development
```
Launch web server.
```
$ rackup -p 4567
```

![Screenshot](https://www.dropbox.com/s/643tqj74a5pwo6i/peeps.png?dl=0)

![Screenshot](https://www.dropbox.com/s/hadb5olcn9ernyr/signup.png?dl=0)

User Stories:
-------

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
