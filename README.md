Chitter Challenge
===

An implementation of a Twitter-style message board web application where the user can sign in to post messages to the board.

The application allows the user to
 - View the peeps message board
 - Create an account
 - Sign in and post a message (peep) to the board
 - Sign out of their account 

---

### **WARNING: This application is not safe and should not be used with any real / sensitive information!** 
---

This project satisfies the following user story:

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

**Note:** This project only covers the STRAIGHT UP and HARDER portions of the user story.

---

Running the project
===

To run this project, clone the repository and run
```bash
bundle install
```
to install the required gems.
Then create and optionally seed the database for this project:
```bash
# Create the database
createdb chitter_db
psql -h 127.0.0.1 chitter_db < spec/seeds/chitter_tables.sql

# Seed the database (optional)
psql -h 127.0.0.1 chitter_db < spec/seeds/seeds_accounts.sql
```
Finally, you can host the server on your machine buy running
```bash
rackup
```
The website will then be available from your web browser by visiting
http://localhost:9292/

---

Technical details
===

This project uses a PSQL database(`chitter_db`) in the server with two tables `accounts` and `peeps` which have a one to many relationship.

To interface with the database, we have test-driven and implemented Model classes (`Account` and `Peep`) and Repository classes (`AccountRepository` and `PeepRepository` respectively).
These allow the application to query the tables for records and create new ones.

The `Sinatra` gem allows the server application to handle incoming HTTP requests.
Indeed, `Sinatra` is responsible for routing requests to the right instructions in our code.
Often, our application returns HTML views, generated using `erb` to embed values from our database for instance.
Note that all routes have also been test driven.

`Sinatra` is also responsible forkeeping track of user sessions in order to remember the user's login status and information.
This allows for example to restrict access to certain parts of the application if the user is not logged in, instead redirecting them to the login or signup pages.

Finally, the user's password is encrypted using the `BCrypt` gem to avoid storing raw passwords in the database.

---

Things to add
===

- Refactor the `Application` class which is too cluttered
- Clean up error throwing and handling - eg: trying to add an empty record to the database or trying to find a non-existant record.
In particular, better thought needs to go into how such information is presented to the user.
- Implement input checks in order to avoid injection attacks
(**Again, please do not use this application with real data!**).
- Fulfil the advanced section of the user story.
- Add `css` styles to improve the look of the application and give a better user experience.
- Allow users to edit their peeps
- Add an administrator account which can edit/delete peeps and accounts

---

Skills used in this project
===
- Designing a database schema and test driving CRUD classes to interact with the database.
- Writing integration tests for a web application
- Implementing web routes
- Following a debugging process for a web application

---
\
This project was made as part of the [MakersAcademy](https://makers.tech/) course.