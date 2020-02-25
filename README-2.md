# The 411

[User stories](#user-stories) | [Getting started](#getting-started) | [Database setup](#database-setup) | [Test database setup](#test-database-setup) | [Domain modelling](#domain-modelling) | [Database structure](#database-structure) | [Still to be completed](#still-to-be-completed) | [Features](#features) | [Code style](#code-style) | [Tech used](#tech-used) | [Running the tests](#running-the-tests) | [Test coverage](#test-coverage) | [Versioning](#versioning) | [Credits](#credits)

This project is the 80's answer to Twitter, allowing users to post messages to a public stream.

<img width="1438" alt="Homepage view part 1" src="https://user-images.githubusercontent.com/49643736/71487962-f9e24000-2815-11ea-89ef-e0d989b058e3.png">

<img width="1417" alt="Homepage view part 2" src="https://user-images.githubusercontent.com/49643736/71487973-0bc3e300-2816-11ea-961d-4d590e7075be.png">

<img width="1413" alt="Homepage view part 3" src="https://user-images.githubusercontent.com/49643736/71487980-1b432c00-2816-11ea-8f5b-7c45797a8ee4.png">  

## Getting started

Clone this repository and run the below in the terminal in your chitter-challenge directory:
- To install all necessary gems, run ```bundle```
- To run the tests and see code coverage, run ```rspec```
- To run the linter, run ```rubocop```
- To open in web browser run ```ruby app.rb```
- Open http://localhost:4567/

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

## User stories

_Rebranded to **The 411**_

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
> So that I can delete a post I no longer like   
> I want to delete a peep I've made  
>
> As a Maker   
> So that I can update a post I have second thoughts on   
> I want to edit a peep I've made  
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
| 1 | Ferris Bueller | 7 Day Weekend | ferris@example.com | dkfg14   | 2019-12-03 21:02:31.579223 |
| 2 | Stef    | Goonies Never Die         | stef@example.com   | j450pl   | 2019-12-04 21:02:31.579223 |  

**Table: peeps**   

| id | content | created_at | user_id |
| -- | ------- | ---------- | ------- |
| 1 | Its crazy. I feel like Im babysitting except Im not getting paid. | 2019-12-08 21:02:55.919516 | 2 |
| 2 | A person should not believe in an -ism, he should believe in himself. | 2019-12-09 21:02:55.919516 | 1 |
| 3 | You know your voice is kind of nice when your mouth isnt screwing it up. | 2019-12-10 21:02:55.919516 | 2 |  

## Features
- Sign up (warning if email or user handle already in use)
- Login (warning if incorrect log in details)
- Log out
- Write posts
- View all posts
- Display creator and time of posts
- Edit posts
- Delete posts

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
- ERM
- CSS (including Bootstrap)

### Test coverage  
#### Feature tests
- visit homepage
  - it has a welcome message
  - it provides a signing-in link
  - it displays all the peeps posted

- the user can sign up for The 411
  - their user-handle is displayed once logged in
  - their name and user-handle shows against any peep they post

- the user can sign in
  - signs in if email and password are correct/exist
  - sign in fails if email is not correct
  - sign in fails if password is not correct

- post a peep
  - the user can write a peep and it displays on screen

- the user can log out of The 411
  - there is a link to log out
  - they can press the link and log out

#### Unit tests
Peep  
  - .user
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

## Credits
- Video game buttons taken from a [code pen written by Daniel Weiner](https://codepen.io/DanielWeiner/pen/iFadn)
- Cloud shape taken from a [Stack Overflow entry by jbutler483](https://stackoverflow.com/questions/30919053/creating-a-responsive-cloud-shape)
- Background art sourced from Deviant Art, [created by faundly](https://www.deviantart.com/faundly/art/Starry-Night-Pattern-713357744)
