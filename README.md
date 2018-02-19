Task
-------
Write a Twitter clone that will allow the users to post messages to a public stream.

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

```

Notes
-------
- I've implemented ability to post a message, which then appears on the homepage. However the timestamp for this is showing the time the page is loaded, not the time the message was first posted.
- I've implemented a feature for a user to sign up, which means they cannot see or send peeps unless they've signed up
- I have tried to use BCrypt to encrypt the passwords of users signing up, but am unsure if this is working correctly.
