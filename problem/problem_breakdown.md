# Problem breakdown

## Straight up

### User story 1 - Post a peep

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```


#### Object model

Object | Messages
--------------- | --------------------
Maker | 
Peep | .create


#### Feature breakdown

1. Can enter message (peep)

2. POST peep


------

### User story 2 - See all peeps

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```


#### Object model

Object | Messages
--------------- | --------------------
Maker | 
Peep | .create
Peep | .all


#### Feature breakdown

1. Can view all peeps

2. Can view all peeps in correct order


------

### User story 3 - See time of peep

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
``` 


#### Object model

Object | Messages
--------------- | --------------------
Maker | 
Peep | .create
Peep | .all


#### Feature breakdown

1. Can view time of peep


------

```
User story 4: Sign-up
---------------------
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter


HARDER

User story 5: Log-in
--------------------
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter


User story 6: Log-out
---------------------
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter


ADVANCED

User story 7: Receive email notification
----------------------------------------
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

```
As a marketeer,
So that I can see my name in lights,
I would like to register my name before playing an online game.
```

