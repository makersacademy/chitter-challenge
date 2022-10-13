Chitter Challenge
=================

## Approach by Claire Nelson

#### Break down the requirements using tables and Excalidraw following techniques learnt in Intro to TDD workshop and Domain Modelling workshop

- Capture the nouns in the user stories as objects and verbs in user stories as messages. Use the techniques learnt in the first week of Makers to create [object model tables](https://github.com/nelsonclaire/chitter-challenge/blob/master/task_stories/user_stories.md) which should assist with how to create the tests, classes and methods.

## Screenshot of index page
![Screenshot](/public/images/chitterscreenshot.png)

## Entity Relationship Diagram

- A User *has many* Peeps
- A Peep *belongs to* a User

![Entity Relationship Model](/public/PeepsEntityRelationshipModel.png)

## Description

```
 Table "public.users"
  Column  |          Type          | Collation | Nullable |              Default              
----------+------------------------+-----------+----------+-----------------------------------
 id       | integer                |           | not null | nextval('users_id_seq'::regclass)
 name     | character varying(60)  |           |          | 
 username | character varying(30)  |           |          | 
 email    | character varying(60)  |           |          | 
 password | character varying(140) |           |          | 
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)
    "users_email_key" UNIQUE CONSTRAINT, btree (email)
    "users_username_key" UNIQUE CONSTRAINT, btree (username)
Referenced by:
    TABLE "peeps" CONSTRAINT "peeps_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id)

 Table "public.peeps"
   Column   |            Type             | Collation | Nullable |              Default              
------------+-----------------------------+-----------+----------+-----------------------------------
 id         | integer                     |           | not null | nextval('peeps_id_seq'::regclass)
 peep       | character varying(128)      |           |          | 
 created_at | timestamp without time zone |           |          | CURRENT_TIMESTAMP
 user_id    | integer                     |           |          | 
Indexes:
    "peeps_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "peeps_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id)
```

## Technologies used

- Ruby
- Rspec (test framework)
- Sinatra (Ruby web framework)
- Capybara (web feature test library)
- PostgreSQL (database manager)


## Steps to download

1. Fork this [repo](https://github.com/nelsonclaire/chitter-challenge)

2. `git clone git@github.com:<userName>/chitter-challenge.git` onto your local machine

## Steps to setup required gems 

1. Follow the instructions on this [page](https://github.com/nelsonclaire/chitter-challenge/blob/master/task_stories/pre_setup.md)

## Steps to run (two options)

1. Run `ruby app.rb` in root project directory

2. Visit `http://localhost:4567/`

3. Run `rackup` in root project directory

4. Visit `http://localhost:9292/`


## To run tests

Run `rspec` directly in root of your local project


## My approach

1. Break down user stories into an [object model](https://github.com/nelsonclaire/chitter-challenge/blob/master/task_stories/user_stories.md) and simple feature steps

2. Add capybara config requirements into `spec_helper.rb`
    - `require File.join(File.dirname(__FILE__), '..', 'app.rb')`

3. Write first feature test - testing infrastructure on `home (/)` route

4. Create config.ru file which contains 
    - require_relative "./app"
    - run chitter

5. Make it pass by creating `app.rb` controller file with "/" route

6. Extend by creating `index.erb` view file

7. Check in client by running `ruby app.rb` and visiting `localhost:4567`

8. Continue with second feature test - testing enter name form

9. Follow red, green, refactor cycle for each feature test

10. Repeat until basic user story functionality is covered



#### Structure

- Controller: `app.rb`
- Views: `views/<name>.erb`
- Models: `lib/<name>.rb`
- Specs: `spec/<name>.rb`
- Features: `spec/features/<name>.rb`
- Databases: `db/migrations/<name>.sql`

#### What I know I need to work on
- Having a gap between peeps
- Replying to Peeps
- Email sent if you are mentioned in a peep
- Rakefile (started investigating this)


-------

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
