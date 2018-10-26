# Chitter #

## User Stories ##
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
```

### CRC Cards ###
![crc cards](images/crc_cards.png)

## Dependancies ##
* Capybara
* PG
* Rspec
* Rubocop
* Simplecov
* Simplecov-Console
* Sinatra

*NOTE: These can be installed by running `bundle` in the root of the directory.*

## How to Use ##
1. Open Terminal and clone the repository:
```bash
git clone https://github.com/aimeecraig/chitter-challenge.git
```
2. Change into the project directory:
```bash
cd chitter-challenge
```
3. Install the dependancies:
```bash
bundle install
```
4. Run the program:
```bash
rackup
```
5. Access the program from `localhost:9292`.

6. Create the database to store the bookmarks by following the steps below.

### Create the Database ###
1. In Terminal, connect to PostgreSQL:
```sql
psql
```
2. Create the database:
```sql
CREATE DATABASE chitter;
```
3. Connect to the database:
```sql
\c chitter;
```
4. Run the query in db/migrations/01_create_peeps_table.sql:
```sql
CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(140));
```
