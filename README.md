[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

Chitter Challenge
=================


Introduction :hatched_chick:
------------
Chitter is a little Twitter clone that provides a platform for users to post messages to a public stream.

![Imgur](http://i.imgur.com/JWgRBnG.png)

Features :star2:
-------
* User sign up, log in and log out;
* Once logged in, post a message (peep) on Chitter;
* All peeps displayed in chronological order, showing poster's name and username, and the time at which the post is created;
* Comment on other users' peeps.

How to user Chitter :page_with_curl:
------------------
To experience Chitter locally, clone this repo:
```
$ git clone git@github.com:junyuanxue/chitter-challenge.git
```
You will need to create a local database to save the data:
```
$ psql
yourusername=# CREATE DATABASE chitter_development;
```
Once your database has been created, type in `\q` to quit Postgres.

Then in the root directory of Chitter, type in Terminal:
```
$ rackup
```
Visit `localhost:9292` in your browser to use the app. You should see the index page as displayed above.

To post a peep, please sign up:

![Imgur](http://i.imgur.com/tjBqydz.png)

You should then be able to create a peep:

![Imgur](http://i.imgur.com/LVwdzPo.png)

Or make a comment:

![Imgur](http://i.imgur.com/CAvJdNn.png)

Or, you can click [here](https://bonjour-chitter.herokuapp.com) to use Chitter online. Enjoy! :sunglasses:

Testing :white_check_mark:
-------
To run the tests, you will first of all need to create a `chitter_test` database in Postgres. Then under the root directory of the project, run:
```
$ bundle install
$ rspec
```

Tools used :wrench:
-----------
* Ruby
* RSpec
* Sinatra
* Capybara
* DataMapper
* PostgreSQL
* BCrypt

Author :cat:
----------------------
Junyuan Xue

[github](https://github.com/junyuanxue)  [blog](https://spinningcodes.wordpress.com/)
