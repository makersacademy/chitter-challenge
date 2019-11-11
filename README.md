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

To install postgres
-------------------
` brew install postgresql`


To set up the database
----------------------
Connect to `psql` and create the `chitter_board` and `chitter_board_test databases`
```
CREATE DATABASE chitter_board;
CREATE DATABASE chitter_board_test;
```
To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

To run the ChitterApp:
---------------------
`ruby app.rb`

To view peeps, navigate to http://localhost:4567/peeps

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
* [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (80%)

Automated Tests:
-----
The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

- Configured Travis' build process by adding the necessary steps for creating database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Resources used:
--------------
* Found some cool twitter scaffolding at: https://codepen.io/Gi_18/pen/xwVJKg
