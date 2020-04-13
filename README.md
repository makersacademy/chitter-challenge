Chitter Challenge
=================

Features:
-------

Chitter is a twitter clone. Users can Sign up and login to chitter to post a Peep to Chitter. Users can view every peep on chitter on the chitter homepage listed in reverse chronological order.

![Chitter](/process/chitter.gif) 

Still to work on:
---
- [ ] Authentication for user log in
- [ ] User profile page
- [ ] Tagging users
- [ ] Comments

How to setup project:
---

Setup database
```shell
# Open PSQL
psql 

# Create chitter database
CREATE DATABASE chitter;

# Connect to chitter database
\c chitter

# Create peeps table
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(500), peeper VARCHAR(30), date TIMESTAMP, name VARCHAR(30);

# Create peepers table
CREATE TABLE peepers(id SERIAL PRIMARY KEY, name VARCHAR(30), email VARCHAR(50), peeper VARCHAR(20), password VARCHAR(20));
```


```shell
# To run the Rock Paper Scissors
rackup -p 9393     

# Open in browser
http://localhost:9393/

```

Technical Approach:
-----

[Link to process](process/user_stories/README.md)

Technologies used
----

* Project language - Ruby/Sinatra
* Databases - Postgresql
* Encryption - Bcrypt
* Testing - Rspec, Capybara

Notes on functionality:
------

- [X] You don't have to be logged in to see the peeps.
- [X] Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- [ ] The username and email are unique.
- [X] (Half complete)Peeps (posts to chitter) have the name of the maker and their user handle.
- [ ] Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:
- [ ] In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:
- [X] Work on the CSS to make it look good.
