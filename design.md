# Chitter Design

"
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
"

Further Notes:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## Database - chitter

Table - users:

- id
- email (unique)
- name
- username (unique)
- password

Table - peeps:

- id
- content
- user_id
- date

KEY FEATURES:

- Sign up
- Log in, once logged in they can peep
- Log out
- Viewing all peeps with latest first - peeps also contain usernames and given names
- Anyone can see peeps, regardless of being logged in
