README & user stories file

# Project Title:
Chitter Weekend Challenge

# Motivation: 
Attempt to complete week (4) - Weekend challenge with the aim to further reinforce learning outcomes from week 4 & to build a database. 
- Build a simple web app with a database (this primary goal breaks down into the two sub-goals below)
- Follow an effective debugging process for database applications
- Explain the basics of how databases work (e.g. tables, SQL, basic relationships)
- Agile and TDD
- Engineering and 'Dev Recipes'
- Databases
- Tooling

# Installation:
- git clone git@github.com:[ElliottZaki]/bookmark_manager.git
- cd bookmark_manager
- RVM: ruby-3.0.2
- bundle
- rspec
- simplecov 
- rubocop '1.20'
- rackup
- psql

# Notable sources & references
https://ruby-doc.org/

# Build status:
Start
README.MD
Testing stage

# Project:
I am going to write a small Twitter clone that will allow the users to post messages to a public stream.

# Project features:
- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.

# Possible features may incude:
* [ ] Sign up
* [ ] Log in
* [ ] Log out
* [ ] Peeping
* [X] Listing Peeps
* [ ] Display time of peep

# User story Template:
As a <Stakeholder>,
So that <Motivation>,
I'd like <Task>.

# User story 1:
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
____________________
noun     |   verb
---------|----------
Maker    | post
peep     |  
chitter  |  

chitter_manager ---> .post ---> post a message(peeps).

# Refractoring to MVC:
| Component   | Responsibility                              | Refactor                        |
|------------ |---------------------------------------------|---------------------------------|
| Model       | Encapsulate logic with relevant data        |                                 |
| View        | Display the result to a user                |                                 |
| Controller  | Get data from the model and put in the view | Render chitter data into to the view

# Instructions to connect to local server:
- cd /Users/elliottzaki/Desktop/Projects/chitter-challenge.
- Open a seperate terminal and type rackup on the command line.
- On your browser, connect to localhost(9292).

# Database creation instructions: 
- brew install postgresql
- brew services start postgresql
- Connect to psql
- Create the database using the psql command CREATE DATABASE chitter;
- Connect to the database using the pqsl command \c chitter;
- Create a table and call it chitter_posts
- CREATE TABLE chitter_posts(id SERIAL PRIMARY KEY, text VARCHAR(200));

# Instructions in how to connect to the database:
- gem install 'pg'
- require 'pg' in the Peep class
- Type the following in the Class method: connection = PG.connect(dbname: 'chitter_manager')
    result = connection.exec('SELECT * FROM chitter_posts')
    result.map { |peep| peep['chitter_posts'] }


# User story 2:
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
____________________
noun     |   verb
---------|----------
Maker    | see_all
peeps    | reverse
order    |  

chitter_manager ---> .all ---> messages(in - reverse chronoligical order). 

