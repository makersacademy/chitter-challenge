Chitter Challenge
=================

Week 4 Makers Weekend Challenge to write a small Twitter clone that will allow the users to post messages to a public stream.
This project integrates a database into Chitter using the `PG` gem and `SQL` queries. My tests are incomplete as I ran out of time so this is something I would like to come back to, particularly how to test a timestamp.

I would like to come back and refactor this to include peeps from different users and show the user's handles on each peep.

![Alt Text](https://media.giphy.com/media/d8dDe0OfRp7N5Bs05S/giphy.gif)


### To set up the database

Connect to `psql` and create the `chitter` database:

```
CREATE DATABASE chitter;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.


User Story 1:
-------

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

```

## Domain model

![domain_model](/images/dm_user_story_1.jpg)

User Story 2:
-------

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

```
## Domain model

![domain_model](/images/dm_user_story_2.jpg)

User Story 3:
-------

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made


User Story 4:
-------

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

```
HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

```

These were user stories I did not get a chance to complete as I ran out of time.
-----
```
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

This week you . You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

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

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)
