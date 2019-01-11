# Chitter Challenge

This repository is a Ruby with Sinatra implementation of a small Twitter clone that will allow the users to post messages to a public stream. The instruction and user stories can be found [here](https://github.com/EllyChanx/chitter-challenge/blob/master/Instruction.md).

#### To set up the project
Clone this repository and then run: 

```
bundle install
```

#### To set up the database
Connect to `psql` and create the `chitter` database:

```
\psql postgres

CREATE DATABASE chitter;
```
To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

#### To run the Chitter app:

```
rackup
```
