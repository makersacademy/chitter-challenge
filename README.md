Chitter Challenge
=================

* This meets all the 'straight up' requirements
* All tests are green, test coverage is 100%
* This uses a PostgreSQL database and Sinatra web app

Setup:
-----

* To run the program you must set up a database locally (and for the tests to run, a test datbase needs to be set up also)
  * Create a database called chitter and a database called chitter_test
  * In chitter, create the following table:
  ```SQL
  CREATE TABLE messages 
    (id SERIAL PRIMARY KEY, content VARCHAR(100), created_at TIMESTAMP DEFAULT NOW(), name VARCHAR(50) DEFAULT 'No_name')
  ```

Run the program:
---------------

* To run the program, rackup and visit the route domain
* Enter name and submit
* You can now enter messages, see them appear along with the time they were posted and the name of the poster, and delete the messages

Next steps:
----------

* If I had more time with this I would like to find out how to implement a proper user management system with usernames & passwords - currently the user's name is stored in the session hash
