William's Attempt at Chitter Challenge

UPDATE: In Monday's morning pairing review session I was considerably refreshed, and was also paired with my bestie Corinne! Together we had another look, and although it was mostly her doing, spotted an extra instance of @user in the app registration! The code is now all fixed, works like a charm, passes all tests, although sadly I did not have time to run Travis that I wanted to experiment with or touch up the HTML/CSS. Also Rubocop didn't work on my Ruby version, and I didn't have time sort that.



This weekend challenge was yet again an infuriating one, as I was extremely close to getting it finished, but due to what felt like one fairly small issue which I was unable to fix after 8+ hours I was unable to complete everything. That is the sign in part, for some reason I cannot grasp what the fudge is going on with it. In IRB it all works correctly, in rspec every test passes with full 100% coverage. But it doesn't actually work! Once again I feel completely let down by tests here and genuinely think my limited time would have been better invested in actually writing the code and checking it works by just looking at the website, as when I did start to tinker the code, the capybara test that was definitely supposed to fail passed, and two other capybara tests that should have easily been passing were failing, it literally made zero sense and felt it added more confusion and chaos to what I already had. I don't understand how capybara apparently seems to see the page differently to what I see if I host it. Honestly, it just felt like a waste of time writing capybara feature tests.

Ultimately I don't feel I did too badly here, but these weekend challenges are really starting to take their toll, the amount of time required to complete them doesn't feel sustainable, even if you didn't have any family commitments and had the entire weekend to do it. I also feel like by not completing the previous weeks bookmarks pairing challenge (which was also extremely hard and we had nowhere near enough time on), I have missed out on valuable knowledge and experience that would have helped me immensely with this weekend challenge and saved me a lot of time. As there are there are things that I am aware of, but have no real idea about (such as SQL injection).

Forgive my rant, but I simply hate starting something, and not being able to complete it, call it autism, OCD, or whatever. However it's currently 1.30AM on Monday morning, and even if I could keep my eyes open any longer, my brain has been melted for a good few hours now, and I am getting nowhere further.


=================
To begin I have made two databases using PSQL: 'chitter' and 'chitter_test'.

Each database has two tables: 'users' and 'peeps'.

CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(50), password VARCHAR(20), name VARCHAR(30), username VARCHAR(20));

CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(1000), author VARCHAR(20), time VARCHAR(30));

Chitter Challenge
=================

* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

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

In this unit, you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge now, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

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
