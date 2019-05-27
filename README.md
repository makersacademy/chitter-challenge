# Chitter
The aim of this project is to write a small twitter clone that will allow users  to post messages to a public stream.
It should have the following functionality -
- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.

### How to use
- Clone this repo to your machine
- Run bundle install
- Run rackup
- Visit localhost:[port number]

### To set up the database

Connect to `psql` and create the `chitter_manager` database:

```
CREATE DATABASE chitter_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `database/migrations` folder in the given order.

### To set up the test database

Connect to `psql` and create the `chitter_manager_test` database:

```
CREATE DATABASE chitter_manager_test;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

## User Stories

### STRAIGHT UP
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
Object | Message
-|-
User |
Message (peep) | Post to chitter

![Alt Text](https://i.postimg.cc/yYg1ZTgH/Chitter-User-Story-1.jpg)
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
Object | Message
-|-
User |
Message (peep) | Display in reverse chronological order
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
Object | Message
-|-
User |
Message (peep) | Display time it was posted
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
Object | Message
-|-
User | 
Chitter | Sign up

### HARDER
```
As a``` Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
Object | Message
-|-
User | 
Chitter | Log in
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
Object | Message
-|-
User | 
Chitter | Log out

### ADVANCED
```As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Status
- I have managed to complete all the straight up user stories, my next step would be to move onto the harder user stories and to display the users username next to the peeps 
- All test are passing
- 100% Test coverage
