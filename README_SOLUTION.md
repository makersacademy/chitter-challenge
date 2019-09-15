### Description
A messaging board

### Set up

app.rb id the controller, to run on localhost run rackup.
erb files in the views directory, model is in lib directory,
tests are in the spec directory

### It is partially functional a user can add messages and read previous ones.
All tests are passing  

### To set up the database

Connect to 'psql' and create the 'chitter' and 'chitter_test' databases:

'''
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
'''

To set up the appropriate tables, connect to each database in 'psql' and run the SQL scripts in the 'db/migrations' folder in the given order.
