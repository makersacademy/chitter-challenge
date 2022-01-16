Chitter Challenge
=================

I am doing the chitter challenge which is to create a Twitter clone that allows the user to post messages to a public stream.

First I will install the gems needed to run the web app and testing, update sepc_helper.rb, and setup app.rb and config.ru.

Seting up the databases:
----------
Setting up the peeps table in chitter directory:
(This will be used when the application is being run)
1. psql
2. psql CREATE DATABASE chitter;
3. psql \c chitter;
4. Run the query in 01_create_peeps_table.sql

Setting up the peeps table in chitter directory:
(This will be used when the application is being tested)
1. psql
2. psql CREATE DATABASE chitter_test;
3. psql \c chitter_test;
4. Run the query in 01_create_peeps_table.sql

User Stories that have been met:
-------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter




```
