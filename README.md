Chitter Challenge
=================

Task
----
The task was to create a Twitter clone that would allow users to post messages to a public stream.The following user stories were provided to build the app:

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

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

To run:
-------

* git clone git@github.com:jameshughes7/chitter-challenge.git
* cd chitter-challenge
* bundle install
* rackup
* Visit http://localhost:9292

Technology:
-----------
* Ruby
* Sinatra
* DataMapper
* PostGreSQL

To Test:
--------
* RSpec
* Capybara
