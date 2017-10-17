# Chitter

### Instructions:
```
* git clone https://github.com/artemisxen/chitter-challenge.git
* bundle install
* create database chitter_development
* create database chitter_test
* rake db:migrate
* rackup
* http://localhost:9292
```

or visit https://art-chitter.herokuapp.com/

##### Tests
```
* rake db:upgrade RACK_ENV=test
* rspec
```

### Features:
```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

### Screenshots
![signup](/img/sign_up.png)

![login](/img/login.png)

![newsfeed](/img/newsfeed.png)
