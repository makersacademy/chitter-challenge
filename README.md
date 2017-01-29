# Chitter Chatter

A disembodied communication system for humans.

## User Stories

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

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Summary of functionality
```
Sign up

Login

Logout

Post a peep

View all peeps reverse order

View time of peeps

Optional extras: CSS; reply to peep
```

## Pages

Logged in: "You are logged in as <email>" at top + logout link/btn

Not logged in: "Login/register to peep" + login/register link/btn

**signup**
-> **peeps** ...
FAIL -> **signup** + msg + link to **peeps**

**login**
[has: link/btn to **signup**]
-> **peeps** ...
FAIL -> **login** + msg + link to **peep**

**peeps**
[has: **peep** btn/link if logged in]
Displays all peeps in reverse

**peep**
-> **peeps** ...
FAIL ->  **peeps**
