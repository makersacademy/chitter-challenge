# Chitter Challenge

### Setup

1. Open up your shotgun server by doing the following: 
* `shotgun -p 1234`

2. Visit `localhost:1234`

3. Begin interacting with the chitter app

### To start your own database for Peeps

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_manager;
3. Connect to the database using the pqsl command \c chitter_manager;
4. Run the query we have saved in the file 01_create_peeps_table.sql