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

```
Nouns:

peeps, time(and date), content, account, account_id, email, password, username
```

## 2. Infer the Table Name and Columns

| Record                | Properties          |
| --------------------- | ------------------  |
| peeps                 | time(& date), contents, account_id
| accounts              | email_address, password, username

1. Name of the first table (always plural): `peeps` 

    Column names: `time`, `contents`, `account_id`

2. Name of the second table (always plural): `account` 

    Column names: `email_address`, `username`, `password`

## 3. Decide the column types.

```

Table: peeps
id: SERIAL
time: timestamp 
contents: text
account_id: int

Table: accounts
id: SERIAL
email_address: text
username: text
password: text
```

## 4. Decide on The Tables Relationship

```

1. Can one account have many peeps? YES
2. Can one album have many accounts? NO

-> Therefore,
-> An account HAS MANY peeps
-> A post BELONGS TO an account

-> Therefore, the foreign key is on the peeps table.
```

## 4. Write the SQL.

```sql
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time timestamp,
  contents text,

  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter_database < spec/seeds/accounts_seeds.sql
psql -h 127.0.0.1 chitter_database < spec/seeds/peeps_seeds.sql

psql -h 127.0.0.1 chitter_test < spec/seeds/accounts_seeds.sql
psql -h 127.0.0.1 chitter_test < spec/seeds/peeps_seeds.sql


```