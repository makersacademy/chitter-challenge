Chitter Challenge
=================

<h2>Instructions to connect </h2>

- Connect to psql
- Create the database using the psql command CREATE DATABASE chitter;
- Connect to the database using the pqsl command \c chitter
- Run the query saved in the file create_tables.sql

<h4>Initial thoughts</h4>
- Per user requirements
- A user can view all peeps using threads via my infrastructural design choice (listed via Thread.all)
- A user can create many threads (listed via user.get_threads(user_id))
<h5>Definitions</h5>
- A thread is an identifier with "descendent" peeps (thread.get_peeps(thread_id)).
<br>In other words a thread establishes which "conversation" a peep belongs to, running in parallel with database schema
- A peep is a message representing responses to a given thread.<br>
 NB: Publish date enables chronological ordering in reverse for both thread and peeps (youngest to oldest, top to bottom)

<img src="https://i.gyazo.com/f0bb3e2d3f18129066b2578ff7ad6dca.png"></img>

<h2>Database schema</h2>

<img src="https://i.gyazo.com/9e0c4f0960fe6656001ca0066e2a5bae.png"></img>

<h3>Notes on functionality</h3>

- All primary IDs are serialized and unique
- A user can appear many times on user_peeps
- A thread can appear many times on user_peeps
- An individual peep can only appear once on user_peeps as it belongs to a particular thread
- The application is unable to, outside of explicit tagging, be certain which user a response is targeted towards. <br>
The application can only determine the targeted thread.

- A thread is created at the same time as a peep, 
however for ease of use thread creation is also time-stamped, removing the necessity to find the first peep to implicitly determine a threads birth time.

<img src="https://i.gyazo.com/b458a46868161972b5930a6cf28ddca4.png">
<img src="https://i.gyazo.com/4f56fe6f16720df0aecec51ef1ef9be1.png">

<h3>Future work</h3>
- Add a join table for thread and users to present thread owner (OR) add another column to user_peeps representing the owner of a thread (less preferential)
- Add email functionality with notifications
- Profile image upload
- Use industry-standard data mapper

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

EXTRA

As a Maker
So that I can post targeted messages
I want to post messages to a particular conversation
(In order to start a conversation as a maker I want to reply to a peep from another maker)

* Work on the CSS to make it look good.


Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

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
