Chitter Challenge
=================

[![2-C3-E80-D0-E391-481-C-95-F1-9-B8000895-AEC.png](https://i.postimg.cc/V6RNc5C0/2-C3-E80-D0-E391-481-C-95-F1-9-B8000895-AEC.png)](https://postimg.cc/PpCHWXKd)
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
- [ ] Email on tag
