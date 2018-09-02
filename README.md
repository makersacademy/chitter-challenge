Chitter Challenge
=================

A small Twitter clone that allows users to post messages to a public stream.  

[![Build Status](https://travis-ci.org/rebeccasedgwick/chitter-challenge.svg?branch=working-branch)](https://travis-ci.org/rebeccasedgwick/chitter-challenge)  

Install
----
Setup is pretty straightforward, and a local database is also needed. 
To start, fork or clone this repo to your machine.  
Then, run: 

```
$ bundle install
```
Execute the following commands to create the local database and add the tables:

```
$ sqlite3 db/chitter.sqlite3 < db/setup/users.sql
$ sqlite3 db/chitter.sqlite3 < db/setup/messages.sql
```

That's all! 

_Note: the files `users.sql` and `messages.sql` contain commands to make the tables. These files are also used to create the tables for the test database. Further info how this works is in the Tests section._


User Stories:
----

```
As a User
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a User
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

Notes on functionality:
------

* You don't have to be logged in to see the Peeps (posts to Chitter)
* Users sign up to Chitter with their email, password, name and a username
* The username and email are unique
* Peeps (posts to Chitter) have the name of the User and their Username
* Currently there is no secure password storage (hashing etc) imlpemented. Please be careful.


Tests 
----
Testing makes use of Capybara, Rspec, Rubocop, SimpleCov and Travis CI. 

Running rubocop and rspec gives the following summary, including SimpleCov's test coverage figures: 

```
Inspecting 12 files
............

12 files inspected, no offenses detected
```
```
Finished in 0.50771 seconds (files took 1.02 seconds to load)
11 examples, 0 failures

COVERAGE: 100.00% -- 82/82 lines in 5 files

```
The test database is set up automatically when tests are run for the first time, using this command in app.rb:

```
if ENV['ENVIRONMENT'] == 'test'
  FileUtils.touch("db/chitter-test.sqlite3")
  set :database, { adapter: "sqlite3", database: "./db/chitter-test.sqlite3" }
else
  set :database, { adapter: "sqlite3", database: "./db/chitter.sqlite3" }
end
```
And the tables within the chitter-test.sqlite3 database are again automatically created by running the content of db/setup/*.sql, using this command in spec_helper.rb: 

```
config.before(:suite) do
  ActiveRecord::Base.logger = nil
  ["users", "messages"].each do |table|
  ActiveRecord::Base.connection.execute(File.read("db/setup/#{table}.sql"))
end
``` 
The testing databases will also be wiped clear before each test to avoid errors, as both Users and Messages tables are emptied: 

```
config.before(:each) do
  User.delete_all
  Message.delete_all
end
```


Approach & technologies:
----
This app is built with:

* Ruby 
* Sinatra
* Active Record 
* sqlite3

The tables in the database are as follows:

**Users**

|  id | username |   name   |     email    |  password   |
|-----|----------|----------|--------------|-------------|
|  1  | alice123 | Alice    | alice@me.com | password123 |
|  2  | bob123   | Bob      | bob@me.com   | password321 |

**Messages**

|  id |      body    |         created_at      |  user_id |
|-----|--------------|-------------------------|----------|
|  1  | message_info | 2018-09-02 15:52:50 UTC | alice123 |
|  2  | new_message  | 2018-09-02 15:20:05 UTC | bob123   |



Active Record was used primarily to try something new.  
The setup has been designed with the future implementation of tagging users and sending notifications (emails) in mind - email address is required (though not yet validated). 


Resources:
----

**Active Record** (note these are Rails guides):  
[Associations](https://guides.rubyonrails.org/association_basics.html)  
[Validation](https://guides.rubyonrails.org/active_record_validations.html)  
[Querying](https://guides.rubyonrails.org/active_record_querying.html)

And this video for making it all look so easy _(yes I know it's Rails again and this app is in Sinatra)_:  
[How to build a blog in Rails in 15 minutes (2005)](http://t.co/UlDrwbI4tk)   