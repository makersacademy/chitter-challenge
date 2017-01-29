Chitter Challenge
===
This is the week four weekend challenge for makers academy, to produce a "twitter" clone. Full text for the challenge can be found [here](challenge_text.md). here is a link to the app deployed onto [heroku](tweetzer.herokuapp.com)

![image of app](capture.jpg)

-----
Installing
---
run these commands in a bash terminal
- git clone git@github.com:JamesTurnerGit/chitter-challenge.git
- cd chitter_challenge
- bundle
- createdb chitter_development
- rake auto_migrate
- rspec
- rackup  
-----
Usage
---
visit localhost:9292 if you're running rackup, and create a new user with the links at the top of the page. try logging in and out with the user you just created. to post a tweet click compose and fill out the form that appears.

---

User Stories
---
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
