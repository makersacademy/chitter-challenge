Chitter Challenge
=================
[![Build Status](https://travis-ci.org/charlottebrf/chitter-challenge.svg?branch=master)](https://travis-ci.org/charlottebrf/chitter-challenge)


Challenge:
-------

Write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
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

Technologies
-----

## Install

* Bundle install Gemfile dependencies. These include the ORM [DataMapper](http://datamapper.org/getting-started.html),[Sinatra Flash](http://www.rubydoc.info/github/SFEley/sinatra-flash/Sinatra/Flash/Storage), [Bcrypt](https://github.com/codahale/bcrypt-ruby).

```bash
 $ bundle
 $ gem install bundle

```

* Ruby v '2.4.0'

```bash
$ rvm install 2.4.0
$ rvm use 2.4.0
```

* Sinatra v '1.4.8'

```bash
$ gem install 1.4.8

```

## Run

* Using Rackup on local host
```bash
$ rackup

```


* Uses PSQL database. You will need to have this [installed](https://www.postgresql.org/download/) to connect to the chitter_test & chitter_development databases.
```bash
$ psql

```

## Test Suite
* Capybara, Rspec & Database Cleaner
```bash
$ gem install capybara
$ rspec --init
$ gem install database_cleaner

```
* Add Database Cleaner to Rspec config method in the spec_helper
```bash
$ gem install capybara
$ rspec --init
$ gem install [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)

```


Test coverage
-----
```
* Test coverage: 100%
* Capybara feature tests
* Rspec
* Database Cleaner
```

Images from Chitter
----
![Imgur](http://i.imgur.com/wGdCZNT.png)
![Imgur](http://i.imgur.com/bPlI0Bs.png)
![Imgur](http://i.imgur.com/NBGEytc.png)
![Imgur](http://i.imgur.com/bFEy1c0.png)

My Approach
----
- **Progress** - I completed 6 User Stories: Straight Up & Harder, but ran out of time to move on to Advanced.
- **OOD & TDD**- To ensure I took a well designed approach I created Domain Models of the User stories:
![Imgur](http://i.imgur.com/ceyoqID.png)

Along with CRC cards to ensure I had the right responsibilities and collaborators for the domain:
![Imgur](http://i.imgur.com/XfqNbGb.png)

From these cards I was able to sketch out the Database structure:
![Imgur](http://i.imgur.com/2yOUL0N.png)

I also used Mindmaps to design the login & logout functions, to ensure clarity regarding how the different aspects of the program connected together:
![Imgur](http://i.imgur.com/C2tVLYY.png)

- **Peep & User class** - I have two key classes: Peep & User. Peep has all properties related to peeps (or messages) posted on Chitter. User has all properties connected to the user.
- **DataMapper Setup** - Was used so that the app could access all models through this file.
- **Views** - Were divided between the Peeps & Users erb files.
- **Environments** - Test & Development environments were set up.
- **Web helper** - The features web_helper file was used to ensure the Feature specs didn't become cluttered.
- **Features** - This program has 100% test coverage. CSS elements were integrated in the web_helper to be able to test specific aspects of the Views files.
- **Extra password & email verification** - Included additional data validation steps so that a valid password & email were entered upon user signup.


Future Improvements
----
- **Improve 1 viewing_peeps spec** - I had noted a TODO on the: 'users can see peeps in reverse chronological order on Chitter' feature test. Once I had changed the app so the user has to login & logout to send a peep, I also refactored my tests. This test needs to be refactored further to ensure it is 100% correct.
- **Improve Sessions 'Secret session'** - I did some research into using a SECRET_SESSION ENV instead of the string currently used in the app, see the TODO comments in the app. I would like to improve the security of the password storage.
- **Advanced stories** - In the future I would like to complete the final Advanced user story.
- **Improve CSS** - Given more time I would like to make Chitter a little more visually appealing.
- **Deploy to Heroku** - As a longer term goal I would like to deploy this to Heroku, so it can be run publicly.
