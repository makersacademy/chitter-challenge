Chitter Challenge
=================

Chitter is a small Twitter clone that will allow the users to post messages to a public stream.

#### User Stories:

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

Technical Approach:
-----
Use PostgreSQL to integrate database into Chitter and make `SQL` queries with `PG` gem.<br>
Develop the web-based app using `Ruby` language and `sinatra` framework.<br>
Test the app with `Rspec` and `Capybara` frameworks.

### Domain Model

<div style='float: center'>
<img style='width: 300px' src="./public/images/domain_model.png">
</div>


### Class Responsibility Collaborator

```
|----------------------------------------|
|                  Chitter               |
|----------------------------------------|
| Responsibilities    |  Collaborators   |
|----------------------------------------|
| show peeps          | User             |
| show time of peep   |                  |
| show user's name    |                  |
| register users      |                  |
|----------------------------------------|

|----------------------------------------|
|                   User                 |
|----------------------------------------|
| Responsibilities    | Collaborators    |
|----------------------------------------|
| write a peep        |                  |
| sign up with email, |                  |
| password, name, and |                  |
| a username          |                  |
|----------------------------------------|

```

## Setup Database
- Create database `chitter` using syntax `createdb chitter`;
- Create `user` table to store user information with `CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(60));`;
- Create `peeps` table to store peeps with ` CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(60), name VARCHAR(60), time TIMESTAMP);`

- Create database `chitter_test` following the same steps as documented above.

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
