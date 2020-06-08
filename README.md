Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

- [x] User Story 1
- [x] User Story 2
- [x] User Story 3
- [ ] User Story 4
- [ ] User Story 5
- [ ] User Story 6
- [ ] User Story 7


### User Story 1
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
### User Story 2
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

### User Story 3
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

### User Story 4
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

HARDER

### User Story 5
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
### User Story 6
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

ADVANCED

### User Story 7
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

DATABASE COMMAND INSTRUCTIONS :
-------

1. psql
2. CREATE DATABASE chitter;
3. \c chitter;
4. \dt

Let's create a directory for the database setup called db, and a sub-directory within it, migrations.

1. - db/
2.   - migrations/
3. 01_create_peeps_table.sql

DATABASE TEST COMMAND INSTRUCTIONS :
-------

1. psql
2. CREATE DATABASE chitter_test;
3. \c chitter_test;
4. \dt

Let's create a directory for the database setup called db, and a sub-directory within it, migrations.

1. - db/
2.   - migrations/
3. 01_create_peeps_table.sql
