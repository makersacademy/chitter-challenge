# Two Tables (Many-to-Many) Design Recipe Template

_Copy this recipe template to design and create two related database tables having a Many-to-Many relationship._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORIES:

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


| Record                | Properties          |
| --------------------- | ------------------  |
| peeps                 | id, content, time
| peeps_users           | peep_id, user_id
| users                 | id, name



HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep













```




## 4. Write the SQL.

```sql
-- EXAMPLE
-- Replace the table name, columm names and types.



| Record                | Properties          |
| --------------------- | ------------------  |
| peeps                 | id, content, time
| peeps_users           | peep_id, user_id
| users                 | id, name


-- Create the first table.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp
);

-- Create the second table.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text
);

-- Create the join table.
CREATE TABLE peeps_users (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (peep_id, user_id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < posts_tags.sql
```
