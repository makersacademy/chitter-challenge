Chitter Challenge
=================

Description
-------
* Chitter is a small Twitter clone that allows users to post messages to a public stream. It was built using [Sinatra](http://sinatrarb.com/) and [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)


User Stories
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

Installation
-------
- $ `git clone repo`
- $ `bundle install`

Database Config
-------
- $`rake db:create` (created dbs that exist in database.yml file)
- $`rake db:create_migration NAME=create_users`
```
Insert this method into the *create_user.rb* migrate file that will be created within your db folder

 def change
    create_table(:users) do |u|
      u.column(:firstname, :string)
      u.column(:surname, :string)
      u.column(:email, :string)
      u.column(:password, :string)
      u.column(:username, :string)
    end
```

- $`rake db:create_migration NAME=create_peeps`
```
This command will allow this method into the *create_peeps.rb* migrate file that will be created within db folder
 def change
    create_table(:users) do |u|
      u.column(:firstname, :string)
      u.column(:surname, :string)
      u.column(:email, :string)
      u.column(:password, :string)
    end
```
- $`rake db:migrate`
- $`rake db:test:prepare`
- $`rake db:reset` (deletes all data )

QuickStart
-----
* `rackup`
* `local server:9292`

Testing
-----
* bundle exec rspec 
PHOTO OF COVERAGE RUN
 
Extensions
-----
* Adding password encryption
* 


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
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

