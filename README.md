Chitter Challenge
=================

As a Makers Academy weekend challenge I am going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features from the Makers Brief:
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

Features functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.


Minimum Viable Product (MVP:
-----
I've decided my MVP will be meeting the HARDER and STRAIGHT UP user stories.


Approach:
-----

* Create UML sequence and class responsibility collaborator (CRC) diagrams based on the user stories

* Decide on order user stories will be met ( I wanted to meet the HARDER section first as I wanted users to have to sign in or be signed up to post a peep)

* Create branch for new feature, checkout to that branch

* Write a feature test, watch it fail

* Write the code to make it pass

* Refactor

* Make pull request to merge with master branch

* Review changes

* Accept / make change requests

* Merge branch with master

* Repeat this until the MVP is met

* Continue with whatever time remains to meet a BONUS requirement (CSS)

* Apply CSS styling, Sinatra layout and possibly partials(if applicable) to make the app look good




Outcome:
-----

* MVP was achieved (all STRAIGHT UP and HARDER user stories met)

* One BONUS option achieved (applying CSS) 

* Everything created using strict TDD (all tests passing, 100% test coverage)

* Practised Git workflow, working on specific branches for each feature before merging back into master (committing with each significant piece of work finished) 

* Used methodological approach to debugging / database set up



Improvements:
-----

* CSS moved from layout.erb to more appropriate place

* Add tagging functionality to peeps

* Add ability to reply to peeps

* Add authentication for uniqueness of username (currently only have this in place for email address). This should be relatively simple to implement from what is there already

* User can upload an image



Technologies used
-------

* Capybara
* Datamapper
* Psql
* Rack
* RSpec
* Ruby
* Rubocop
* Selenium
* Sinatra



## How to use Chitter##

System requirements
-------

* Ruby 2.5.0
* Mac OS X
* Chrome browser



### Set up ###

1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want to clone the project<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone https://github.com/your-username/your-repositary.git
```

2. On your local machine go inside of the *chitter-challenge* directory :

```shell
$ cd chitter-challenge
```
3. To install all the *gems* contained in the *Gemfile*, install and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```
4. You can see the different directories, with the `ls` command.

### Database ###

5. If you do not have it already, install *psql* on your local machine. Connect to your database and create two of them to be able to run the test and the app, using the `CREATE DATABASE databasename;` command.<br/>
Make one called *chitter_development* and one called *chitter_testing*.<br/>

```shell
$ psql
admin= CREATE DATABASE chitter_development;
admin= CREATE DATABASE chitter_testing;
```

6. Exit from psql and from the command line run the `rake` command followed by the `db:auto_migrate` command. This will create your tables in your development DB.<br/>

```shell
$ rake db:auto_migrate
```

7. From the command line run the `rake` command followed by the `db:auto_migrate RACK_ENV=testing` command. This will create your tables in your test DB.<br/>

```shell
$ rake db:auto_migrate RACK_ENV=testing
```

8. Connect to psql and connect to your database using the `\c databasename;` command.<br/>
Once you are connected to the database you've chosen, you can list the tables using the `\dt` command.<br/>

```shell
$ psql
admin= \c chitter_development;
chitter_development= \dt
```
9. You can connect to a specific table by using the `SELECT * FROM tablename;` command.<br/>

```shell
chitter_development= SELECT * FROM tablename;
```

### Run the tests ###

1. Check that the codes are passing the test. From the root *chitter-challenge* directory, run the *spec*.<br/>
You can check all the files in one go:

```shell
$ cd chitter-challenge
$ rspec
```
To check only one file at a time :

```shell
$ cd chitter-challenge
$ rspec spec/file_name_spec.rb
```

2. Check that the code respects the quality of the *Rubocop* guideline, by running `rubocop` from the *madcoders_makersbnb* directory :

```shell
$ cd chitter-challenge
$ rubocop
```

## Run the app ##

1. On the command line, from the root directory *chitter-challenge*, use the `rackup` command :

```shell
$ cd cd chitter-challenge
$ rackup
```

You'll be able to see that the localhost port used is *9292*

1. Open your browser and type the url of your *localhost:9292*  <br/>

![blank-welcome-page] (https://user-images.githubusercontent.com/screenshots/blank-index-page.png)

2. click on sign up, enter your email address and password and click on `Sign up`.<br/>

3. Now fill in the 'Peep' field with your text and click the 'Post my peep!' button.<br/>

4. Log out, and do the first three steps with a new user. You can repeat these steps as many as you want.<br/>

5. Then, you can sign in to whichever account you want and post peeps attributed to these users

5. Enjoy playing around with this app as much as you want :) 


## Authors ##

@joaoag (João Abbott-Gribben)


## Acknowledgements ##

Code from sign_in_sign up web app from @dearshrewdwit (Edward Withers)

All the Makers who I paired with on the Messenger app, I relied a lot on the code we wrote for this challenge.

Code from the *MakersBnB* project that I worked on with @AlinaGoaga and @CelineKaslin - huge thanks to you both.
