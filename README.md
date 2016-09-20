Chitter Challenge
=================
[![Build Status](https://travis-ci.org/lukecartledge/chitter-challenge.svg?branch=master)](https://travis-ci.org/lukecartledge/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/lukecartledge/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/lukecartledge/chitter-challenge?branch=master)

A light-weight clone of Twitter, built over a weekend in Ruby using the Sinatra framework

Technologies:
-------
* Ruby (2.2.3)
* Sinatra
* Postgresql
* Datamapper
* Bcrypt
* Rspec
* Capybara


Installation instructions
-------

1. Fork & clone this repo
2. Run bundle
3. Run `rackup -p 4567`
4. Using a browser navigate to: localhost:4567
5. Create a new account and enjoying 'peeping'

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

How I Found This Challenge:
------
I actually ended up really enjoying this weekend challenge. I found that I was referring to my notes and work from the week. However I also found that for a lot of it I was able to work quite quickly, only looking back to refresh my memory. I was also pleasantly surprised at how much of the structure of the app I was able to hold in my head at a time.
The only downsides that I found were around styling the app and some limits on the functionality. I chose to use Bootstrap for much of the styling as it could take the heavy lifting out of the css. Although there are a couple of details, mostly around the partials and buttons that work a little bit less well than I am happy with. I also found that there appears to be some form of limit on the length of my peeps. Not sure where this has crept into the code.
