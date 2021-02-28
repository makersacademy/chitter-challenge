# Chitter Challenge

## User stories
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
**Notes on functionality**
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.
**Automated Tests**
If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.
- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

## Planning

| Peep         | User   |         Time |    Chitter |
| :-----:      | :----: |         :---: |       :---:|
| @content     | @name     | log_current() | post/create() |
| @creation_date | @username (unique) |  | list() |
| @created_by | @email (unique)|
|              | @password |


## Setting up the Databases
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE `chitter_test`;
3. Connect to the database using the pqsl command \c `chitter_test`;
4. Run the query we have saved in the file 01_setting_up_users_database.sql
5. Run the query we have saved in the file 02_setting_up_peeps_database.sql
6. Create the database using the psql command CREATE DATABASE `chitter_development`;
7. Repeat steps 3, 4 and 5
