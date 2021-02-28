# Setup

## Setting up the databases

start and open PostgreSQL
```sh
$ brew services start postgresql
$ psql postgres
```
create and connect to a chitter database
```sql
postgres=# CREATE DATABASE "chitter_database_test";
postgres=# \c chitter_database_test
```

create peeps table
```sql
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(420), username VARCHAR(30), timestamp VARCHAR(24));
```

create users table
```sql
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(30), realname VARCHAR(30), email VARCHAR(60), password VARCHAR(140));
```

# Planning

## SQL tables

```language
Peeps
========================================
Peeps
----------------------------------------
user ID of message poster | Users
----------------------------------------

Users
========================================
user name
real name
email
hashed password
----------------------------------------


```