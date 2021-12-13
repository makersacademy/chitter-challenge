Chitter Challenge
=================

A Twitter Clone built in Ruby using Sinatra, Capybara, and PostgreSQL.

CSS: Future Coders

[![FE4-DCA6-D-27-EB-4327-8-F83-2-D89-D141-EA7-D.jpg](https://i.postimg.cc/FzVWcGr1/FE4-DCA6-D-27-EB-4327-8-F83-2-D89-D141-EA7-D.jpg)](https://postimg.cc/T5hJvVWX)
## Setup

```
bundle
 ```

 ### To set up the database

 Connect to `psql` and create the `chitter` database:

 ```
 CREATE DATABASE chitter;
 ```

 To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

 ### To run the Chitter app:

 ```
 rackup -p 3000
 ```

 To get started, navigate to `localhost:3000/`

### Test setup

Follow the database setup instructions, but with the `chitter_test` database.

To run tests:

```
rspec
```

## Features:

- [x] Message posting
- [x] Sort messages by reverse chronological order
- [x] Display time of message posted
- [x] Registration
- [x] Log In
- [x] Guest Mode
- [x] Log Out
- [x] Unique username authentication
- [x] Message replies
- [x] CSS Styling
- [x] RESTful Routing
