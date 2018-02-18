## Set up:

```
git clone https://github.com/DKeen0123/chitter-challenge
bundle
rake setup
rspec
rackup
```

## Technologies used:

* Ruby
* Capybara
* RSpec
* DataMapper
* Sinatra
* Rake

## Features:

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

## My Approach

I built the features one step at a time in a traditional TDD approach. Feature test, fail that, make it work (write a unit test and make that pass too if needs be) and then re-factor.

I started out without using DataMapper for the first user story, and then refactored to use it for the rest of the project onwards, which cleaned up my code.

As I had never used DataMapper before, I did need to take looks at the old DataMapper Bookmark Manager branches from the MakersAcademy GitHub, but did my best to use DataMapper's documentation.

Currently, I have fulfilled all the above user requirements. Further implementations that I would have liked to do:

* individual pages for each user that signs up, with just their peeps and comments.
* Ability to comment on peeps.
* Proper implementation of RESTful routing.

There is also no styling, so CSS is necessary to make it user friendly.
