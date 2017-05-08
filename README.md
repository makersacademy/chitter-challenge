Chitter Challenge
=================

A basic twitter clone.

Instructions
-------

In your terminal type:

'''bash
git clone https://github.com/sblausten/chitter-challenge.git
cd chitter-challenge
bundle
createdb chitter_development
rake auto_migrate
rspec
rackup -p 9292
'''

Then visit the address 'localhost:9292' in any web browser.


Features:
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
