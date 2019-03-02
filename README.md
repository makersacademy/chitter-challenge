# Chitter Challenge
We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

## User Stories

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

## Technolgies

This project uses Ruby, Sinatra, Sinatra Flash, Postgres,

## Testing

Testing has been done with RSpec and Capybara.

## Using this Repo

1. Clone this repo: ```git clone https://github.com/acodeguy/chitter-challenge.```
2. ```cd``` into the newly-created directed and run ```bundle install``` to install needed Ruby gems.
3. Install the Postgres database server: ```brew install postgresql```. Need to [install Homebrew on your Mac?](https://brew.sh)
4. Create a database for Chitter: ```create database chitter```. See this link for [the offical documentation](https://www.postgresql.org/docs/9.0/sql-createdatabase.html) on creating databases with Postgres.
5. From within the pgql app, run each database migration in numerical order, to create the database tables: ```\i 01_create_peeps_table.sql```
6. Run the web server amd play to your heart's content: ```ruby app.rb```

## Improvements I'd Like to Make
1. Give it a nice UI/skin
2. Allow replies to Chits
3. Currently, testing is not done completely in isolation

