# Chitter

A simple clone of Twitter that allows users to sign up, log in, make a "peep",
view the peeps of others and sign out. Data models were created using Datamapper,
there are two models in the current version `Peep` and `User`.

## User Stories

```
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

## Database

`peeps` table:

| field | type |
| --- | --- |
| id | PRIMARY SERIAL ID |
| body | VARCHAR(240) |
| created_at | DATE TIME |

`users` table:

| field | type |
| --- | --- |
| id | PRIMARY SERIAL ID |
| name | VARCHAR(100) |
| username | VARCHAR(60) |
| password | VARCHAR(60) |
| email | VARCHAR(100) |

## Models

| object | message |
| --- | --- |
| peep | @id |
| | @body |
| | @created_at |
| | .sort_by_date_created |
| | #created_at_time |
| | #created_at_date |

| object | message |
| --- | --- |
| user | @id |
| | @name |
| | @username |
| | @password |
| | @email |
