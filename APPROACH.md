Step 1

- Fork repo
- Add needed gems for interacting with postgress and testing capybara

Step 2

- Build test infrastructure
- run rspec --init
- add to spec_helper file needed info to test with capybara

Step 3

- build folders for MVC pattern
- create config.ru file to run the app via rake (task management and build automation tool)
  - can specify dependencies in rake

```ruby
require 'bundler'
require './chitter'

Bundler.require #will load all dependencies - no need to run bundler in terminal

run Chitter
```

Step 4

- Create feature folser: spec/feature
- Test drive a simple page - 'Hello world' via sinatra routes
- Create a view for peeps page erb :peeps

# Read & Refine requirements

Step 5

- Read & refine - understand requieremend

1. User can post and see a message

- user can adds a record to the db - create record command
- be able to see what I added on the main page - read record command
- database chitter - chitter_test
  - peeps table messages table
  - user table
  - one to many relationship

User table:

- id
- name
- username - UNIQ
- email - UNIQ
- pass

Peeps table:

- id serial PRIMARY KEY
- user_id int
- peep - varchar(240)
- timestamp (i need the time) - timestamp NOT NULL DEFAULT NOW();
- FOREIGN KEY user_id REFERENCES user(id)

Credentials table: LATER

2. User can see all messages in reverse chronological order - older at the top

- add a user to the db - create user command
- add messages from different users
- anyone can see what other users are saying: still getting all the message out here - no need for many to many yet
- messages table needs a field that keeps track of when the message was submitted - timestamp / sql function?
- reading messages back from the database requires a filter based on timestamp

Implementation:

- create user
- create peep
- save it to db
- back to main page
- see all peeps - including from different users

3. User can see the time of when the message was recorded in the database

- retrieving message from db will come with the time of when it was recorded
- display time alongiside message

4. User wants to sign up

- user can push a sign up button
- user can create a record in the user database with his
  - name
  - email - uniq
  - pass
  - username - uniq
- app shows
  - name
  - user handle
  - timestamp

5. User wants to log in the app

- user can push a log in button
- user can submit username / email and pass
- if username and pass match a record in the database
- user is sent to the messages routes
- user can submit message only in his name
- message should display his name alongside time and content

6. User can log out

- user can log out / access to messages route is therfore restricted again

7. User wants to receive message if tagged MUST LOOK AT WEEK CHALLENGE FOR THIS

- users can tag another user
  - another database - tag
  - many to many relationship between users and tags
  - 3rd table which links tags with messages
- if user is tagged a message is sent to his email address

# Plan

- Sketched on paper CRC card
- Domain model

Step 6

- TDD showing a peep on the /peeps routs and erb: peeps page - see it fail
- Hard code peep for this step
- TDD creating a peep class including all the attributes in the feature test - see it fail
- Create peep class based on the test
- Map the hardcoded peep to the Peep class in the /peeps route
- TDD display of 3 peeps
- Change view to handle an array of peeps

Step 7 - connect sinatra to external app

- Start with 2 databases: peeps and user - in the chitter database
- Replicate this database in a test database format
- TDD the creation of a user class
- Create user class with attributes from unit test
- TDD the creation of a Object Relational mapping - Object to interact with the database: database_connection.rb

  - class method setup
  - class method query - adds user and peep test and implementation

- TDD the move of logic of adding to the database in the class method

  - User.create
  - Peep.create
  - Peep.query - get all peeps out

- Create helper method to get 1 record out of the table - for testing purposes
- Set up testing environment to switch between test database and development database based on running a test or running the app
- Set up script to switch between env when app loads
- Set up script to clean testing database when running tests

Step 8

- Feature test creating a user
- Implement creation of a user - log in
- Add BYcript for saving password
- Feature test log in with correct password
- Feature test log in with incorrect password

Step 9

- Feature test adding and seeing a record
- Create the views and the routes to pass the test

Step 10

- Feature test adding a tag via a peep
- Unit test adding a tag to the tag table - unit test tag class
- Unit test adding finding a tag in the tag table - unit test tag class
- When user registers, a tag is createrd based on his username (atm)
- When a user submits a peep, if there is a word starting with @, a service is called to check the word against the tags databse: Tags.find(that_tag). If there is a match, first I will flash a message on screen

- Install pony gem to act as email service
- If there is a match, a email service is called to send an email to the tagged user - based on the tag i can retrieve the user id and his information

Step 11:
Work with travis CI - encoutered issues with sinatra flash and the email messaging service  
Sinatra flash was not being seen by Travis as teh registration in sinatra was put in a different environment  
Messaging service was not working (it was called in tests) as the credentials for email account are stored locally .gitignore
