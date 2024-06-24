Chitter Challenge
=================

MVC
----
* Chitter is my Controller class (in app.rb)
* Peep is my Model class (in lib/peep.rb)
* view_peeps is my View (in views/view_peeps.erb)


Plan
----
* view peeps 
  * HTTP REQUEST: get '/view_peeps'
  * ROUTE: '/view_peeps' 
  * VIEWS: view_peeps.erb

* posting a peep
  * HTTP REQUEST: post '/post_peep' 
  * ROUTE: redirect to '/view_peeps' after post request
  * VIEWS: form at the top of view_peeps.erb
  * DB: peep message stored in chitter_peeps table, with a timestamp and serial ID number

* sign up
  * HTTP REQUEST: post '/signup' 
  * ROUTE: redirect from get '/' to get '/signup' 
  * VIEWS: form for email and password in views/signup.erb
  * DB: data stored in params or another table in the chitter database


Instructions for Database Setup and Test Database Setup
-------------------------------------------------------

* Connect to psql
* Create the two databases using the psql command: 
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```
* Connect to each database using the pqsl command 
```
\c chitter;
\c chitter_test;
```
* To setup the approriate tables, run the SQL script saved in the `db/migrations` folder in the given order


### To run the Chitter app:

```
rackup -p 3000
```

Resources
---------
* How to timestamp a data entry? 
* https://stackoverflow.com/questions/37616760/how-to-insert-timestamp-into-my-mysql-table

User Stories
------------
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

```