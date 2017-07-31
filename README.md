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

![Peeps_page](https://www.dropbox.com/s/qy446c9vfdyatc8/Screen%20Shot%202017-07-31%20at%2009.24.52.png?dl=0)

* It allows to create new peeps

![Create_peep](https://www.dropbox.com/s/82kq0an0ldza7fa/Screen%20Shot%202017-07-31%20at%2009.26.45.png?dl=0)
![Show_new_peep](https://www.dropbox.com/s/6fq3a5lh9nei7ox/Screen%20Shot%202017-07-31%20at%2009.26.55.png?dl=0)

* It allows users to register
![Register_new](https://www.dropbox.com/s/aaq3x012jo8qx8z/Screen%20Shot%202017-07-31%20at%2009.29.24.png?dl=0)
![Confirmation](https://www.dropbox.com/s/qy95m6qu86w5ei1/Screen%20Shot%202017-07-31%20at%2009.29.55.png?dl=0)

* It allows users to sign in and out
![Sign_out](https://www.dropbox.com/s/s1ymwsefc2fegrf/Screen%20Shot%202017-07-31%20at%2009.32.41.png?dl=0)
![Sign_in](https://www.dropbox.com/s/j4dmfqcrpv3dzti/Screen%20Shot%202017-07-31%20at%2009.33.00.png?dl=0)
