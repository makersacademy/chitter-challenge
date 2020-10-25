Connect to psql
Create the database using the psql command CREATE DATABASE chitter_db;
Connect to the database using the pqsl command \c chitter_db;
Run the query we have saved in the file 01_create_makers_table.sql
Run the query we have saved in the file 02_create_peeps_table.sql

Create test db
Create the database using the psql command CREATE DATABASE chitter_db_test;
Connect to the database using the pqsl command \c chitter_db_test;
Run the query we have saved in the file 01_create_makers_table.sql
Run the query we have saved in the file 02_create_peeps_table.sql


To run Chitter:
1. install bundle
2. use rackup or shotgun
3. go to http://localhost:9292/peeps
4. sign up
5. Add peeps
6. Click 'All peeps' to se all peeps.
7. Sign out


Project is based on https://github.com/makersacademy/course/blob/master/bookmark_manager/00_challenge_map.md#challenges

Features completed:
[x] I want to post a message (peep) to chitter
[x] I can see all peeps
[x] I want to sign up for Chitter
[x] I want to log in to Chitter (happy path only)
[x] I want to log out of Chitter

Features uncompleted:
[] I want to see all peeps in reverse chronological order
[] I want to see the time at which it was made
[] I want to receive an email if I am tagged in a Peep
[] I want to log in to Chitter - unhappy path
[] Work on the CSS to make it look good
