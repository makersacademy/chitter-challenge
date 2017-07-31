Chitter Challenge
=================

User Stories Implemented:
-------

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

```

Installation Instructions:
------

* Fork this repo
* Run git clone https://github.com/petrakh/chitter_challenge
* run `bundle install`
* run postgress and create the following databases: *chitter_development*, *chitter_test*
* `rake auto_migrate` to set up your DataMapper connection
* testing done via Capybara, rspec and rackup

App description:
-----

Deployed app can be found at https://chitter-boom.herokuapp.com/peeps

* It allows to view already posted peeps

![Peeps_page]([Imgur](http://i.imgur.com/xuMLVPl.png))

* It allows to create new peeps

![Create_peep]([Imgur](http://i.imgur.com/UFAf9iF.png))
![Show_new_peep]([Imgur](http://i.imgur.com/2jGYIgo.png))

* It allows users to register
![Register_new]([Imgur](http://i.imgur.com/dm7aL99.png))
![Confirmation]([Imgur](http://i.imgur.com/879Jtob.png))

* It allows users to sign in and out
![Sign_out]([Imgur](http://i.imgur.com/Ul08Kz6.png))
![Sign_in]([Imgur](http://i.imgur.com/qPrQYiE.png))
