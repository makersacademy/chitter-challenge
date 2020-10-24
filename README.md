Chitter Challenge
=================

##In this project, I have created a mock twitter called chitter where users can post messages and see them displayed. They are also able to see the messages posted by other users.

## Setting up your database

**Create Bookmark Manager DB**

1. Connect to ```psql``` in your terminal.
2. Create the database using the psql command ```CREATE DATABASE chitter;```
3. Connect to the database using the pqsl command ```\c chitter;```
4. Run the query we have saved in the file ```01_create_peeps_table.sql```

**Create Bookmark Manager TEST DB**

Do the above again, with the following changes:

- Step 2: ```CREATE DATABASE chitter_test;```
- Step 3: ``` \c chitter_test;```