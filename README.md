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

* Decide on order user stories will be met

* Create branch for new feature, checkout to that branch

* Write a feature test, watch it fail

* Write the code to make it pass

* Refactor

* Make pull request to merge with master branch

* Review changes

* Accept / make change requests

* Merge branch with master

* Repeat this until the MVP is met

* Apply CSS styling, Sinatra layout and possibly partials(if applicable)

* Continue with whatever time remains to meet the HARDER and ADVANCED user stories from the brief


Potential improvements:
-----

FILL IN AT END OF PROJECT


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


Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!



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

2. On your local machine go inside of the *madcoders_makersbnb* directory :

```shell
$ cd madcoders_makersbnb
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
Make one called *makers_bnb_development* and one called *makers_bnb_test*.<br/>

```shell
$ psql
admin= CREATE DATABASE makers_bnb_development;
admin= CREATE DATABASE makers_bnb_test;
```

6. Exit from psql and from the command line run the `rake` command followed by the `db:auto_migrate` command. This will create your tables in your development DB.<br/>

```shell
$ rake db:auto_migrate
```

7. From the command line run the `rake` command followed by the `db:auto_migrate RACK_ENV=test` command. This will create your tables in your test DB.<br/>

```shell
$ rake db:auto_migrate RACK_ENV=testing
```

8. Connect to psql and connect to your database using the `\c databasename;` command.<br/>
Once you are connected to the database you've chosen, you can list the tables using the `\dt` command.<br/>

```shell
$ psql
admin= \c makers_bnb_development;
makers_bnb_development= \dt
```
9. You can connect to a specific table by using the `SELECT * FROM tablename;` command.<br/>

```shell
makers_bnb_development= SELECT * FROM tablename;
```

### Run the tests ###

1. Check that the codes are passing the test. From the root *madcoders_makersbnb* directory, run the *spec*.<br/>
You can check all the files in one go:

```shell
$ cd madcoders_makersbnb
$ rspec
```
To check only one file at a time :

```shell
$ cd madcoders_makersbnb
$ rspec spec/file_name_spec.rb
```

2. Check that the code respects the quality of the *Rubocop* guideline, by running `rubocop` from the *madcoders_makersbnb* directory :

```shell
$ cd madcoders_makersbnb
$ rubocop
```

## Run the app ##

1. On the command line, from the root directory *madcoders_makersbnb*, use the `rackup` command :

```shell
$ cd madcoders_makersbnb
$ rackup
```

You'll be able to see that the localhost port used is *9292*

1. Open your browser and type the url of your *localhost:9292*  <br/>

2. click on sign_in, enter your email address and password and click on `Sign in`.<br/>

3. Now click on list and create some properties.<br/>

4. Log out, and do the first three steps with a new user. You can repeat these steps as many as you want.<br/>

5. Log out, and sign in or sign up. Go on the book section and search for available properties for the dates that you would like to.<br/>
Click on the `request` button in front of the property you would like to book.

6. Enjoy playing around with our app as much as you want :) 


## Authors ##

@joaoag (João Abbott-Gribben)


## Acknowledgements ##

Code from sign_in_sign up web app from @dearshrewdwit (Edward Withers)

All the Makers who I paired with on the Messenger app, I relied a lot on the code we wrote for this challenge.

Code from the *MakersBnB* project that I worked on with @AlinaGoaga and @CelineKaslin - huge thanks to you both.
