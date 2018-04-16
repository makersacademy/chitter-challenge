# Chitter Challenge
===================

User stories:
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

**Post message to chitter**
For the first user story, I first created the app.rb file with Chitter class and "/" route. I initially planned to hard code the first peep and get the test working, which I did. However I was not happy with the way I wrote it so I decided to create my database before I move further in the app. The homepage shows all peeps posted, with a form underneath to post a new peep.

I created a Peep class, where a new instance would create a peep with the post and its timestamp, however it has not yet been used.
