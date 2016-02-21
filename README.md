Chitter Challenge
==================
[![Build Status](https://travis-ci.org/barrygrubb/chitter-challenge.svg?branch=master)](https://travis-ci.org/barrygrubb/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/github/barrygrubb/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/barrygrubb/chitter-challenge?branch=master)
Introduction
-------
The purpose of this challenge was to build a basic twitter clone. This was a solo project created for the Makers Academy week 4 weekend challenge. The app has been built using Ruby and the Sinatra framework, plus a HTML and CSS front-end. The PostreSQL database management system has been utilized to provide data persistence. bcrypt has been used to provide password security by encrypting user passwords before they are stored in the database, and validating login passwords against the encrypted data.

Features modeled include the following:

* Ability to sign up to Chitter with an email address, name, username, password and password confirmation.
* Ability to view the latest peeps in descending chronological order even when not logged in.
* Once logged in, the ability to create a new peep is provided.
* Upon adding a new peep it is saved to the database, and its text is displayed on the latest peeps page, along with the name and username of the user who added the peep, plus the date and time that the peep was added.
* The user is greeted with their name upon logging in. A similar 'Goodbye!' message is shown upon logout.
* Various front-end and back-end validations exist to ensure that all user data is filled in upon signing up, and that the password and confirmation passwords match. In the event that any data is withheld upon signup a message will appear explaining which data was missing.

instructions
-------
Note that the below instructions describe the process of installing and running a local copy of the project, which will require a working PostgreSQL installation, and requisite databases to be created. In order to simply test the project from a user perspective consider visiting the [online version](https://chitter-challenge-bkg.herokuapp.com/peeps).

* Open the terminal and clone the repository locally using `git clone https://github.com/barrygrubb/chitter-challenge.git`.
* `cd` in to the project directory and use the `bundle` command to install all required dependencies.
* Run `psql` to gain access to the PostgreSQL databases and commands. Use `create database chitter_challenge_test;`, and `create database chitter_challenge_development;` to create both of the required databases.
* Use `\l` to list all databases, and ensure that the two databases created in the previous step are listed. You may then have to use `q` to regain control of the terminal. Use `\q` to quit psql.
* Run `ruby app/app.rb` to start the local server, and browse to the location mentioned in the terminal logs (likely localhost:4567). Be sure to append '/peeps' to the end of the path. The main peeps page was added at '/peeps', because presumably for a final production application the root page would be reserved for a signup page or similar.
* You should be greeted by the page below:
