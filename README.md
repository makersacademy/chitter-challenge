Chitter Challenge
=================

 a small Twitter clone that will allow the users to post messages to a public stream.

 Tags: Ruby, MVC, RSpec, TDD, OOP, Sinatra, Capybara, postgreSQL, CRUD, registration, authentication

 ## Domain model

 This program was built using the MVC structure and using sinatra as a framework. 

 The Model consists of a peep object that handles the CRUD lifecycle of a peep, and a database connection object which uses the PG gem to connect to a postgreSQL database. The database connection object enables connection to either a test or a development database depending on the context in which it is called.

 ```

    Client
╔════════════╗  
║            ║ Sends HTTP requests
║  Browser   ║ (GET, POST, PATCH, DELETE)
║            ║
╚════════════╝
      |
      |
Sinatra Framework 
╔════════════╗
║            ║ 
║   SERVER   ║ 
║            ║
╚════════════╝
      |
      |
   app.rb                       Model
╔════════════╗             ╔════════════╗          ╔════════════════════════╗
║            ║------------>║            ║--------->║                        ║
║ Controller ║             ║    Peep    ║          ║  Database connection   ║
║            ║<------------║   (class)  ║<---------║    (class(PG))         ║
╚════════════╝             ╚════════════╝          ╚════════════════════════╝
      |                                                    |          |
╔════════════╗                                            |          |
║            ║                                            |          |
║ Views (erb)║                                     ╔════════════════════════╗
║            ║                                     ║                        ║
╚════════════╝                                     ║      SQL Database      ║
                                                    ║                        ║
                                                    ╚════════════════════════╝

```


## Using the app

You will need to create two PostgreSQL databases on your local machine, table names `chitter` and `chitter_test` using the instructions below.

```
$ git clone https://github.com/Lucx14/chitter-challenge.git
$ cd chitter-challenge
$ bundle install
$ rackup
```
## Setting up a local database

I have used psql to connect to a local postgreSQL relational database on my machine. To interact with this program you will need to do the same. Please follow these steps in the terminal

* Connect to psql
* Create the database using the psql command `CREATE DATABASE chitter;`
* Connect to the database using the psql command `\c chitter`
* Run the query I have saved in the file `01_create_peeps_table.sql` (in ./db/migrations)
* Create a test database using psql command `CREATE DATABASE chitter_test;`
* Connect to the test database `\c chitter_test`
* Run the query I have saved in the file `01_create_peeps_table.sql` (in ./db/migrations)

* Modify the peeps table for the development and test databases using the query in `02_add_time_to_peeps.sql`
* Create a table for comments for the development and test databases using the query in `03_create_comments_table.sql`
* Create a table for users for the development and test databases using the query in `04_create_users_table.sql`
* Modify the peeps table for the development and test databases using the query in `05_add_userid_to_peeps.sql`

## Database Model

#### Table name: peeps

| Column name   |  Data type     |
| ------------- | -------------- |
| id            | int4           |
| text          | varchar(140)   |
| time    | varchar(60)      |
| user_id | INTEGER REFERENCES users (id)

#### Peeps has a one to many relationship with comments

| id | text                       | peep_id |
|----|----------------------------|-------------|
| 1  | I agree!            | 223         |
| 2  | I don't think so | 223         |
| 3  | What a cool peep       | 444         |

#### Users table

| id | email                       | password |
|----|----------------------------|-------------|
| 1  | test@example.com            | ** Encrypted **         |
| 2  | luke@gmail.com | ** Encrypted **         |
| 3  | helen@yahoo.com       | ** Encrypted **         |

### To run the app

```
$ rackup
```
Open up a browser and go to the localhost port that the terminal has opened (will probably be localhost:9292)

### To run tests
```
$ rspec
```

User Stories:
-------

```
as a social media user
so i can see the chitter feed
i want to be able to view the chitter peeps

As a social media user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

as a social media user
so i can remove peeps from my peep feed
i want to delete a peep

As a social media user 
So I can fix a typo or a mistake
I want to be able to edit a peep

As a social media user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a social media user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a social media user
So others can let me know what they think
I want to be able to add comments to peeps 

As a social media user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a social media user
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a social media user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
