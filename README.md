Chitter Challenge
=================


## Setup

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
 ```

## Features:
-------

```
- [x] Message posting
- [x] Sort messages by reverse chronological order
- [x] Display time of message posted
- [x] Registration
- [x] Log In
- [x] Guest Mode
- [ ] Log Out
- [ ] Email on tag
- [ ] Unique username authentication
- [ ] Email and Name sign up
- [ ] CSS Styling
- [ ] Message replies
```
