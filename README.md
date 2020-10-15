Chitter Challenge
=================

# Requirements

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

# Model

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
- username varchar(20) NOT NULL
- email varchar(60) NOT NULL
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

Connect to psql
```
CREATE DATABASE chitter;
\c chitter;
```
Execute table set-up query from db/migrations/01_create_users_table.sql
Execute table set-up query from db/migrations/02_create_peeps_table.sql

### Test DB
Connect to psql
```
CREATE DATABASE chitter_test;
\c chitter_test;
```
Execute table set-up query from db/migrations/01_create_users_table.sql
Execute table set-up query from db/migrations/02_create_peeps_table.sql