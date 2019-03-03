# Chitter Challenge


# Features

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

# Process

Having cloned the project template, I've also added an app file, updated the gemfile, created an index in the new views folder, and made a lib folder for future classes.


 FEATURE 1 - 'I want to post a message (peep) to chitter'
  - I need a chitter page.
  - I need a class to make posts.
  - To post text to my page, I can either store posts in sessions, or in a database. For the sake of data persistence, I'm choosing a database.

Created a Chitter class and spec.

TEST - Feature test expecting to see a hard coded post on the index page.

RED - See above.

(Expected to find text)

GREEN - Hard-coded text into view.

PASSED ALL TESTS, 100% COVERAGE, RUBOCOP CLEAR

  Now that I can make the feature test pass and fail, I should prove that the feature works as intended, which means reading text from a database.

REFACTOR - Removed hard-coded text and created a chitter_peeps database with a peeps table. For now, the table only has a serial column and a text column. Also made a chitter_peeps_test database.

RED - See above.

(Expected to find text)

TEST - I need to TDD a Chitter.list method to display peeps

RED - See above.

(No .list method)

RED - Defined method

(Doesn't respond to include?)

RED - Added peeps array

(Expected to include text)

RED - Linked view to model through controller

(Expected to include text)

RED - Made view iterate through peeps

(TypeError, second parameter should be rack app)



WHILE TYPE ERROR IS BEING RESOLVED, MOVE ONTO POSTING

TEST - Feature test expecting that someone can fill in a field and see their peep posted

TEST - Unit test expecting to be able to use the .post method

RED - See two above

(No peep field)

RED - Made peep field

(No post button)

RED - Made post button, made post route

(Undefined method post)

RED - Defined method post

WORKING


  Now that I can see and make posts, I need to view them in reverse chronological order. I can do this by amending my SELECT query to include ORDER BY.

WORKING
