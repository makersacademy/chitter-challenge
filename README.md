Chitter challenge
========
A clone of Twitter built using Ruby with Sinatra and PostgresSQL to create and manage the databases.

Tools
----
- `Bulma` was used for some basic CSS implementation.
- `PSQL` was used to create the databases and the `PG` gem to interact with the databases with ruby.
- `Bcrypt` was used for encryption of user passwords.

Setup
----
```
1 - psql
2 - CREATE DATABASE chitter;
3 - Follow instructions in db/migrations
4 - CREATE DATABASE chitter_test and repeat step 3
```

Usage
----
```
git clone 'https://github.com/AlfonsoGhislieri/chitter-challenge.git'
cd chitter-challenge
bundle install
rackup
```

Tests
----
```
rspec
```

Features
----
I was able to implement the following features for this challenge:
- User can sign up (with an email, password, name and username)
- User can sign in if correct email and password provided
- User can sign out
- Signed in users can post messages
- Messages show in reverse chronological order for all users (even if not logged in)
  - Messages include: a  message, user info and a timestamp


TODO:
- [ ] Prevent users from submitting empty fields
- [ ] Prevent users from submiting empty message
- [ ] Allowing users to reply to messages
- [ ] Stub Databases in unit tests
- [ ] Improve CSS beautification

![Chitter example page](https://i.ibb.co/LndZ5bx/Screenshot-2021-12-13-at-12-06-20.png)

Model
-----
I decided to break down the webapp into 3 classes.
- `DatabaseConnection` takes care of connecting to the correct database (test or normal) and performing SQL queries.
- `User` class :
  - Add a user to the `users` database.
  - Find a user in the database using an id.
  - Authenticate user information making sure correct email and password are provided.
  - Check if another user already has the same email or username
- `Peep` class:
  - Adds messages to the `peeps` database.
  - Stores all messages in reverse chronological order inside an array.

View
-----
The view is where I put the least amount of time into, beautifying the website with more than just some basic `Bulma` classes would definitely go a long way. However I chose to focus on the functionality.

- `index.erb` presents a list of messages with user information and a timestamp.
  - Buttons also allow a user to sign in, sign out and sign up.
- `users/new.erb` displays a form for a new user to fill in.
- `sessions.new.erb` displays a form forte user to log in.

Controller
-----
For the controller I decided that I would implement multiple controllers in order to not make the `app.rb` become overloaded.


- `ChitterApp` is the shell from where all the other controllers take over.
- `PeepsController` takes care of all routes related to displaying and posting messages.
- `UsersController` manages routes related to a user signing up.
- `SessionsController` manages all routes related to signing in and out.
