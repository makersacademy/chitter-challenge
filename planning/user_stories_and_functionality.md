# User stories:

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
    - DONE: #create(peep) made in peep_repository
    - DONE: post method (and related get methods)

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
    - DONE: #all method in peep_repository
    - DONE: sort peeps in reverse chronological order
    - DONE: 'get /' and 'get /:peep_id' methods

As a Maker 
So that I can better appreciate the context of a peep
I want to see the time at which it was made
    - DONE: date_and_time variable (tiemstamp) added to tables, etc.
    - DONE: add visual of this to page

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
    - DONE: #create(user) made in user_repository
    - DONE: add visuals of this to page


HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
    - DONE: add login functionality to page
    - DONE: encrypt passwords

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
    - DONE: add log out functionality to page


ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep


# Notes on functionality

DONE: You don't have to be logged in to see the peeps.
DONE: Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
DONE: The username and email are unique.
DONE: Peeps (posts to chitter) have the name of the maker and their user handle.