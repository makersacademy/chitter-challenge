Chitter Challenge
=================

# Requirements

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

# Model

## Client/Server Model

![Client Server Diagram](/Chitter Web App Diagram.jpg)

## CRCs

### User
**Responsibilities:**
- name
- username
- password
- email

**Collaborators:**
None

**Table Schema: users**
- id (PK) serial
- name varchar(60) NOT NULL
- username varchar(20) NOT NULL UNIQUE
- email varchar(60) NOT NULL UNIQUE
- password varchar(60) NOT NULL


### Peep
**Responsibilities:**
- text
- time_created

**Collaborators:**
- User

**Table Schema: peeps**
- id (PK) serial
- body varchar(365) NOT NULL
- time_created timestamp
- user_id (FK) integer


# Setup

### Live DB

```
% psql -c CREATE DATABASE chitter;
CREATE DATABASE
% psql -d chitter -f ./db/migrations/01_create_users_table.sql
CREATE TABLE
% psql -d chitter -f ./db/migrations/02_create_peeps_table.sql
CREATE TABLE
```

### Test DB

```
% psql -c CREATE DATABASE chitter_test;
CREATE DATABASE
% psql -d chitter_test -f ./db/migrations/01_create_users_table.sql
CREATE TABLE
% psql -d chitter_test -f ./db/migrations/02_create_peeps_table.sql
CREATE TABLE
```

# Run

From repo root directory

```sh
% rackup
```

Open browser to localhost:9292/chitter (amend port 9292 if your set up is different)

You will be able to see any peeps stored in the live DB straightaway, but you must use the Sign Up button before you can post your own peeps.

At the moment you will have to create a new user for every session - duplicate sign ups are prevented, but there's no log-in, log-out functionality.