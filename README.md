# ~~Twitter~~ Chitter Chatter

## About

This project allows users to publish text publically on a forum based application, based on the application Twitter.

This project allows:

- Users to post messages
- Users can see posts that other users have added
- Users can view the date and time when the post was made
- Users can log-in to the application
- Users can sign-out of the application
- Users can get an email if they're tagged in a post

## How To Run

##### General Setup

- You must have a version of `Ruby` installed on your computer (`brew install ruby`), I used `v 2.7.2`
- You will need to have an instance of `PostgreSQL`
- In your Terminal:
  - Run `git clone https://github.com/EMDevelop/chitter-challenge.git`
  - For Ruby specific dependencies, run `bundle install`
  - Run `rackup` in your terminal to spin up a local server (default port 9292)
  - Visit http://localhost:9292/ to test drive the application

---

## My Approach

##### Setup

- This project is a fork of `https://github.com/makersacademy/chitter-challenge`
- Understand the `User Stories`
- Create `Domain Models` from the User Stories
- Setup a basic layout for the app with `MVC` mapped out
- Install a testing framework for unit tests (RSpec) and Capybara for feature tests.
- Creating a new Database
  - Using `Postgres`, you can see all scripts used within `db/migrations`
- Create a new Test database
- ADD `.env` to `.gitignore`
- Setup DB classes
  - Create a spec file and test for connection
  - Create a class to make and hold connection
  - Create a helper file to auto connect in spec_helper and app.rb on load

---

##### User Stories

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

##### Domain Model

`className = Chitter`
|methods |attributes|
|-|-|
|Chitter.show_all_messages() | |
|Chitter.add_message() | |
|Chitter.sign_up() | |

`className = Message`
|methods |attributes|
|-|-|
| .new() | @message :String|
| | @id :String|
| | @create_date :String|
`className = Session`
|methods |attributes|
|-|-|
| Session.login() | @current_session Hash: @user_name|
| Session.logout() |

##### Database Model

###### Tables

`Table: Message`
|ID|ID_USERS|message|createdate|
|-|-|-|-|
|BIGSERIAL NOT NULL PRIMARY KEY|INT NOT NULL REFERENCES users(ID)|VARCHAR(200)|TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP|

`Table: Users`
|ID|user_name|password|
|-|-|-|
|BIGSERIAL NOT NULL PRIMARY KEY|VARCHAR(30)|VARCHAR(30)|

###### Relationships

| table   | relationship | table |
| ------- | ------------ | ----- |
| Message | 1 - 1        | Users |

## General Sinatra / Capybara Setup

```
mkdir app
cd app
touch app.rb
mkdir views
cd views
touch index.erb
..
..
mkdir db
cd db
mkdir migrations
cd migrations
touch 01_create_bookmarks.sql
..
..
mkdir lib

cd spec
mkdir feature
cd feature
touch feature_spec.rb
touch feature_helper.rb
..
..
touch .gitignore
touch .env
touch config.ru
```

## Questions

- Why do we have the view in the app folder with the model, is this a violation of a "separation of concerns"?

- Am I right to include the Database Connection class within the DB folder under a Queries directory? or should that be with the rest of the model in `lib`?
