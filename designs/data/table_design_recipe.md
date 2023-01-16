# Two Tables Design Recipe Template



## 1. Extract nouns from the user stories or specification

```
user story

```

```
Nouns:

post, message, peep, timestamp
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Item                  | Properties          |
| --------------------- | ------------------  |
| item                | name, unit_price, quantity, 
| order               | customer_name, order_date, item_id

1. Name of the first table (always plural): `items` 

    Column names: `name`, `unit_price`, `quantity`

2. Name of the second table (always plural): `orders` 

    Column names: `customer_name`, `order_date`, `item_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: users
id: SERIAL
username: text
email_address: text
registration_date: date

Table: posts
id: SERIAL
username: text
post_date: date
user_id: int
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

1. Can one item be in many orders? YES
2. Can one order have many items? NO

-> Therefore,
-> An item HAS MANY orders
-> An order BELONGS TO an item

-> Therefore, the foreign key is on the orders table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text,
  registration_date date
);

ALTER TABLE users
ADD UNIQUE (username);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content text,
  post_timestamp timestamp,

  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < chitter.sql
```

