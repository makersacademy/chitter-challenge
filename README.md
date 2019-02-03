Chitter Challenge
=================

A small Twitter clone that allows the users to post messages to a public stream.

User stories:
-------

Satisfied:
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

```
Missing:
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

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

Instructions to get started:
-----
Clone this repo and run bundle install.

Instructions to set up database:
-----
1. Connect to `psql` in your terminal.
2. Create the database using the `psql` command: `CREATE DATABASE chitter;`
3. To set up the appropriate tables, connect to the database in `psql` (`\c chitter;`) and run the queries in the `db/migrations` folder in the given order.

Instructions to set up test database:
-----
1. Connect to `psql` in your terminal.
2. Create the database using the `psql` command: `CREATE DATABASE chitter_test;`
3. To set up the appropriate tables, connect to the database in `psql` (`\c chitter_test;`) and run the queries in the `db/migrations` folder in the given order.

Instructions to run the app:
-----
```
rackup -p 3000
```
To view bookmarks, navigate to `localhost:3000/bookmarks`.


Technical Approach:
-----

Chitter was built using the `PG` gem and `SQL` queries to integrate a database of posts and users into the web application.
The user's posts - "peeps" - and the user details that are collected during registration are stored in SQL databases.

### Home ###

On the home page, the user can navigate to see previous posts, register a new account, or post a new peep. There is a button for login, however this feature has not been implemented yet.

![home_page](./images/home.png)

When creating a new account, the user provides their details which are stored in the SQL database. The password is encrypted with the `bcrypt` gem.

![new_account](./images/new_account.png)

On posting a new message, the text box holds space for 240 characters. Once the input is saved, it is stored in the database.

![peep](./images/peep.png)

Notes on known issues and missing features:
------

* Timestamp on peeps not implemented
* Poster's name isn't showing on peeps
* Functionality for logging in and logging out has not been implemented

I believe that if I had more time, I could have completed the above and I hope to come back to this challenge at some point.
