# Chitter Challenge
=================
- A small Twitter clone that allows users to post messages to a public stream.
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
- user can post a new message & their username. (CREATE)
- user can view all messages. (READ)
- messages include time it was created.
- user can sign up for chitter.
-----
## Domain Modelling
### Objects
- Chitter
- Peep

### Messages
- |Peep|--.all - ->|Chitter| (Read all peeps)
- |Peep|--.create(peep, username) - ->|Chitter| (Create new peep)

### Sequence Diagrams
- |User| --peep(time)--> |Chitter|
- |User| <- - "peeps" - - |Chitter|
------
## Notes on functionality:
* Don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
------
## Domain Relationships
- Chitter has MANY Peeps
|Chitter|---≡|Peep|  

- Chitter has MANY users
|Chitter|---≡|User|  

- a User has MANY peeps
|user|---≡|User|  

------
## Class Responsibility Collaborator (CRC) Models
- Table: peeps
| id |     peep     | username | time?
|------------------------------|
| 1  | "first peep" |  "Josh"  |
------
- Table: users
 id | email | user_name | name | password
----+-------+-----------+------+----------
------
# Technologies used:
## Postgress
```
brew install postgresql
```
## TablePlus
- Optional, Graphic User Interface to database program.

## SQL
- To connect:
```
psql
```

### Creating the Databases
```
CREATE DATABASE "chitter";
```
```
CREATE DATABASE "chitter_test";
```
- see 'db/migrations/' for further instructions. (follow same instructions for each database)

### Viewing the Databases
- connect:
```
psql
```

- change to database
```
\c chitter;
```
```
\c chitter_test;
```

- to inspect the list of existing tables:
```
\dt;
```     

- to view the table's content:            
```
SELECT * FROM chitter;
```
-----
## How to use

### To set up the project:
- Clone this repository and then run:

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
