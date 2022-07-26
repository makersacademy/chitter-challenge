Approach to solving challenge
======

- Use user stories to write the first set of feature tests (which should fail). 
- Write a series of unit tests based on the client's requirements to ensure that all feature tests pass. 
- Refactor the code and ensure it conforms to the Travis style guide and SRP. 
- Submit a pull request. 


### How to use the development database:
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query saved in the file 01_create_peeps_table.sql.


### How to use the test database:
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_test;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the query saved in the file 01_create_peeps_table.sql.


### User Stories

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

### Order I'll build things in:
1. Post a peep ✅
2. Display peeps in reverse chronological order ✅
3. Sign up
4. Sign in
5. Sign out


### Summary
- I've not managed to finish all of the user stories but I've spent a lot of time working on this piece and reinforcing my learning from throughout the week.