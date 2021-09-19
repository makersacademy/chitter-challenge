# Chitter Challenge

# To do 

* SQL injection
* allow the user to log in and out
* rspec does not loadup web_helper.rb file (currently not able to call the method - not DRY )
* persisted_data variable in spec test needs to be refactored along DRY principles

****

# User Stories 

* I want to see the time at which it was made (peep)
* I want to see all peeps in reverse chronological order
* I want to sign up for Chitter
* I want to log in / log out to Chitter
* I want to receive an email if I am tagged in a Peep

Chitter 

* -> log messages
* -> log time / date / username (unkown if not logged in)
* -> print messages 
* -> order messages by date 

User 
* -> log in 
* -> log out
* -> recieve message 

****

# SQL Queries

* Connect to psql
* Create the database using the psql command "CREATE DATABASE bookmark_manager;"
* Connect to the database using the psql command "\c chitter_manager;"
* Run the query we have saved in the file 01_create_bookmarks_table.sql
* Repeat the first few steps and create a test database named 'chitter_manager_test'

# To run

* Create SQL tables per the above
* Clone Repo 
* Navigate to the current directory ... /path/to/chitter-challenge
* Run app -> 'ruby app.rb' 

****

# Domain Model 

* Client 
* Controller 
* Model
* View 


*** 

<img width="925" alt="Domain Model - Website example " src="https://user-images.githubusercontent.com/54316167/133464675-558c8a70-e31a-406a-b350-744b22b47b53.png">