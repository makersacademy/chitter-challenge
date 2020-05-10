### Chitter App Challenge

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

### CRS Cards

### Domain model

Chitter | Peep | User
:--- | :--- | :---
#chitter_post | #peep_time | #user_sign_up
#chitter_all |  | #user_log_in
#chitter_delete |  | #user_log_out

### Database model 

chitter_user

id | name | email | password  
:--- | :--- | :--- | :---
1 | "Frodo" | "user-email@email.com" | "password"

chitter_peep

id | peep | peep_time | user_id
:--- | :--- | :--- | :---
1 | "peep" | "peep_time" | 1



**Views Plan:**
```
get '/'                 --> display sign-up and log-in path
get '/chitter'          -->  display peeps and chitter main page (links to other pages)
get 'user/sign_up'      --> diaplays sign_up.erb 
post 'user/sign_up'     --> saves data to DB and redirects to '/chitter'
get 'user/log-in'       --> displays sign_in.erb
get 'chitter/log-in'    --> validates data and redirects to 'display/user'
post 'chitter-post'      --> post peep and saves to DB redirects to '/chitter'
post 'chitter/delete/:id'  --> deletes peep from DB and redirects to '/chitter'
get 'chitter-sort'      --> displays all peeps in reverse order 
get 'chitter/log-out'   --> logs out user and destroy `session`

```

## Instructions to set up Database:
- Connect to psql
- Create the database using the psql command `CREATE DATABASE chitter_app;`
- Connect to the database using the pqsl command `\c chitter_app;`
- Run the query we have saved in the file 01_create_diary_table.sql
- Run the query we have saved in the file 02_create_user_chitter_table.sql

### create a test environment
- Create the database using the psql command `CREATE DATABASE chitter_app_test;`
- Connect to the database using the pqsl command `\c chitter_app_test;`
- Run the query we have saved in the file 01_create_diary_table.sql
- Run the query we have saved in the file 02_create_user_chitter_table.sql

Technical Approach:
-----

Integration of `PG` gem and `SQL` queries. 

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

**Features:**

## User Stories/Features
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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
