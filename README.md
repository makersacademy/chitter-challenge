# Chitter Challenge

## Instructions

```bash
# ADD INSTRUCTIONS HERE

$ git clone https://github.com/sarahc-dev/chitter-challenge.git
$ cd chitter_challenge
$ bundle install
$ createdb chitter_test
$ psql -h 127.0.0.1 chitter_test < spec/seeds_chitter_test.sql
```

## Technologies Used

- Miro - Designing and planning
- Diagram.codes - Sequence diagrams
- Ruby

## User Stories

```plain
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a Maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

As a Maker
So that I can start a conversation
I want to reply to a peep from another Maker
```

### Functionality

- See all peeps without being logged in, in reverse chronological order
- Peeps have the name and username of the Maker and the time of the peep
- Sign up - with email (unique), password, name and username (unique)
- Log in - email and password
- Log out
- Post peep
- Reply to a peep
- Tag other Makers
- Receive an email if tagged

## Modelling and Planning Web Application

Initially, I have created some sequence diagrams for the main functionality of my program - posting a peep, logging in and signing up to Chitter.

### Sequence diagrams

Post a new peep:

![post new peep](https://previews.dropbox.com/p/thumb/AB4tQuNlmzN9D3XcXjBTU833gt2SgeN36gWvZC2aSlClqUfNJuncjFWQ_eJCLaK7ZMZURi8x-GiW3-9B-oa7u9diM24n98ni3M1Gs3qcoyrmIANKFG6e5NL3M1Bm4_Jh8_Bb379t6LPiSgjG6lNtOhoDJpp4iGJZG-zfeD3vwpNMMUCqcrhShM3vxn3yQHXg7ii0onKLPOWLsbkle00Wjgthhl13dgK0RGqLqpgNINS8UiEWcrreyPmLYPMBz67FN2ZRgJwmZNzGMfNOc5xAY4tZMZrZov2bZD_sA1AX1fdruQKzeiaicilTQAzpQOKVdA9EU9C3rbfpp51vUlOBox_fY-dUkxW_lVaYNBUyI-u2l7ST0pFtMgB1A4_7gG5JKnM/p.png)

New user sign up:

![signup user](https://www.dropbox.com/s/w0qs7n0gyr11l5d/signup-user.png?dl=1)

Log in the user:

![login user](https://www.dropbox.com/s/r0ki675kotlyvil/login-user.png?dl=1)

### Design database

Extracted the nouns from the user stories to infer the table names and properties. I have also considered the relationships between the tables.

- One peep can have one user (as author)
- One user can have many peeps
- Replies: One peep can also have one parent (a peep) or nil
- Tags: One peep can tag many users, one user can have many tags

To implement the tags, as this is a many-to-many relationship, I will need to create a join table - which contains user_id and peep_id.

| Record | Properties                                                             |
| ------ | ---------------------------------------------------------------------- |
| peep   | message, timestamp, author (user_id), reply (parent_id), tag (user_id) |
| user   | email (unique), password (encrypted), name, username (unique)          |

1. Name of the first table (always plural): `peeps`

   Column names: `message`, `timestamp`, `user_id`, `parent_id`

2. Name of the second table (always plural): `users`

   Column names: `email`, `password`, `name`, `username`

3. Name of the join table (table1_table2): `peeps_users`

   Column names: `peep_id`, `user_id`

```plain
Table: peeps
id: SERIAL
message: text
timestamp: timestamp
user_id: user_id
peep_id: peep_id

Table: users
id: SERIAL
email: text
password: text
name: text
username: text
```

```sql
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  timestamp timestamp,
  user_id int,
  peep_id int,
  constraint fk_user foreign key(user_id) references users(id),
  constraint fk_peep foreign key(peep_id) references peeps(id)
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

CREATE TABLE peeps_users (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id),
  constraint fk_user foreign key(user_id) references users(id),
  PRIMARY KEY (peep_id, user_id)
);
```

### Planning pages

### Planning routes

### Test-drive and implement

### TODO

Add rake ?
