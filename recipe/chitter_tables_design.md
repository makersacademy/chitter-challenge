# Chitter Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

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

```
Nouns:

peeps, post message, time posted, list in reverse

user, sing up for chitter, log in on chitter, log out of chitter

tags
```


## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties                 |
| --------------------- | -------------------------  |
| peeps                 | content, time
| user                  | name, email, password

1. Name of the first table (always plural): `peeps` 

    Column names: `content`, `time`

2. Name of the second table (always plural): `users` 

    Column names: `name`, `email`, `password`

## 3. Decide the column types.

```
Table: peeps
id: SERIAL
content: text
time: text

Table: users
id: SERIAL
name: text
email: text
password: text
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one peeps have many users ? No
2. Can one users have many peeps? Yes

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

Replace the relevant bits in this example with your own:

```
1. Can one peep have many users? No
2. Can one user have many peeps? Yes

-> Therefore,
-> An user HAS MANY peeps
-> An peep BELONGS TO an user

-> Therefore, the foreign key is on the peeps table (user_id).
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 6. Write the SQL.

```sql

-- file: seeds_chitter_database.sql

-- Create the first table.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name: text,
  email: text,
  password: text
);

-- Create the second table.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content: text,
  time: text,
  -- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id) references users(id)
);

INSERT INTO users (name, email, password) VALUES
('Anna', 'anna@hotmail.com', '235346hgsdv'),
('John', 'john123@gmail.com', 'ddff!@£!@$34tfsd'),
('Rachel', 'notrachel@msn.com', 'DR3tg3gwwdsvs');

INSERT INTO peeps (content, time, user_id) VALUES
('I love sunshine', '2004-10-19 10:23:54', 1),
('I do not love sunshine', '2004-10-19 10:23:54', 2),
('I like rain', '2004-10-19 10:23:54', 3),
('I am dancing in the rain', '2004-10-19 10:23:54', 1),
('I like dogs','2004-10-19 10:23:54', 1):
('I like cats', '2004-10-19 10:23:54', 2);
```

## 7. Create the tables.

```bash
psql -h 127.0.0.1 chitter_database < seeds_chitter_database.sql
```