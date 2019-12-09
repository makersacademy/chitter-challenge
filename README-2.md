# Chitter

This project is a small clone of Twitter that allows users to post messages to a public stream.  

## Contents
- [User stories](#user-stories)
- [Domain modelling](#domain-modelling)
- [Database structure](#database-structure)
- [Still to be completed](#still-to-be-completed)
- [Features](#features)
- [Code style](#code-style)
- [Tech used](#tech-used)
- [Getting started](#getting-started)
- [Database setup](#database-setup)
- [Test database setup](#test-database-setup)
- [Running the tests](#running-the-tests)
- [Test coverage](#test-coverage)
  - [Feature tests](#feature-tests)
  - [Unit tests](#unit-tests)
- [Versioning](#versioning)  

## User stories

> As a Maker  
> So that I can let people know what I am doing    
> I want to post a message (peep) to chitter  
>
> As a Maker  
> So that I can see what others are saying    
> I want to see all peeps in reverse chronological order
>
> As a Maker  
> So that I can better appreciate the context of a peep  
> I want to see the time at which it was made  
>
> As a Maker  
> So that I can post messages on Chitter as me  
> I want to sign up for Chitter  
>
> As a Maker  
> So that only I can post messages on Chitter as me  
> I want to log in to Chitter   
>
> As a Maker  
> So that I can avoid others posting messages on Chitter as me  
> I want to log out of Chitter  


## Domain modelling

| User class | Peep class |
| ---- | --- |
| ```@email``` | ```@id``` |
| ```@password``` | ```@content``` |
| ```@user_name``` | ```@created_at``` |
| ```@user_handle``` | ```@user_id``` |
| ```@created_at``` |  |
| ```@user_id``` |  |
| ------------- | ------------- |
| ```.create``` | ```.create``` |
| ```.authenticate``` | ```.all``` |  

## Database structure

**Table: users**

user_id | user_name | user_handle | email | password | created_at |
| ----- | --------- | ----------- | ----- | -------- | ---------- |
| 1 | Debbie Handler | The Real Debs | debbie@test.com | dkfg14   | 2019-12-08 21:02:31.579223 |
| 2 | Joan Peeler    | JoJo          | jojo@test.com   | j450pl   | 2019-12-08 21:02:31.579223 |  

**Table: peeps**   

| id | content | created_at | user_id |
| -- | ------- | ---------- | ------- |
| 1 | Hello World! | 2019-12-08 21:02:55.919516 | 1 |
| 2 | Pancake Palour has the the best breakfast menu! | 2019-12-08 21:02:55.919516 | 2 |
| 3 | I just read the most interesting article. | 2019-12-08 21:02:55.919516 | 2 |  

## Still to be completed

**User story**  
> As a Maker  
> So that I can stay constantly tapped in to the shouty box of Chitter  
> I want to receive an email if I am tagged in a Peep  

**CSS Design**  

**Edge Case**  
- Peeps that include apostrophes cannot be posted.
- Sign up does not check if email address already has an account attached to it.

## Features
- Sign up
- Sign in
- Log out
- Post Peeps
- Listing Peeps
- Display creator and time of Peeps  

## Code style
- OOD
- TDD
- BDD

## Tech used

- Ruby  
- Rspec  
- Sinatra  
- Capybara  
- PostgreSQL  

## Getting started

To install all necessary gems, run ```bundle``` in the terminal.

## Database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE chitter_database;```  
- Connect to the database using the ```pqsl``` command ```\c chitter_database;```  
- Run all the queries we have saved in the folder ```db\migrations\```  

## Test database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE chitter_test_database;```  
- Connect to the database using the ```pqsl``` command ```\c chitter_test_database;```  
- Run all the queries we have saved in the folder ```db\migrations\```  

## Running the tests  

You can run tests by running "rspec" in the terminal in the chitter_challenge directory.

### Test coverage  
#### Feature tests
- visit homepage
  - it has a welcome message
  - it provides a signing-in link
  - it displays all the peeps posted

- the user can sign up for Chitter
  - their user-handle is displayed once logged in
  - their name and user-handle shows against any peep they post

- the user can sign in
  - signs in if email and password are correct/exist
  - sign in fails if email is not correct
  - sign in fails if password is not correct

- post a peep
  - the user can write a peep and it displays on screen

- the user can log out of Chitter
  - there is a link to log out
  - they can press the link and log out

#### Unit tests
Peep  
  - #user"  
    - returns the user that posted the peep
  - .all
    - returns all peeps made in reverse chronological order
  - .create
    - creates a new peep

User  
  - .create
    - creates a new user
  - .authenticate
    - returns an instance of User if email and password exist
    - returns an error if email does not exist
    - returns an error if password does not exist  

## Versioning

chitter_challenge uses ruby version 2.6.5. To change ruby versions run
```rvm install ruby-2.6.5``` in terminal.
