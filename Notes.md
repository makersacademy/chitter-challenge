#  Set up environment, structure controller

1. Create feature test to check the frontpage (frontpage_spec.rb)
2. Input first get method on Controller to see if works

# US 1

As a Maker

So that I can let people know what I am doing  

I want to post a message (peep) to chitter


# US 2

As a maker

So that I can see what others are saying

I want to see all peeps in reverse chronological order


# US 3

As a Maker

So that I can better appreciate the context of a peep

I want to see the time at which it was made

 * to be able to post, first user should be able to view all and then post
 * then user needs to fill_in a form and click_button 'Post Chit'
 * then user sees the posted chit

1. Feature test for See Chit
2. Run test: fail 'expected to find text "This ma chit" in "GET /chits"'
3. To pass test go to controller and use the '/chits' route and implement chits array (see diagram) where chits are stored
4. After tests pass, refactor with Model View Controller 
5. Connect controller with view @chits 
6. views/chits/index.erb will iterate through @chits to print that for Maker
7. Now controller gets data from model: passing a method to our Model class and call it in the controller (@chits = Chit.all)
8. Write a test for the method .all in spec and run rspec (undefined method all for chit class)
9. Write the method .all in Model
10. Change controller and require ./lib/chit so we can pass the method
----------------------------------
--- Set up database ---
1. Connect to psql postgres, CREATE DATABASE chit_manager - require to set up timezone
2. CREATE TABLE chits (id SERIAL PRIMARY KEY, message VARCHAR(280), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
3. Set up database and migrations
4. Set up pg gem  
5. Implement connection into Chit class to fetch from database
6. Iterate the results of the database to print the values

--- Set up test environment ---
1. Create test database CREATE DATABASE "chit_manager_test";
2. CREATE TABLE chits (id SERIAL PRIMARY KEY, message VARCHAR(280), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
3. Update .all method to connect either to test or normal environment
4. Update unit test to connect to test environment through PG
5. Set up database file for the connection to drop each run (truncate), which cleans up the data from chits table. 
6. Require database file in spec_helper
---------------------------------
11. Feature test for add chit with fill_in and click_button
12. Run rspec, unable to find field that is not disabled. 
13. Add get path to controller using params message, make connection with PG to test database and redirect to parent (front page with chits)
14. Create view file and add a form
15. Refactor and pass the connection to the Model for independence
16. Unit test for method .add
17. Implement method .add in Model (insert connection test database here)

  
# US 4
As a Maker

So that I can post messages on Chitter as me

I want to sign up for Chitter

1. Feature test sign up method
2. Update get / post paths in controller
3. Create form for sign_up.erb
4. No need for using unit tests as no new methods were added?
5. Create JavaScript redirection from frontpage to sign_up
6. Reorganise files and redirections after rackup


