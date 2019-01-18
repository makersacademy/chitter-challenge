Chitter Weekend Challenge
=======

The challenge for the weekend was to create my own version of twitter using the knowledge I have learnt so far but also incorporating the use of databases which we have covered this week at Makers.

## How it works
Users are first presented with a view of the main page inviting them to sign up, log in or view peeps.

### Sign up
signing up takes the user to a screen inviting them to enter there details which are them stored on the database. All user names and emails must be unique and guard causes are in place to tell the user if one of them is already in use.

### Log in
log in takes the user to a log in page where a user name and password must be entered to log in. Once logged in the user is given the option of posting peeps on the peep feed. An option to log out also now appears on the main page along the other options so the user can log off when they are done.

### View Peeps
Any user whether or not they are logged in can view the peep feed but only logged in users are given the option to post.

### Post a Peep
If the user is logged in there will be an option on the page with the peep feed inviting them to post a peep. If selected the user is taken to a post peep page where they can enter a peep and hashtag other chitter users. If a valid user is hash tagged then an email alert is sent to that user containing the peep and who sent it.

### Other features
A user can tag another user in in their peep by using a # symbol before their user name. Once this happens the user that has been tagged will receive an email contained the peep message and the user that tagged them, encouraging them to log in and start peeping again!

## My approach
Before starting to code went through the user stories, wrote down in order the requirements and then started mapping out how I would eventually proceed with the MVC. This in turn pushed me into how I would eventually setup the Database, the tables and the information they will be holding. I refactored a few times throughout the process, mainly when I had to use class extraction but also when I saw an opportunity to keep the code DRY. Using TDD made me think about the problems one step at a time as I proceeded through the challenge.

## Reflection
I was a bit daunted by the prospect of this challenge, it seemed like a lot to do over one weekend but as I proceeded through I found I was very comfortable with how the coding went. I was thinking throughout about the objects and trying to keep their responsibilities separate and only letting them know as much as they needed to about each other. I really enjoyed the coding this weekend, it seemed to flow more than the other weekends! Getting the email alerts to work took a bit of time as I found out the dotenv gem (used for hiding sensitive information) was not quite working as I expected and some research indicated an extra line needed to be added to the config.ru file to get it to work. Once I had met all the user stories I turned my hand to having a bit of fun with the CSS and html design. I would like to make a feature that allows users to reply to peeps and start conversations along side the main peep feed.

## User stories
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
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

Notes on implimented functionality:
------

* You don't have to be logged in to see the peeps
* Makers sign up to chitter with their email, password, name and a username
* The username and email are unique
* Peeps (posts to chitter) have the name of the maker and their user handle

## Testing
To run the tests use `rspec` from the root directory.
Currently 100% test coverage. See notes on setup below to set up the databases.

## Technologies used
- Ruby
- Sinatra
- PostgreSQL
- Pony (email gem)

## Notes on setup

### Install gems
`bundle install`

### Ruby
Ruby 2.5.0 is needed to run this current version of the chitter challenge.

`ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin17]`


### Database setup
PostgreSQL is used for the database setup. A database named `chitter` and a `chitter_test` are used with `peeps` and `users` tables. Currently the `pg` gem is used to connect to the local database. These will need to be setup on your local machine currently. In `psql` enter the following commands:

database creation:

`CREATE DATABASE "chitter"`

`CREATE DATABASE "chitter_test"`

enter the database by entering `\c chitter` and enter the commands below to create the tables. Once done enter `\c chitter_test` and repeat.

peeps table setup:

`CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep
VARCHAR(60), created_at VARCHAR(60), user_id INTEGER);`

users table setup:

`CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60), user_name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));`


### Email Setup
Currently the email setup in the `email_notice.rb` file to send alerts is for a gmail account but the details can be easily changed to use any email client.

A creation on an `.env` is needed in the root directory and added to the `.gitignore` file. This needs to contain the user name and password details of the current gmail setup.

		USER_NAME = "email address"
		PASSWORD = "email password"

### Extra Information
The background image used is CC0 Creative Commons (Free for commercial use. No attribution required)		
