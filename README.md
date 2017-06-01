Road Tripper
=================
Welcome to Road Tripper, a place for fellow travellers to share their special moments.

#### Tech:

Ruby, Sinatra, PostgrSQL, DataMapper, BCrypt, HTML, CSS, RSpec, Capybara

#### Setup:

* Clone repository
* `cd` to the project's root directory
* Run `gem install bundler`
* Run `bundle install` to install all of the required gems
* Create the following databases `chitter_development` and `chitter_test`
* Run `rspec` to make sure that all tests are passing
* Run `rackup`
* Visit [localhost:9292](localhost:9292) in a browser

#### Screenshots
![Home Page](https://postimg.org/image/5i80jm13f/)

#### User Stories:

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
