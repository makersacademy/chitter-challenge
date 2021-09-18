Chitter Challenge
=================

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

Plan
----

* add peep to chitter -> stored in chitter database
* post '/add' request : views/add.erb


* view all peeps -> stored in chitter database, with a timestamp
* get '/view' request : views/view.erb


* How to timestamp an entry? 
* https://stackoverflow.com/questions/37616760/how-to-insert-timestamp-into-my-mysql-table


* post '/signup' request
* email and password stored in params or another table in the database : views/signup.erb


* Make a Chitter database and a Chitter-test database
* Note sql setup in db/migrations/01.sql