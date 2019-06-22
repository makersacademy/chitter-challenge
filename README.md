
AJ Makers Weekend Challenge

I've decided to attempt this challenge using DataMapper.
It's hard to give definate references from where I have gleaned information but a lot of googling and reading - in particular about environment setup a Makers student appeared in a google search with a similar error (https://github.com/makersacademy/slack-overflow/issues/26) - from here I looked at their setup for their bookmark manager and went from there.


setup
As usual please start by forking this repo.
create databases - chitter_test & chitter_development
CREATE DATABASE chitter_test;
CREATE DATABASE chitter_development;


tech
data mapper
data cleaner - used in conjuction with data mapper to clear down database before each test. The data_mapper auto_upgrade method creates new tables from the schema in the model each time (if they don't exist)

Process
Due to using a new framework (data mapper ORM) I thought best to think through my models and relationships carefully so that I could set these up from the very begining with the the fields I would need and their associations.
Due to the amount of new information I challenged myself only with the 'STRAIGHT UP' features.
Two models - Peep and User. There is a 1 to many relationship between user and peep. 
Associations can be setup in the following manner (http://datamapper.org/docs/associations.html)
Before embarking on Chitter I have been experimenting with a test project. Within here is where I have trialled and errored using Data Mapper e.g. the first commit of setting up the project and its environments was done after working through iterations on a different project.
While experimenting on Associations and its syntax I have realised that it might be best to approach the problem with the creating a User story first. This is because of the setup and problem that a Peep must be associated with a User. I would like the peep to be associated with the latest user (not expressly mentioned but one I am adding to the flow)



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

Technical Approach:
-----

**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)


Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!


Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)
