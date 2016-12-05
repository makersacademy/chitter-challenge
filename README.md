# Chitter [![Build Status](https://travis-ci.org/TudorTacal/chitter-challenge.svg?branch=master)](https://travis-ci.org/TudorTacal/chitter-challenge)

This project represents our fourth weekend challenge at Makers Academy coding bootcamp.  

Chitter is a **web app** used for cummunication. A user can sign up, log in, log out, send a peep(message) and see a list of all peeps. The peep comes with the date of creation, name and username of the maker.

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

1. To run the program first run **bundle install**.
2. Run **ruby ./app/app.rb**.
3. In your browser, open the link **localhost:4567**.
4. Sign up with the required credentials.
5. Once signed up or logged in you can create a new peep or see list of existing peeps.

### Screenshots

![First Page](https://s11.postimg.org/fk7a9qedv/Screen_Shot_2016_12_05_at_00_28_29.png)

* [After sign up](https://s14.postimg.org/t4pvv2k9t/Screen_Shot_2016_12_05_at_00_31_16.png)
* [New Peep](https://s16.postimg.org/r0vcahx6t/Screen_Shot_2016_12_05_at_00_32_06.png)
* [All peeps](https://s12.postimg.org/vhzesoh31/Screen_Shot_2016_12_05_at_00_32_43.png)

### To implement

* Password confirmation.
* Front end design.
* Allow users to send peeps to each other.


This repository was forked from https://github.com/makersacademy/rps-challenge

### Contacts
tudor.tacal@gmail.com
