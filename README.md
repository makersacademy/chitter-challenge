Chitter Challenge
=================

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!

Database set up: chitter
---------
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query saved in the file 01_create_chitter_table.sql
5. Add the time column to chitter by running add_time_to_chitter_table.sql

Database set up: users
-----------
1. Connect to psql
2. Create database  using psql command CREATE DATABASE chitter;
3. Connect to the database using the psql command \c chitter
4. Run the query saved in the file 03_Create_User_table.sql

Notes
--------
Got blocked on creating user log in.
Had a go at it but couldnt get it working.
Feel like its nearly there but ran out of time.

Feel like I got the first 4 user stories done but then ran out of time.
Created a sign up page and a users table to store login information.
Added user sign up info to user table in sql.

Also no tests added in. This is an area I need to improve on.

Would also liked to have formatted better as looks very amateur.

Hoping this week will be a chance to go back over this and consolidate/learn more.