Chitter Challenge
=================
INSTRUCTIONS FOR SETUP:
-------

- clone the repo
- run ruby 2.5.1
- bundle 
- run rake db:create (creates databases), you should have chitter_development and chitter_development_2 databaes setup
- run rake db:migrate (migrates database) 

## To run tests:
- run rspec in the root folder

TASK SUMMARY:
-------

This is a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP (User stories)

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

Functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.


## Technologies used

- ActiveRecord: Used this OR mapping to create databases for testing and development, rake migrating to create tables (Users, Messages), adding columns to existing tables (e.g. password_digest to users, timestamp to messages ). - Also used this for creating User and Message objects, (using the .create method)

- timecop : used to freeze time for testing

- sinatra-flash : used to display error or notice messages (for example: when user did not sign up due to validation of sign up details)

- Bcrpyt : used this gem to store passwords in a secured hash


# Approach:

The approach is TDD driven and database driven (ORM used). 

- It is TDD driven as I started with testing user stories. 
- It is database driven because I have created database tables(e.g. users, messages) along the way to pass the tests. 

## Database

- Testing (chitter_development)
- Production (chitter_development2)

- Tables: Users, Messages
- Relationship: one user- many messages


## TDD

First I made feature tests for each of the user stories. 

-----
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
-----
test: 
- i made feature test so that one sees a new message page, and can post it
- wrote unit test for adding content to message object

code:  
- created routes for posting 
- created form
- initiated message model 
- used ActiveRecord create method to post message

-----
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
-----
test: 
- created feature test for index page

code:  
- defined all messages in message index, displayed in index erb
- used .sort.reverse in controller to sort in reverse order
-----
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
-----
test: 
- wrote a feature test for time posted, where it should display the time posted in index
- wrote unit test for creating message, and check the creation time

code:  
- Using ActiveRecord timestamp to record created_at, updated_at

-----
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
-----
test: 
- wrote feature test to sign up and check if details displayed on show page
- wrote unit test for user class, for the create new user with dummy details
- tested the .find method to see if user can be found using id

code:  
- used ActiveRecord create method to create users
- modified controller so that its redirected to show page, using user.id, if user is created, and displays details there


-----
* You don't have to be logged in to see the peeps.

Tests: 
- created feature test where user and message objects where created and user not signedup/logged in, and expected to still see messages.

Code:
messages are displayed as messages variable at index is Message.all

-----
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- done at user sign up user story above

-----
* The username and email are unique.

Tests:
- feature test: created 2 signups of identical username, expects to raise an error/flash 
- feature test: created 2 signups of identical email, expects to raise an error/flash


Code: 
- used ActiveRecord validation uniquness criteria. 
- in controller, if statement where if user is not saved, a flash is displayed.


-----
* Peeps (posts to chitter) have the name of the maker and their user handle.

Tests:
- wrote feature test to expect that name and username appears beside message on index page


Code:
- Created association between user and message (one to many), where one user has many messages. Added foreign key column to message table. 
- A message can only be posted if there is a corresponding user_id
- modifed controller 'post /messages/new' so that message is created with an user_id
- modified index erb so that username and name are displayed alongside 


## Others

### Bcrypt: 
- Used Bcrypt gem to store secure passwords in a hash

test:
- feature test to see if it created a matching hash

Code: 
- added password_digest column to users
- put has_secure_password in User model



## What I didn't do 
```
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

* In order to start a conversation as a maker I want to reply to a peep from another maker.

* Work on the CSS to make it look good.

* Bcrypt - test that it stores in a hash


## Other tasks added in later(after 1st draft)

- feature test- reverse chronological order for message index
e.g. 
    first_child = find("ul li:first-child")
    last_child = find("ul li:last-child")
    expect(first_child).to have_content "Newest message"
    expect(last_child).to have_content "Oldest message"

- modified travis.yml, (added in script: RAILS_ENV=test bundle exec rake db:migrate, and ), so that travis now working. I first created database before script, and also added (addons: postgresql: 9.6).

- fixed flash, so that it doesnt go to another page, but flash is displayed on the page (e.g. sign up). Did this by redirecting to '/users/new' after the flash.

-----
## Self code review
### Testing coverage
- no needed to test Active Record methods for models

