Chitter Challenge
=================

This is a program that runs a small Twitter clone called Chitter. Users can visit Chitter and can view the page which lists all the peeps in reverse chronological order. Users can also post peeps to Chitter after signing up and logging in with a secure password. Each peep also displays the user who posted it and the time and date it was created. ActiveRecord was used to create the databases, datatables and classes that are needed for this program to function. This program follows MVC convention with the [models](https://github.com/jmcnally17/chitter-challenge/tree/main/models) folder containing the Model, the [views](https://github.com/jmcnally17/chitter-challenge/tree/main/views) containing the View and the [app](https://github.com/jmcnally17/chitter-challenge/blob/main/app.rb) file being the Controller.

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)

ActiveRecord is an ORM (Object Relational Mapper) which helps to convert data back and forth between SQL and Ruby. Initially a [database.yml](https://github.com/jmcnally17/chitter-challenge/blob/main/config/database.yml) file is needed in the [config](https://github.com/jmcnally17/chitter-challenge/tree/main/config) folder to provide ActiveRecord with the necessary database connections for each environment. 

A [Rakefile](https://github.com/jmcnally17/chitter-challenge/blob/main/Rakefile) is needed in the [main](https://github.com/jmcnally17/chitter-challenge) directory in order for the user to input rake commands.

The files in the [migrate](https://github.com/jmcnally17/chitter-challenge/tree/main/db/migrate) folder contain the necessary information on the structure of the tables that ActiveRecord will create. These files can be created in the terminal by running
```
rake db:create_migration NAME=<migration_name>
```
before the developer inputs all the necessary column information.

After running these migrations, the class files in the models folder are then modified so that the classes fit what the developer intends. These classes can contain any helper methods that are necessary, validations (checks on specific class attributes that have to be fulfilled before they can be saved to the database) and links to other tables in the database (foreign keys).

Getting Started
-------

To begin, clone this repository and install the necessary gems:
```
git clone https://github.com/jmcnally17/chitter-challenge.git
bundle
```
Run `gem install bundler` if you haven't already got bundler installed. So that ActiveRecord can setup the databases, while in the main directory, run:
```
rake db:prepare
rake db:migrate
rake db:migrate RACK_ENV=test
```
`db:prepare` will create the 'chitter' and 'chitter_test' databases but will not create the datatables because the default environment has not been specificied. `db:migrate` will setup the tables in the production environment (i.e. for the 'chitter' database), while `db:migrate RACK_ENV=test` will setup the tables in the test environment (i.e. for the 'chitter_test' database).

How To Use
------

The server can then be started by either runnning `ruby app.rb` or `rackup` in the terminal while in the main directory. Then, in the web browser, visit the URL `localhost:4567` or `localhost:9292`, depending on how the server was started.

From the Chitter homepage, you can either go to peeps page, log in or sign up for an account. Only after signing up and logging in can you start posting peeps on the peeps page. Once you have posted all the peeps you want, a log out button is present on the peeps page so that you can end your session.

Tests
------

The tests that have been created in the [spec](https://github.com/jmcnally17/chitter-challenge/tree/main/spec) folder can be ran by simply running `rspec` in the terminal.

User Stories:
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

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)
