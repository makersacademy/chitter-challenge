# Chitter Challenge #

My answer to the almighty Chitter Challenge! I have created a Twitter clone that fulfils the following use stories:

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
get '/'
click_button 'post peep'
post 'add_peep'
model layer: add_peep to database
redirect '/'
show peeps

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

get '/'
click_button 'order by newest peeps'
get '/newest-peeps'
iterate in reverse, over array from database
puts

## How to use Chitter to grace the Social Skies ##

You're welcome to clone this repo and play around with it. Make sure to follow these steps after cloning:

1. Connect to ```psql```
2. Create two databases with these ```psql``` commmands:
  ```CREATE DATABASE chitter;```
  ```CREATE DATABASE chitter_test;```
3. Connect to the databases, one by one, using the ```psql``` commands:
  ```\c chitter;```
  ```\c chitter_test;```
4. Run the query listed in the ```01_create_chitter_table.sql``` file within the db/migrations directory for each db.

You can then run the web app on your local machine with this command:
```rackup -p 4567```
