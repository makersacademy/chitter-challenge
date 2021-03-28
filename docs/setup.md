# Setup

#### App

1. Install Ruby (version 2.6.5 or above)
2. Clone this depository
3. Run command `gem install bundle` (if you don't have bundle already)
4. When the installation completes, run `bundle`

#### Database

Prerequisite: Install and setup PostgreSQL locally ([Instructions](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/04_mac.md)).

Run following sql in order:

1. Create database chitter

```sql
CREATE DATABASE chitter;
```

If in psql command line, select the new database using `\c chitter`

If in TablePlus, click the open database button and select chitter

2. Create table users

```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(60) UNIQUE,
  password VARCHAR(140),
  name VARCHAR(200),
  username VARCHAR(100) UNIQUE
);
```

3. Create table messages

```sql
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  content VARCHAR(2000),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP::TIMESTAMP(0)
);
```

4. Create view view_messages

```sql
CREATE OR REPLACE VIEW view_messages AS 
  SELECT m.*, u.name, u.username
  FROM messages m
  LEFT JOIN users u
  ON m.user_id = u.id;
```

*Test database, tables and views will automatically setup when run rspec

#### Mail

Not sure if it requires setting up mail server in Mac for localhost to use Pony ([link](https://github.com/benprew/pony)), mine seems just worked