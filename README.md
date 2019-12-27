# Chitter Challenge

Description
-------

This is the weekend challenge at the end of my fourth week at Makers Academy, a 16-week software developer bootcamp. For the main instructions, please refer [here](https://github.com/AndreaDiotallevi/chitter-challenge/blob/master/INSTRUCTIONS.md).

Prerequisites
-------

* Clone this repository into your machine with ```git clone```
* Change into the new repository
* Install PostgreSQL with ```brew install postgresql```
* Start ```psql``` with ```psql postgres```
* Create the chitter database with ```CREATE DATABASE chitter;```
* Connect to the chitter databse with ```\c chitter;```
* Create the peeps table with ```CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(280));```
* Edit the peeps table with ```ALTER TABLE peeps ADD COLUMN time TIMESTAMP;```
* Create the makers table with ```CREATE TABLE makers (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(240), name VARCHAR(20), username VARCHAR(20));```
* Edit the makers table with ```ALTER TABLE peeps ADD COLUMN maker_id INTEGER REFERENCES makers (id);```
* Do the same steps for the ```chitter_test``` database

How to run tests
-------

* Run ```bundle``` to install all the dependencies
* Run ```rspec``` in the terminal to run the tests