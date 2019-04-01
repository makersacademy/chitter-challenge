Chitter Challenge
=================

Chitter is a small Twitter clone that will allow the users to post messages to a public stream.

#### User Stories:

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

```

Technical Approach:
-----
Use PostgreSQL to integrate database into Chitter and make `SQL` queries with `PG` gem.<br>
Develop the web-based app using `Ruby` language and `sinatra` framework.<br>
Test the app with `Rspec` and `Capybara` frameworks.

### Domain Model

- on paper, need to computerise 


### Class Responsibility Collaborator

```
|----------------------------------------|
|               Messages                 |
|----------------------------------------|
| Responsibilities     |  Collaborators  |
|----------------------------------------|
| show messages        | User            |
| show time of message |                 |
| show user's name     |                 |
|----------------------------------------|

|----------------------------------------|
|                   User                 |
|----------------------------------------|
| Responsibilities    | Collaborators    |
|----------------------------------------|
| find a user         |                  |
| sign up with email, |                  |
| password, name, and |                  |
| a username          |                  |
| * post message      |                  |
|----------------------------------------|

```

## Setup Database
- Create database `chitter_manager` using syntax `CREATE DATABASE chitter_manager;`
- Create `user` table to store user information with `CREATE TABLE users (id SERIAL PRIMARY KEY, fullname VARCHAR(60), username VARCHAR(60) UNIQUE, email VARCHAR(60) UNIQUE, password VARCHAR(60));`
- Create `peeps` table to store peeps with ` CREATE TABLE messages (id SERIAL PRIMARY KEY, message VARCHAR(150), time TIMESTAMP, user_id INTEGER REFERENCES users (id));`

- Create database `chitter_manager_test` following the same steps as documented above.

##Incomplete

- The peeps displayed do not show the username - I would inject the User class into the Message class and use the username from the User class.
- I would've liked to add more buttons on each page to swiftly move from one page to another
- CSS styling
- input a user_id foreign key into the messages table as each message has a user (one-to-many relationship)

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
