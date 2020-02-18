# Chitter Challenge

An alternative micro blogging website. 

![image](https://user-images.githubusercontent.com/53436716/74739002-e8cf1180-524f-11ea-999e-bb8208a3c9ae.png)

![image](https://user-images.githubusercontent.com/53436716/74739054-000dff00-5250-11ea-8c8c-82d78571b49d.png)

![image](https://user-images.githubusercontent.com/53436716/74739107-1d42cd80-5250-11ea-98c6-c3e8c4687f63.png)

![image](https://user-images.githubusercontent.com/53436716/74739142-2df34380-5250-11ea-9569-361620481b1b.png)

## Features
- Sign up (warning if email or user handle already in use)
- Login (warning if incorrect log in details)
- Log out
- Write posts
- View all posts
- Display creator and time of posts
- Edit your own posts
- Delete your own posts
- Comment on posts

## User stories
```
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

As a Maker  
So that only I can post messages on Chitter as me  
I want to log in to Chitter

As a Maker  
So that I can avoid others posting messages on Chitter as me  
I want to log out of Chitter
```


## Domain modelling

| Account class | Message class | Comment class |
| ---- | --- | ---- |
| ```@id``` | ```@id``` | ```@id``` | 
| ```@username``` | ```@message``` | ```@comment``` |
| | ```@time``` | ```@time``` | 
| | ```@username``` | ```@message_id``` |
| | ```@comments``` | ```@username``` |
| ------------- | ------------- | |
| ```.create``` | ```.add``` | ```.add``` |
| ```.log_in``` | ```.all``` | ```.all``` | 
| ```.get_account_details``` | ```.delete``` | |
| ```.email_exists?``` | ```.edit``` | |
| ```.username_exists?``` | ```.get_message```| |

## Technologies Used

- Ruby
- Jquery
- Sinatra 
- Rspec
- Capybara
- SQL
- Bcrypt

## Code style
- OOD
- TDD

## Database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE message_database;```  
- Connect to the database using the ```pqsl``` command ```\c message_database;```  
- Run all the queries we have saved in the folder ```db\migrations\```  

## Test database setup

- Connect to ```psql```
- Create the database using the ```psql``` command ```CREATE DATABASE message_database_test;```  
- Connect to the database using the ```pqsl``` command ```\c message_database_test;```  
- Run all the queries we have saved in the folder ```db\migrations\``

## Run the app

Fork this repository and locate it in your terminal, then:
```
$ bundle
$ rackup  
$ open http://localhost:9292
```

## Run the tests

Run `rspec` in your terminal.

