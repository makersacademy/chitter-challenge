# Needs 

* Features
  * [ ] Sign up
  * [ ] Log in
  * [ ] Log out
  * [ ] Peeping
  * [ ] Listing Peeps
  * [ ] Display time of peep

* Bonus Features
  * [ ] Replying to peeps
  * [ ] CSS styling

 
# User requirements

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
# Straight up

## Web Pages
- view messages(index)
- sign up page/login page (basic front end done)
- post message

## Tables
- Messages
- Users

## Steps
1. Create all views.
2. Create database.
3. Create underlying app.
4. Push to Heroku

5. get bootstrapped

# Tables

## Peeps
- id
- content
- creation_date
- user_id

## Users

- id - Serial
- username - text
- password - password
- name - text
- email - text

# Application design

## methods

get
- /
- message
- user

post
- user/new
- message/new
