Chitter Challenge
=================

In this project, I have created a mock twitter called chitter where users can post messages and see them displayed. They are also able to see the messages posted by other users.

## Setting up your database

**Create Chitter DB**

1. Connect to ```psql``` in your terminal.
2. Create the database using the psql command ```CREATE DATABASE chitter;```
3. Connect to the database using the pqsl command ```\c chitter;```
4. Run the query we have saved in the file ```01_create_peeps_table.sql```

**Create Chitter TEST DB**

Do the above again, with the following changes:

- Step 2: ```CREATE DATABASE chitter_test;```
- Step 3: ``` \c chitter_test;```

**Adding time to the databases**

- Step 1: ```\c chitter```
- Step 2: ```Run the sql commands in the 02_add_time_to_peeps.sql file ```
- Step 3: Repeat for ```\c chitter_test```

**HOW TO USE THIS APP**

- ```$ git clone https://github.com/CamLogie/chitter-challenge.git ```
- ```$ bundle```
- ```Create Chitter and Chitter test databases and add time to them```
- ```$ rspec```
- ```$ rackup```


To interact with the application simply type in a message to the homescreen when prompted and the app will show you all the messages you've ever posted and when you posted them. 