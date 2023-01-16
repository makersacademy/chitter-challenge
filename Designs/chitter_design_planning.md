
# Chitter Solo Challenge - Week 4

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

album, title, release year, artist, name
```
chitter_home/member_new_peep (table peeps add new peep from form) 
table peeps (return peeps method descending order)

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Peeps                 | Members         |
| --------------------- | ----------------|
| ID                    | ID              |
| member_id             | name            |
| message               | username        |
| posted_at             | email           |
                        | password        |

1. Name of the first table (always plural): `members` 

    Column names: `ID`, `name`, `username`, `email`, `password`

2. Name of the second table (always plural): `peeps` 

    Column names: `ID`, `member_id`, `message`, `posted_at`


## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: members
id: SERIAL
name: text
username: text
password: text

Table: peeps
id: SERIAL
member_id: text
message: text
posted_at: timestamp
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
1. Can one member have many peeps? YES
2. Can one peep have many members? NO

-> Therefore,
-> A member HAS MANY peeps
-> A peep BELONGS TO an member

-> Therefore, the foreign key is on the peeps table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL, then add it to the projects SQL file

```sql
-- file: chitter_seeds.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name text,
    username text, 
    email text,
    password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  posted_at timestamp,
-- The foreign key name is always {other_table_singular}_id
  member_id int,
  constraint fk_member foreign key(member_id)
    references members(id)
    on delete cascade
);

```

## 5. Create the database and tables.

```bash
createdb chitter_library

psql -h 127.0.0.1 chitter_library < chitter_seeds.sql
```

## 6. 


## 7. Routes

-- Examples

A list of albums 
Request:
GET /albums

Expected response (200 OK)
A list of albums

Find a specific album
Request, using dynamic parameter:
GET /albums/:id

Expected response (200 OK)
A specific album

Create a new album
Request, using dynamic parameter:
POST /albums

With body parameters:
  title='Voyage'
  release_year='2022'
  artist_id='2'
  
Expected response (200 OK)
No content, just create new resource (new album)

A list of artists 
Request:
GET /artists

Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone


Creates a new artist in the database
Request:
POST /artists

With body parameters:
name=Wild nothing
genre=Indie

Expected response (200 OK)
(No content)

Then subsequent request:
GET /artists

Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothing
