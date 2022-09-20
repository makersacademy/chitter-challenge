# Chitter Challenge makers exercise

## Process:
## Extract informations from user stories, create schema, write sql

```
peeps: id, peep_time, user_id, reply_of_id
users: id, email, password, name, username (username, email unique)
mentions: user_id, peep_id

#see all messages (reverse chrono) (not logged in) (show name, username)
#signup to
#login, #logout
have notification if tagged in a message (instead of email)
css
```
```sql
-- oncstructon of database and tables
DROP DATABASE IF EXISTS chitter_test;
CREATE DATABASE chitter_test;
DROP TABLE IF EXISTS peeps, users, peeps_users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  peep_time timestamp,
  user_id int,
  reply_to_peep_id int,
  constraint fk_user_2423475 foreign key (user_id)
    references users(id)
    on delete cascade
);

CREATE TABLE peeps_users (
  id SERIAL PRIMARY KEY,
  peep_id int,
  user_id int,
  constraint fk_peep_6723454 foreign key (peep_id)
    references peeps(id) on delete cascade,
  constraint fk_user_3427255 foreign key (user_id)
    references peeps(id) on delete cascade
);


-- seeding tables with test values
TRUNCATE TABLE users, peeps, peeps_users RESTART IDENTITY;

INSERT INTO users (email, password, name, username)
  VALUES ('johnj@gmail.com', 'temppass1', 'John Jr', 'johnj');
INSERT INTO users (email, password, name, username)
  VALUES ('jenny@gmail.com', 'temppass2', 'Jenny Zu', 'jennyzz');
INSERT INTO users (email, password, name, username)
  VALUES ('jj@gmail.com', 'temppass3', 'Jey Jey', 'jjj');

-- reply_to_peep_id of 0 means there is not a reply but a top-level peep
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('Databases are done, yay!', '2022-10-17 10:10:25', 1, 0);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES (
    'But we did not do a graph database, nay.',
    '2022-10-17 10:11:25', 2, 1);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES (
    'But we can do all kinds of stuff without those, yay!',
    '2022-10-17 10:12:25', 1, 2);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES (
    'But trees is what we need for cloning itter, nay',
    '2022-10-17 10:13:25', 2, 3);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('2+2=5', '2022-10-17 10:14:25', 3, 0);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('@jj, deep!', '2022-10-17 10:15:25', 2, 5);
INSERT INTO peeps (content, peep_time, user_id, reply_to_peep_id)
  VALUES ('@jj, indeep!', '2022-10-17 10:16:25', 1, 5);

INSERT INTO peeps_users (peep_id, user_id) VALUES (6, 3);
INSERT INTO peeps_users (peep_id, user_id) VALUES (7, 3);
```

## Install required gems with bundler
## Create model and repository classes (in respective files)
## Implement functionality (partially)



Default view
![Default view](https://i.imgur.com/vJACzMc.png)

![Logged in](https://i.imgur.com/YlHTAqt.png)

![Sign up view](https://i.imgur.com/l9jRlYN.png)

A lot more left to do:

* Sessions
* Secure passwords
* Input validation
* Posting new peeps/replies
* Rake files
* Mentions

Current state has sign up working, as well as peeps view in logged in and logged
out state, even though sessions aren't implemented yet. I spent a lot of time on
trying to figure out database representation of systems where every post can be
a reply to somebody else or top level and how to show and store that. In the end
I didn't try for a graph and kept it simple. Also, too much time on css instead
of implementing more things.

<br /><br />
Original readme:

Chitter Challenge
=================

* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 10am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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

In the last two weeks, you integrated a database using the `pg` gem and Repository classes. You also implemented small web applications using Sinatra, RSpec, HTML and ERB views to make dynamic webpages. You can continue to use this approach when building Chitter Challenge.

You can refer to the [guidance on Modelling and Planning a web application](https://github.com/makersacademy/web-applications/blob/main/pills/modelling_and_planning_web_application.md), to help you in planning the different web pages you will need to implement this challenge. If you'd like to deploy your app to Heroku so other people can use it, [you can follow this guidance](https://github.com/makersacademy/web-applications/blob/main/html_challenges/07_deploying.md).

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface, instead of implementing your own Repository classes.

Some useful resources:
**Ruby Object Mapper**
- [ROM](https://rom-rb.org/)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra & ActiveRecord setup](https://learn.co/lessons/sinatra-activerecord-setup)

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

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/main/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want at this moment.

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
