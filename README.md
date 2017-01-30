Chitter Challenge
=================

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

Domain model:
-------
User
.create(email unique, password bcrypt, name, user name unique )
- #login #?
- #logout #?

Peep
- #post(user_name, user_obj,reply_of)
- .sort_time_rev #no need for be logged in to see them

2 do:
-------
- coverall badge
- css
- feature test: peep_sorted_reverse_chrono_order_spec is failing
- clean up the code

Technologies used:
-------
- Ruby
- Sinatra
- DataMapper
- PostGres
- Rspec & Capybara

Else:
-------
- depth first search pattern is working, somehow!!!
- I'm sorry but I'm tired, I'll skip the Travis CI and etc stuff...
