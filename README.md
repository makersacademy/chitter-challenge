Chitter Challenge
=================

A Twitter Clone built in Ruby using Sinatra, Capybara, PostgreSQL, and Bootstrap.

[![B1729-A7-C-507-F-4267-9388-4-CBC49512-B4-C.jpg](https://i.postimg.cc/cHQF1Gxn/B1729-A7-C-507-F-4267-9388-4-CBC49512-B4-C.jpg)](https://postimg.cc/Pp5WKc8X)
## Setup

```
bundle
 ```

 ### To set up the database

 Connect to `psql` and create the `bookmark_manager` database:

 ```
 CREATE DATABASE chitter;
 ```

 To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

 ### To run the Chitter app:

 ```
 rackup -p 3000
 ```

 To get started, navigate to `localhost:3000/`

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
