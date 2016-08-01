Chitter Challenge
=================

This is Chitter Challenge, a social media clone created as the fourth weekend challenge at Makers Academy.

![Screenshot](https://github.com/lukew244/chitter-challenge/blob/master/app/public/Screenshot.png)

* Users can sign up to chitter with their email, password, name and a user name.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker's user handle.
* Comments can be viewed by anyone, but can only be posted by signed in users.
* Signed in users can also post replies.

To install:

```
git clone https://github.com/lukew244/chitter-challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup

```


The user stories for this app are as follows:
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
