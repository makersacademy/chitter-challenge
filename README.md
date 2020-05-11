Chitter Challenge
=================

I am not particularly happy with my effort here and will be going back through this again in the week.

I was able to complete the straight up and added functionality to log in, but I didn't connect the 2 tables together to show who posted a peep and add log out. I am close, but like I said I will be going back through and finishing it off the week.

Peeps Table: id PRIMARY SERIAL, body VARCHAR(300), created_at TIMESTAMP ;
Users id SERIAL, name VARCHAR(60), username VARCHAR(30) , password VARCHAR(30), email VARCHAR(30) ;


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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```