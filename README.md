## Chitter Challenge

### Project Requirements:

The following user stories serve as product specifications:

#### User Story One:
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
#### User Story Two:
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
#### User Story Three:
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
#### User Story Four:
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
#### User Story Five: (HARDER)
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
#### User Story Six: (HARDER)
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
#### User Story Seven: (ADVANCED)
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Setting up your database

Connect to `psql` and create `chitter` database:

```
CREATE DATABASE chitter;
```

To setup tables, connect to the database in `psql` and run the SQL scripts in `db/migrations`

## Setting up your TEST database

Connect to `psql` and create `chitter_test` database:

```
CREATE DATABASE chitter_test;
```

To setup tables, connect to the database in `psql` and run the SQL scripts in `db/migrations`

### Running the Chitter app

```
rackup -p 3000
```

View Chitter feed by navigating to `localhost:3000/`.
