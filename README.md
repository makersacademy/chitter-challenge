## Chitter Challenge

Description
-------

This is a clone of Twitter. Sign up and start posting your peeps!!

How to download the program
----

* Clone this repo
* Run the command `bundle install` in the command line to ensure you have all the relevant gems installed

Database instructions
----

1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the pqsl command `\c chitter;`
4. Run the query saved in the file 03_create_peeps_table.sql
5. Run the query saved in the file 04_create_users_table.sql
6. Create test database using psql command `CREATE DATABASE chitter_test;`
7. Connect to the database using the pqsl command `\c chitter_test;`
8. Repeat steps 4 and 5
10. Run the query saved in the file 05_add_userid_to_peep_table.sql in both databases

How to run the software
-----
After setting up your databases, run `rackup` in the command line to start the server. From here, navigate to localhost:9292 in your browser to visit the following pages:

![screenshot](https://github.com/valentina-maggio/chitter-challenge/blob/main/public/screenshots/01_welcome.png?raw=true)
![screenshot2](https://github.com/valentina-maggio/chitter-challenge/blob/main/public/screenshots/02_sign_in.png?raw=true)
![screenshot3](https://github.com/valentina-maggio/chitter-challenge/blob/main/public/screenshots/03_sign_up.png?raw=true)
![screenshot4](https://github.com/valentina-maggio/chitter-challenge/blob/main/public/screenshots/04_chitter_page.png?raw=true)
![screenshot5](https://github.com/valentina-maggio/chitter-challenge/blob/main/public/screenshots/05_new_peep.png?raw=true)
![screenshot6](https://github.com/valentina-maggio/chitter-challenge/blob/main/public/screenshots/06_sign_out.png?raw=true)

How to run the tests
-----
Make sure to be in the root folder of the project, then run `rspec` from the command line to run all feature and unit tests. 
The tests are run in the test environment, where the table are cleared every time before running the tests.

User stories used to design the software
-------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

Steps taken to build the software
-------

1. Domain modelling and diagramming to design the software implementation
2. Project setup. Installation of the relevant gems
3. Databases creation
4. Setup testing environment and configurations
5. MVC model creation following TDD approach
6. Creation of Peep and User classes
7. Secured user password with BCrypt gem
8. Code refactoring, creation of web helpers
9. Styling to web pages

Technologies used
-----
* Ruby
* Sinatra
* Capybara
* Rack
* SQL
* Postgres
* HTML
* CSS
* Simplecov
* Rubocop

Future implementations to consider
-----
* Use Active Record to manage database connections
* Implement email to send to user when tagged in a Peep
* Add ability for user to reply to a peep from another user

