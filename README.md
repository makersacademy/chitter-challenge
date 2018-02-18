To use this repo
=================
bundle # Installs required gems
rake drop_databases # Drops cheeter development and test databases
rake create_databases # Creates cheeter development and test databases
rake setup # Creates required tables
rackup # Loads website at local host port
rspec # Runs RSPEC tests

Marcus personal code review/reflection
=================

My approach
---------
* I started off reading through all the instructions and user stories to get an overview of the different elements
* I then set up the full file structure to have a functioning app and tests
* I had to decide between taking the new curriculum approach of building all methods from the ground up or learning and using Data Mapper for the first time
* I was intrigued to challenge myself in learning a new complex gem from documentation and without walkthroughs, so worked to get datamapper up and running
* I then used the full TDD cycle to build the features I was able to in the time I had

Mini personal code review: My appraisal of my attempt at the weekend challenge
---------
* I found learning and getting Data Mapper set up with no supports was a good challenging process. I felt I achieved a good level of success having learned and used it from scratch. However, it did take a good chunk of time to be able to learn it and test it out, leaving less time for the functionality of the Challenge
* I felt good about my process of having Rake files to set up the environment, using DataMapper and creating the code using true TDD
* There is a lot more I would like to do in completing this exercise and I feel I still have knowledge gaps on databases due to the slower process of the new curriculum that we were testing out at Makers Academy this week. I ran out of time to do so but have documented all the areas I would like to learn more about below so that I can investigate later

Areas of knowledge on databases that I would like to research and solidify
---------
Authentication:
        * https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/19.md
Linking tables: I understand how tables links having worked in Analytics before, but the practical steps of using this in code I want to investigate further
        * One to many relationships
            * https://github.com/makersacademy/course/blob/master/bookmark_manager/16_one_to_many_relations.md
        * Many to many relationships
            * https://github.com/makersacademy/course/blob/master/bookmark_manager/17_many_to_many_relationships.md

Questions and outstanding elements from the exercise to discuss with Coaches
---------
* How should the test coverage work for Rakefiles?
* I believe 'integration testing' is missing from the code base. I had feature testing covering user experience, unit tests covering the model, but I am not currently testing whether the user input truly flows back into the database, other than retrieving certain content onto the page
* Data mapper error (fix num deprecation) seems to be a ruby versioning issue - how could I have avoided this error?
* What is the approach for having posts on Cheeter include user names? Is posts having user_name attached a table linking issue or a sessions issue? (e.g. how can I get a post to read from the user table and give the user name too - or does this use session data on how is logged in to pull and add in user info?)
* How does linking of data tables work in practice? I can get data mapper to link the tables/ I understand linking tables having worked in this area before, but I can’t see how it will work in practice in code
    * Data mapper raised an error when I linked the tables using Data mapper syntax
    * What does ‘Returning’ do in SQL?
        * def self.create(options)
            * result = DatabaseConnection.query("INSERT INTO comments (link_id, text) VALUES('#{options[:link_id]}', '#{options[:text]}') RETURNING id, text”)
            * Comment.new(result[0]['id'], result[0]['text’])
* How to make sign in work:
    *  Write a feature test for successful sign-in. Wondering what to call your routes? Signing in is often thought of as 'creating a new session'.
* Bcrpyt not working:
    * If try and do data mapper:
        *
    * If try and use in code, prevents user being stored (may be because string datatype is not usable for this)
* Peeps (posts to chitter) have the name of the maker and their user handle.

Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

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

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* You only can peep if you are logged in.
* Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests
* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

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
