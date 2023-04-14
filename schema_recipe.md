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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Nouns:

`User`, `name`, `password`, `username (unique)`, `email (unique)`

`Peep`, `peep posted_at`, peeps need to reference name of Maker and username

`Tagged users` (in a peep)


## 2. Infer the Table Name and Columns



| tables                | columns          |
| --------------------- | ------------------  |
| users                 | id, name, username (unique), email(unique), password
| peeps                  | id, message, posted_at, user_id
| tags                   | maker_id, post_id

# TODO

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).


```
# EXAMPLE:

Table: users
id: SERIAL
name: text
username: text (unique)
email: text (unique)
password: text

Table: peeps
id: SERIAL
message: text
posted_at: timestamp
user_id: int (id from users table)

Table: tags
peep_id = int (id from peeps table)
user_id = int (id from users table)

```

## 4. Decide on The Tables Relationship


```
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```

```
-> A peep HAS MANY tagged users
-> A tagged user HAS MANY peeps they are tagged in

-> Therefore peeps and user tags have a MANY to MANY relationship
```

## 4. Write the SQL.

```sql
-- file: chitter_database.sql

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text,
  UNIQUE (username, email);
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  posted_at timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

-- Create the join table.
CREATE TABLE tags (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (peep_id, user_id)
);


```

## 5. Create the tables.

In TablePlus
