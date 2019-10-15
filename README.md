##How to use my program

### Setup

* Git clone this repo.
* Make sure you have postgrl installed and run the two commands below in the terminal:
  * CREATE DATABASE chitter
  * CREATE DATABASE chitter_test

* After this open the repo in your favourite editor and run `bundle install` to install all gem dependencies.
* CD into the repo and run the command rackup in the terminal.
* Navigate to http://localhost:9292 within your favourite browser. Enjoy!

## Challenges faced this week.

In order to push myself I wanted to get to grips and make use of the ORM DataMapper this week. ORM stands for Object Rational Mapping and is a program that helps convert data between incompatible type systems by using object orientated programming languages such as ruby. This basically sets up a virtual database object database that can be used from within the program.

The first thing I needed to do was create a file, data_mapper_setup.rb, that helped setup and run DataMapper. As we were using Postgres this week I decided to stick with this. When setting up DataMapper for the first time you have to specify your database connection. Within this project I required two databases, chitter_development and also chitter_test, to run all my tests in their own environment. Thanks to environmental variables I was able to inform DataMapper when to connect to the test database and when to connect to the production/development database. This file requires the two models in order to work and is also required by the app file. The last two lines in the file are `DataMapper.finalize` and `DataMapper.auto_upgrade!`. `DataMapper.finalize` This checks the models (users and peeps) for validity and initialises all properties associated with relationships. `DataMapper.auto_upgrade!` This tries to make the programme match the model. It will CREATE new tables, and add columns to existing tables. It won’t change any existing columns though (say, to add a NOT NULL constraint) and it doesn’t drop any columns.

After this I created my app and config file as normal. Within the app file I had to require the DataMapper setup script in order for both to interact and communicate correctly. The app file also had to require my other controllers. These controllers were all wrapped inside the same Class,  `class Chitter < Sinatra::Base`. The reason I choose to break up the controllers was for readability and meant each controller had a set amount of routes to look over. It was then a case of building all models that were required for this project.

This is done by including DataMapper::Resource in your model classes. This ensures the models are persistent. The next step was to build the  model tables. This is pretty easy, all you need to do is define the different properties(columns) your tables have and then also specify the type of data they will hold. You can also specify whether a particular piece of data is required or check its valid before it is saved to the database. This was useful as within my User model I set up the following validations in order for a user to be saved:
* A Username is required.
* A Username has to be unique.
* An Email address is required.
* An Email address has to be unique.
* An Email address has to be formatted correctly.

The last step is to define any associations. IE the class Peep belongs to the class User and a User can have many Peeps. This essentially sets up a one to many relationship, and creates a user_id column in your peeps table as a foreign key.

## User Stories I had to cover.
-------

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
