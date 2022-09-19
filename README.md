

Chitter Challenge
=================

Description
------------
A small twitter clone that allows you to post on a public timeline. I learned how to use Sinatra, ActiveRecord Object Relational Mapper as well as PostgreSQL

Features:
-------

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

Technologies used
---------------
- Sinatra
- ActiveRecord ORM
- RSpec for testing
- PostgreSQL
- Rake

-----

Instructions to use program
--------------------------
- Run Bundle Install 
- "rake db:create" to produce the databases
- "rake db:migrate and "rake db:migrate RACK_ENV="test" to make the tables in both the test and devlopement environments
- Start the server using Rackup and access the app at localhost/9292







