Chitter Challenge
=================

Weekend 4 challenge is to write a little Twitter clone named 'Chitter' that will allow the users to post messages (peep) to a public stream.


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

Notes on technologies:
------

* Capybara
* RSpec
* Sinatra
* DataMapper as ORM
* Rake
* BCrypt to hash user password


##Installation instructions:
-------------------------
1. git clone https://github.com/littlethao/chitter-challenge.git
2. bundle install
3. psql postgres => CREATE DATABASE chitter_development;
4. rake db:auto_migrate RACK_ENV=development
5. rspec
6. ruby app/app.rb
7. Visit in your browser: http://localhost:4567/peeps


Notes on further steps
----------------------
Currently, there is no link from the home path '/' to other paths of this app as yet. Further implementation also required on the visual layout and response functionality. These are steps, I'd wish to take to finalise this project.
