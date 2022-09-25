# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
# USER STORY:
# (analyse only the relevant part - here the final line).

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter    (form for the peep)

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order   (all.reverse)

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made    displays time with peeps ( def time in peep class)

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter  (learn how to do this)

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter        (learn how to do this, user authetification?)

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter      (learn how to do this, user authetification?)

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

```
Nouns:
peep, username, , name, time, email, password
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| peeps                 | user, name, time
| users                | email , username, name

1. Name of the first table (always plural): `peeps` 

    Column names: `user`, `name`, `time`, `content`

2. Name of the second table (always plural): `users` 

    Column names: `email`, `username`, `name`, `password`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: peeps
id: SERIAL
user: text
name: text
time: timestamp

Table: users
id: SERIAL
email: text
username: text
name: text
password: text
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

Replace the relevant bits in this example with your own:

```
# EXAMPLE

1. Can one peep have many users? NO
2. Can one user have many peeps? YES

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  name text,
  username text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  username text,
  name text,
  content text,
  time timestamp,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
