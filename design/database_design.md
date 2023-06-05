## 1. Extract nouns from the user stories or specification


```
Nouns from user stories:

peeps, feed, time of post, Maker, email
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| peeps                 | content, time
| makers                | name, email, password

1. Name of the first table (always plural): `peeps` 

    Column names: `content`, `time`

2. Name of the second table (always plural): `makers` 

    Column names: `name`, `email`, `password`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```

Table: peeps
id: SERIAL
content: text
time: timestamp

Table: makers
id: SERIAL
name: text
email: text
password: text
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one Peep have many Makers? (No)
2. Can one Maker have many Peeps? (Yes)

You'll then be able to say that:

1. **Maker has many Peeps**
2. And on the other side, **Peep belongs to Maker**
3. In that case, the foreign key is in the table `peeps`

## 4. Write the SQL.

```sql
-- file: spec/table_shemas.sql

-- Create the table without the foreign key first.
CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < spec/table_schemas.sql
psql -h 127.0.0.1 chitter_test < spec/table_schemas.sql
```
