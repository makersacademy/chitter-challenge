Requirement
User Story
Feature Test
Unit Tests
Implementation
Refactoring

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

User flow:
**DONE** Visit /
**DONE** write a peep
**DONE** press post and see my post on my feed

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

User flow:
**DONE** visit /
**DONE** a list of all peep are there in reverse chronological order 

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

User flow: 
* visit /
* each peep has a time stamp

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

User flow:
* visit /signup
* enter username, email, password, conf password and display name

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

User flow:
* visit /login
* enter details
* redirected to / to and see all peeps

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

User flow:
* visit / and see a logout button
* when pressed I am logged out and can no longer peep

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

User flow: 
* having added my email when I signed up
* I will receieve an email with a link to the tweet I was mentioned in.