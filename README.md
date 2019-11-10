Chitter Challenge
=================

* Partial solution submitted
* Pull request submitted by 9am Monday morning

User Stories implemented:
-------

```
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

```
Domain Model:
-----
[To be included]

Entity Relationship Diagram:
-----
[To be included]

Screenshot:
-----
[To be included]

How to use

To set up this project
----------------------
Clone this repository and then run:
`bundle`

To set up the database
----------------------
Connect to `psql` and create the `chitter_board` and `chitter_board_test databases`
```
CREATE DATABASE chitter_board;
CREATE DATABASE chitter_board_test;
```
To run the ChitterApp:
---------------------
`rackup -p 3000`
To view peeps, navigate to http://localhost:3000/peeps

To run tests:
------------
`rspec`

To run linting:
--------------
`rubocop`

Technical Approach:
-----

Integrated database into ChitterApp using the `PG` gem and `SQL` queries.

Notes on additional functionality partially implemented:
------

* [To be included] Don't have to be logged in to see the peeps.
* [To be included] Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* [To be included] The username and email are unique.
* [To be included] Peeps (posts to chitter) have the name of the maker and their user handle.
* [To be included] Worked on the CSS to make it look good.

Confirmed for Code Review
-------------------------
* All tests passing
* [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (100%)

Automated Tests:
-----
The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

- Configured Travis' build process by adding the necessary steps for creating database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

