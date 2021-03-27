Chitter Challenge
=================

Features:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter


##### Model
|  class         |  instance |     method      |
|----------------|-----------|-----------------|
| ChitterAccount | @name     |                 |
|                | @username |                 |
|                | @email    |                 |
|                | @password |                 |
| Peep           | @body     |  add_peep       |
|                | @time     |  view_all_peeps |


##### Views
|  views         |   responsibility                      |
|----------------|---------------------------------------|
| homepage       | signup and login buttons              |
| sign up page   | form: name, username, email, password |
| login page     | form: username, email                 |
| peeps          | viewing all peeps                     |
|                | login/signup button OR logout         |
|                |                                       |


##### Controller

|  http   |   route     | action | resource     |   used for                                            |
|---------|-------------|--------|--------------|-------------------------------------------------------|
| GET     | /           |    -   |   -          | displays sign up/login buttons                        |
| GET     | /sign_up    |  new   | user/account | displays sign_up form                                 |
| POST    | /sign_up    | create | user/account | creates an account, /redirects to peeps               |
| GET     | /login      |  new   | session      | displays login form                                   |
| POST    | /login      | create | session      | logs in, /redirects to peeps                          |
| GET     | /peeps      | index  | peep         | displays all peeps(login button or username,logout)   |
| POST    | /logout     | delete | session      | logs out, /redirects to peeps or homepage?            |
| GET     | /peeps/new  |  new   | peep         | displays form to add a peep                           |
| POST    | /peeps      | create | peep         | creates a peep, /redirects to peeps                   |



##### Databases

chitter accounts:
|  id   |  name   |  username   |  email  |  password   |
|-------|---------|-------------|---------|-------------|
|   1   |         |             |         |             |

peeps:
|  id   |  peep_body   |     |    |     |
|-------|---------|-------------|---------|-------------|
|    1  |         |             |         |             |

account_peeps:
|  account_id   |  peep_id   |     |    |     |
|-------|---------|-------------|---------|-------------|
|    1  |         |             |         |             |


ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

----

### Notes on functionality:
------

[X] You don't have to be logged in to see the peeps.
[X] Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
[ ] The username and email are unique.
[ ] Peeps (posts to chitter) have the name of the maker and their user handle.
[ ] Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----
[ ] In order to start a conversation as a maker I want to reply to a peep from another maker.
[ ] Work on the CSS to make it look good.

----

###TO DO:
[ ] remove global variable on username shown when logged in
[ ] use class method to view logged in username

### Chitter database setup
Connect to psql
Create the database using the psql command CREATE DATABASE chitter;

### Chitter TEST database setup
Connect to psql
Create the database using the psql command CREATE DATABASE chitter_test;

####creating peeps table
Connect to the database using the pqsl command \c chitter_test
Run the query saved in db/test/01_create_peeps_table.sql
####creating users table
Connect to the database using the pqsl command \c chitter_test
Run the query saved in db/test/01_create_users_table.sql



---
### Things to implement:
Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Technical Approach:
-----

In this unit, you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [Datamapper wiki](https://en.wikipedia.org/wiki/DataMapper)
- [Sinatra, PostgreSQL & DataMapper recipe](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-datamapper.md)

**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)
