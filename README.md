# Chitter Challenge
Makers Academy Weekend Challenge 4. A simplified version of a Twitter app:

Technologies
-----
* Ruby
* Sinatra
* PostgreSQL
* RSpec
* Capybara
* CSS
* HTML.

User Stories
---

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

# Getting Started
Installation
---
1. Clone this repo and install all the gems
```
git clone https://github.com/TomasGarciaDev/chitter-challenge
cd rps-challenge
bundle install
```

2. Run the app
```
rackup
```

3. Open in browser
```
http://localhost:9292/
```


Setting up the database
---
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query saved in the file 01_create_peeps_table.sql

Setting up the test database
---
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the query saved in the file 01_create_peeps_table.sql

To run tests
---
```
rspec
```


Notes on functionality:
---



Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

## Setting up the database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query saved in the file 01_create_peeps_table.sql

## Setting up the test database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the query saved in the file 01_create_peeps_table.sql
