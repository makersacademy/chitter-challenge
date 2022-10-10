# Two Tables Design Recipe Template

## 1. Extract nouns from the user stories or specification
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
### STRAIGHT UP
Goals
1. Post a message (peep) to Chitter
- Add a peep
- With a timestamp (part 3)
- Maker's username
- Maker's full name

2. List all peeps in reverse chronological order
- Using timestamp, list peeps in reverse chronological order

3. Include time of peep
- Add timestamp parameter to each peep

4. Sign up for Chitter (using a form)
- Email
- Password
- Full name
- Username  
  (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).

Notes
- The **username** and **email** are _**unique**_.
    - If the username and email exists, prompt the user to either
        - Log in
        - Use a different email address / username

- Peeps (posts to Chitter) have the **name** of the maker and their **user handle**.


```
Nouns:

Peeps:
- message
- username
- full name
- timestamp 

Users:
- email
- username
- full name 
- password


```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record | Properties                             |
|--------|----------------------------------------|
| peep   | message, username, fullname, timestamp |
| user   | email, username, fullname, password    |

1. Name of the first table (always plural): `users`

   Column names: `email`, `username`, `fullname`, `password`

2. Name of the second table (always plural): `peeps`

   Column names: `message`, `username`, `full name`, `timestamp`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
email: VARCHAR
username: VARCHAR
fullname: text
password: VARCHAR

Table: peeps
id: SERIAL
message: VARCHAR
username: VARCHAR
fullname: text 
timestamp: TIMESTAMP
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [user] have many [peeps]? (Yes)
2. Can one [peep] have many [users]? (No)

You'll then be able to say that:

1. **[user] has many [peeps]**
2. And on the other side, **[peep] belongs to [user]**
3. In that case, the foreign key is in the table [peeps]

Replace the relevant bits in this example with your own:

```
# EXAMPLE

1. Can one user have many peeps? YES
2. Can one peep have many users? NO

-> Therefore,
-> A user HAS MANY peeps
-> A peep BELONGS TO a user

-> Therefore, the foreign key is on the peeps table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       email VARCHAR,
                       username VARCHAR,
                       fullname text,
                       password VARCHAR
);
CREATE TABLE peeps (
                       id SERIAL PRIMARY KEY,
                       message VARCHAR(160),
                       timestamp TIMESTAMP,
                       user_id int,
                       constraint fk_user foreign key(user_id)
                           references users(id)
                           on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter_test < chitter_table_setup.sql

psql -h 127.0.0.1 chitter < chitter_table_setup.sql




```