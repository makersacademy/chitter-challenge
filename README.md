# Chitter Challenge
=================
A small Twitter clone that allows users to post messages to a public stream.
-------
## User Stories
```
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
-----
## Features:
- user can post a new message. (CREATE)
- user can view all messages. (READ)
- messages include time it was created.
- user can sign up for chitter.
-----
## Domain Modelling
### Objects
- Chitter
- Peep

Chitter has MANY Peeps
 _______      ____
|Chitter|---≡|Peep| 
 –––––––      ––––

### Messages
- |Peep|--.all - ->|Chitter| (Read all peeps)
- |Peep|--.add - ->|Chitter| (Create new peep)

### Sequence Diagrams
|User| --peep(time)--> |Chitter|
|User| <- - "peeps" - - |Chitter|
------
## Notes on functionality:
------
* Don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.


## Technologies used
## Postgress
```
brew install postgresql
```
## TablePlus
- Optional, Graphic User Interface to database program.
-----
## SQL
- connect
```
psql
```

### Creating the Databases
```psql``` command ```CREATE DATABASE "chitter";
```
```psql``` command ```CREATE DATABASE "chitter_test";
```
- see 'db/migrations/' for further instructions. (follow instructions for both databases)

### Viewing the Databases
- connect:
```psql
```

- change to database
chitter.sql
```\c chitter;
```
chitter_test.sql
```\c chitter_test;
```

- to inspect the list of existing tables:
```\dt;
```     

- to view the table's content:            
```SELECT * FROM chitter;
```
-----
## How to use

### To set up the project

Clone this repository and then run:

```
bundle
```

### To run the Bookmark Manager app:

```
rackup
```
- browser: http://localhost:9292
### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```
