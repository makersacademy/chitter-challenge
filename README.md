Chitter Challenge
=================
[![Build Status](https://travis-ci.org/jessmar94/chitter-challenge.svg?branch=master)](https://travis-ci.org/jessmar94/chitter-challenge)
## Summary
Write a small Twitter clone that allows users to post messages to a public stream.

This project has 20 passing tests with 100% test coverage.

## SQL Queries
### Create Peep_Manager Database and Peeps Table
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE peep_manager;`
3. Connect to the database using the `psql` command `\c peep_manager`
4. Run the query I have saved in the file `01_create_peeps_table.sql`

### Create Peep_Manager_Test Database and Peeps Table
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE peep_manager_test;`
3. Connect to the database using the `psql` command `\c peep_manager_test`
4. Run the query I have saved in the file `01_create_peeps_table.sql`

### Edits to Peeps Tables
1. Connect to `psql`
2. Connect to the database using the `psql` command `\c peep_manager_test`
3. Run the query I have saved in the file `02_add_created_at_column.sql`
3. Run the query I have saved in the file `04_add_userid_to_peeps.sql`
3. Run the query I have saved in the file `05_remove_name_handle_from_peeps.sql`
4. Repeat from step 2 but connect to `\c peep_manager`

### Create Users Table
1. Connect to `psql`
2. Connect to the database using the `psql` command `\c peep_manager_test`
3. Run the query I have saved in the file `03_create_users_table.sql`
4. Repeat from step 2 but connect to `\c peep_manager`

## How to Install and Run
First clone this repository and move to the directory the repo has been cloned to.
Follow the SQL commands above to setup the required databases locally.
To see the repository in action first install the dependencies by running
```
bundle install
```
and then load the webpage by running
```
rackup
```
Navigate to localhost:9292 in your web browser.

## How to Run Tests
1. Run the command `rspec` in your terminal.
2. Run the command `rubocop` in your terminal to check code quality.

## User Stories
STRAIGHT UP
```bash
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```bash
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

```bash
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

```bash
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

HARDER
```bash
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

```bash
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

ADVANCED
```bash
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
``` 

## Plan
See my [plan](https://github.com/jessmar94/chitter-challenge/blob/master/plan.md) for more information.

## Images 

![Image of Homepage]
(Homepage.png)

## Project Status
As of December 10th 2019, all of the user stories have been implemented. 

If I have more time, I would like to implement an edit/delete functionality for a user and their peeps. I would also like to implement the final user story, allowing a user to tag another user in a peep and for the tagged user to be notified via email which I would do using a library such as [Pony](https://www.rubydoc.info/gems/pony/1.11). In order to implement the email feature, I would want to create a messaging class and messaging table which stores the sender_id, receiver_id and email_content. 
