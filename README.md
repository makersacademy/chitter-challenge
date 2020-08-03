## Chitter Challenge

To write a small Twitter clone that will allow the users to post messages to a public stream.

### Technologies Used

Sinatra and Rack for handling requests and responses
Capybara for feature testing
RSpec for unit testing
PostgreSQL for the databases
Ruby Gemfile ```pg``` for connecting and executing SQL on PostgreSQL database
Ruby Gemfile ```bcrypt``` for encrypting User passwords
Ruby Gemfile ```sinatra-flash``` for flashing messages

#### Setting Up Databases

##### Test Database
To utilise the tests within the ```spec``` directory please set up the following database:
1. Connect to ```psql```
2. Create the database using the ```psql``` command <br>
```CREATE DATABASE chitter_test;```
3. Connect to the database using the ```psql``` command <br>
```\c chitter_test;```
4. Run the all the queries detailed in the ```migrations``` directory <br>
```
.
├── db
    └── migrations
        └── 01_create_chitter_table.sql
        └── etc
``` 

##### Development Database
The following database should be set up for when the application is run locally:
1. Connect to ```psql```
2. Create the database using the ```psql``` command <br>
```CREATE DATABASE chitter;```
3. Connect to the database using the ```psql``` command <br>
```\c chitter;```
4. Run the all the queries detailed in the ```migrations``` directory <br>
```
.
├── db
    └── migrations
        └── 01_create_chitter_table.sql
        └── etc
``` 
5. It is recommended to truncate the tables in the ```chitter``` database after using it locally using the following ```sql``` command: <br>
```TRUNCATE peeps, users RESTART IDENTITY```

### User Stories
```
As the User
So that I can see all the peeps posted
I would like to see a list of posted messages (peeps).

As the User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter.

As a User
So the peeps can be ordered in reverse chronological order
I want the peeps to record when they were posted.

As the User
So that I can better appreciate the context of a peep
I want to see the time at which it was made.

As the User
So that other Users can identify who has authored posted messages
I want the authors of peeps displayed. 

As the User
So that other Users can identify me as the author of my posted messages
I want to have to sign up to post on Chitter. 

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

<img src="./domain-model-diagrams/chitter-challenge-add-peep.png" alt="Domain Model Diagram for Adding a Peep">

#### Walkthrough of Domain Model Diagram

- When the User visits the '/peeps/new' path, their browser sends a request to the Controller.
- The Controller receives the request and requests the html information from the peep/new view.
- The Controller recives the html and sends it as a response to the Client.
- The User submits the form to post a new 'peep', and so the Client sends a post request to the Controller.
- The Controller receives the request and sends the 'peep' params to the Model for it to create a new 'peep' object with.
-The Controller recives the 'peep' object from the Controller and makes a redirect to the '/peeps' route, thus requesting all the 'peeps' from the Peep class (Peep.all).
- The Peep class returns all the 'peeps' in an array to the controller, (which have been stored as an instance variable on the Peep class object).
- The Controller renders the array of 'peeps' to a webpage, which it sends as a response to the user.

