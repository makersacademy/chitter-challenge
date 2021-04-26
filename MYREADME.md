# Chitter Challenge

The Ruby Web Project Setup List:

Source: https://github.com/makersacademy/course/blob/master/pills/ruby_web_project_setup_list.md

Database Setup:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query we have saved in the file 01_create_chitter_table.sql

Test Database Setup:

1. Connect to psql
2. Create the database using psql command CREATE DATABASE chitter_test;
3. Connect to the database using the psql command \c chitter_test;
4. Run the query we have saved in the file 01_create_chitter_table.sql

User Story 1

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

![Domain model user story 1](https://github.com/dominicmeddick/chitter-challenge/blob/master/images/Screenshot%202021-04-25%20at%2013.20.19.png)

User Story 2

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```