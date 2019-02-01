## Chitter Challenge - week 4

#### User stories
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
```

### Model

|Client|Controller|Model|Views|Databse|
|------|----------|-----|-----|-------|
|request --> | app | ask for name | '/' | user table |
|   |    | allow to post peeps | '/peeps' | peeps table |
|   |   |  adds time.now |   |   |

### Set up the Database:
 - Connect to psql
 - Create the database using the psql command `CREATE DATABASE chitter`;
 - Connect to the database using the pqsl command `\c chitter`;
 - Run the query we have saved in the file 01_create_table.sql
