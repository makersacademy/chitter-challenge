Road Tripper
=================
Welcome to Road Tripper, a place for fellow travellers to share their special moments.

### Tech

Ruby, Sinatra, PostgrSQL, DataMapper, BCrypt, HTML, CSS, RSpec, Capybara

### Setup

* Clone repository
* `cd` to the project's root directory
* Run `gem install bundler`
* Run `bundle install` to install all of the required gems
* Create the following databases `chitter_development` and `chitter_test`
* Run `rspec` to make sure that all tests are passing
* Run `rackup`
* Visit [localhost:9292](localhost:9292) in a browser

### Screenshots

**Home Page (Guest)**

![Home Page (Guest)](https://s25.postimg.org/w3ajf63gv/Screenshot_2017-06-01_09.39.27.png)

**Sign Up Page**

![Sign Up Page](https://s25.postimg.org/or539ml8v/Screenshot_2017-06-01_09.44.07.png)

**Home Page (Registered User)**

![Home Page (User)](https://s25.postimg.org/kw1p72233/Screenshot_2017-06-01_09.44.54.png)

### User Stories

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
