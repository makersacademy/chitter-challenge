Chitter Challenge
=================
Have you ever thought "Hey, this 'Twitter' thing is too white and blue, and I think
it has too many gosh-darned features.  Who needs to upload pictures and change your
profile picture?  Remember when Twitter was just about the Tweets?  Enter Chitter.

White and blue?  No.  Black and red.

Challenge:
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

Bonus:
---------

* In order to start a conversation as a maker I want to reply to a peep from another maker.

* Work on the css to make it look good (we all like beautiful things).

Gems used:
----------
* [bcrypt](https://github.com/codahale/bcrypt-ruby)
* [data_mapper](http://datamapper.org/)
* [capybara](https://github.com/teamcapybara/capybara)
* [cucumber](https://github.com/cucumber/cucumber)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [dm-postgres-adapter](https://github.com/datamapper/dm-postgres-adapter)
* [rack](https://github.com/rack/rack)
* [rake](https://github.com/ruby/rake)
* [rspec](https://github.com/rspec/rspec)
* [rubocop](https://github.com/bbatsov/rubocop)
* [simplecov](https://github.com/colszowka/simplecov)
* [sinatra](https://github.com/sinatra/sinatra)
* [sinatra-flash](https://github.com/SFEley/sinatra-flash)

Running locally
-----------
* First, download, fork or clone the repo to your local machine.
* Run ```bundle install``` in order to download the necessary gems.
* If necessary, run ```bundle update``` to ensure that there are no gem conflicts.
* Use rack to start your local server by running ```rackup```.
* Finally, visit the localhost url. In the case of rack, it is hosted on port 9292.

On Heroku
-----------
* The "Chitter Sphere" can be accessed here: https://chitter-sphere.herokuapp.com/home
