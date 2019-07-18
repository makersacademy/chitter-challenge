# Chitter - Week 4 Weekend challenge

This is my attempt at the week 4 weekend challenge - [Chitter](https://github.com/makersacademy/chitter-challenge)

## DOMAIN MODEL for the 'Straight Up' User stories
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
```

###Peep class
Methods:
* .create
* .all
* .get_time

###Time class
Method
* .now

###User
Methods:
* .sign_up
Instance Variable:
* user_name
* password
* peeps
