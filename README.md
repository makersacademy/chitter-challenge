Chitter Challenge
=================

J Sheps report: I completed all the basic implementation on Saturday including validity and uniqueness of email/username.
On Sunday there was an issue with validation (for some reason, I still don't know what) and so I reverted to an old commit and slowly reintroduced the code.  I spent 4 hours on Sunday morning trying this and the only 45mins that was worthwhile was narrowing it down to validation.  The 2nd version passed all the tests and worked locally despite the code being identical and my databases having been wiped several times.  There were a lot of tears and frustration and I basically hated my life most of the day.

I still plan to implement sign in/sign out but this will have to wait. I also want it to say who wrote the peeps.

Instructions:
-------
Clone this repo.  Figure the rest out yourself.


Features:
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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can remember my username on Chitter
I want to receive an email when I sign up
```

Notes on functionality:
------

* Peeps (posts to chitter) have the name of the maker and their user handle.
* You only can peep if you are logged in.


Technologies used:
-----

* sinatra
* capybara
* heroku
* rspec
* DataMapper
* postgres
* SQL
