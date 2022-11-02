# **Two Tables Design Recipe Template**

## **1. Extract nouns from the user stories or specification**

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

`Nouns:

message(peep), time, user

## **2. Infer the Table Name and Columns**

Put the different nouns in this table. Replace the example with your own nouns.

1. Name of the first table (always plural): `users`
    
    Column names: `name`, `username`, `email`, `password` 
    
2. Name of the second table (always plural): `peeps`
    
    Column names: `title`, `content`, `date`, `user_id`
    

## **3. Decide the column types.**

Table: users
id: SERIAL
name: text
user_name: text
email: text
password: text

Table: peeps
id: SERIAL
title: text
content: text
time: int
user_id: 1

## **4. Decide on The Tables Relationship**

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [user] have many [peeps]? (Yes)
2. Can one [peep] have many [users]? (No)

You'll then be able to say that:

1. **[user] has many [peeps]**
2. And on the other side, **[peeps] belongs to [user]**
3. In that case, the foreign key is in the table [peeps]

## **4. Write the SQL.**

- `- EXAMPLE
-- file: users_table.sql

CREATE TABLE users ( id SERIAL PRIMARY KEY, name text, username text, email text, password text
);

CREATE TABLE peeps ( id SERIAL PRIMARY KEY, title text, content text, time int, user_id int
-- The foreign key name is always user_id peep_id int, constraint fk_user foreign key(user_id) references users(id) on delete cascade
);`

## **5. Create the tables.**

`psql -h 127.0.0.1 database_name < albums_table.sql`