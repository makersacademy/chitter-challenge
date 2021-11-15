Chitter Challenge
=================




Features implemented:
---------------------


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

```

![Chitter user story 1 domain model](./public/images/user_story_1_diagram.png)
![Chitter user story 2 domain model](./public/images/user_story_2_diagram.png)


Database setup:
---------------
1. Launch psql
2. Create the Chitter databases using CREATE DATABASE chitter; and CREATE DATABASE chitter_test;
3. Connect to the Chitter database with \c chitter and run the command in 01_create_peeps_table.sql. Do the same for the chitter_test database.