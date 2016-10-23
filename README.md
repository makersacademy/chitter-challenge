[![Build Status](https://travis-ci.org/fmlharrison/chitter-challenge.svg?branch=master)](https://travis-ci.org/fmlharrison/chitter-challenge)

Chitter - Where all your peeping desires come true.
=======

##Week 4: Weekend Challenge : Databases

This challenge was a chance for us to build on our experience from the Bookmark Manager task.  It involved a basic Twitter clone that allowed users to post messages to a public stream.

###Functionality

Users sign up with an email, name, password, and a user-name, and are then able to log-in and log-out.  BCrypt is used to sort secure passwords and user_names and e-mails are unique.  Users must be logged-in in order to post, but any person is able to view a chronologically-ordered list of posts.  Posts are labelled with a user-name and a time stamp. The DataMapper ORM has been deployed to manage data from a PostgreSQL database.  This has been built in accordance with test-driven-development.

###Feedback From Review & Ways To Improve
- Need to refactor in order to make the code more elegant.
- Tests could be more eloquent.  1 test = 1 expectation
- CSS should have been used to improve the design of the website.
- I would have like to include the ability to leave a comment on a peep.
- The controller has a lot of logic in it. Extracting this logic into the modules would be a good next move.  

###Technologies
```
DataMapper with a PostgreSQL Database
Ruby
BCrypt
RSpec, Capybara
Sinatra-Cucumber
HTML
Sinatra-flare
```


###How to use the Chitter
Chitter can be run using a local sinatra host by running:
```
rackup config.ru
```
from the command line.

###How to test
```
git clone https://github.com/fmlharrison/chitter-challenge.git
cd chitter-challenge
rspec
```
