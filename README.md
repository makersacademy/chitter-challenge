# Chitter [![Build Status](https://travis-ci.org/TudorTacal/chitter-challenge.svg?branch=master)](https://travis-ci.org/TudorTacal/chitter-challenge)

This project represents our fourth weekend challenge at Makers Academy coding bootcamp.  

Chitter is a **web app** used for cummunication. A user can sign up, log in, log out, send a peep(message) and see a list of all peeps. The peep comes with the date of creation, name and username of the maker.

###Heroku link

* The site is live on https://chitterwebapptt.herokuapp.com/

### Screenshots

![First Page](https://s30.postimg.org/80c2z2fqp/First_page.png)

* [Sign Up](https://s29.postimg.org/m6v04j3cn/Sign_up_form.png)
* [After sign up](https://s29.postimg.org/c3pw8rro7/After_signup.png)
* [Make new peep](https://s23.postimg.org/tmskdai23/New_peep.png)
* [New peep](https://s29.postimg.org/af1xrp9cn/New_made_peep.png)
* [All peeps](https://s24.postimg.org/3ot1dtdlh/All_peeps.png)


### Technologies used

* **Sinatra** for running a local server.
* **Heroku** for cloud deployment.
* **BCrypt** for password hashing.
* **PostgresSQL** as database.
* **DataMapper** as object-relational mapping for database interaction.
* **Capybara** and **Rspec** for testing.
* **DatabaseCleaner** for database upgrading and migration.
* **Rake** for automating tasks.

### Installation and Use

1. First clone or download the repository.
2. Run **bundle install**.
3. Create a Postgres database with the name **chitter_test** & **chitter_development**.
4. Run **rackup**.
5. In your browser, open the link **localhost:9292**.
6. Sign up with the required credentials.
7. Once signed up or logged in you can create a new peep or see list of existing peeps.

### User stories

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```


### To implement

* Password confirmation.
* Allow users to send peeps to each other.


This repository was forked from https://github.com/makersacademy/rps-challenge

### Contacts
tudor.tacal@gmail.com
