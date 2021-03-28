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
| GET     | /add_peep  |  new   | peep         | displays form to add a peep                           |
| POST    | /peeps      | create | peep         | creates a peep, /redirects to peeps                   |



##### Databases

chitter accounts:
|  id   |  name   |  username   |  email  |  password   |
|-------|---------|-------------|---------|-------------|
|   1   |         |             |         |             |

peeps:
|  id   |  body   |  time   |   username   |  
|-------|---------|---------|--------------|
|    1  |         |         |              |


ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

----

### Notes on functionality:
------

[X] You don't have to be logged in to see the peeps.
[X] peeps are viewed in reverse chronological order
[X] Peeps (posts to chitter) have the username of the maker

[X] Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog). - this currently saves to a database with no further implementation
[X] form username and name fields are required for sign up and login
[X] !!! form email and password fields are NOT required or recommended for sign up and login while not protected !!!


[X] Work on the CSS to make it look good.

----

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

- integrated databases using the `PG` gem and `SQL`

---

### Things to implement:

[ ] login does not currently map to existing sign ups
[ ] there is no password match
[ ] protect email and passwords
[ ] The username and email are unique
[ ] In order to start a conversation as a maker I want to reply to a peep from another
[ ] Peeps (posts to chitter) have the name of the maker

[ ] connect create a table to travis??

#### table not yet implemented:
account_peeps:
|  account_id   |  peep_id   |
|---------------|------------|
|    1          |            |



-----
