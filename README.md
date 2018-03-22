README Edit: My approach and code review
=================

My approach
------
Pre-code:
* First, I read through the User Stories and drew the Domain Models in a table in order to have a clear idea about the main objects and messages of the app.
* Secondly, I drew a relational diagram focusing focusing on what happens after every step in the app. For example: the user opens the website, then peeps are displayed (no login required). The user can choose to sign-up and/or log-in to post new peeps.
* Finally, I drew a quick mock-up of the pages, to have a better understanding on where to place the different sections, etc.

Regarding the development process, I tried to stick by this flow as much as possible:
* Feature Test
* Unit Tests
* Implementation
* Refactoring

Next focus
------

* If I had more time, I would like to work on validations when signing up and signing in. I started working on them a bit, but this is something that can be greatly improved within the app.
* More CSS Styling would be great too if I had had more time.

Personal code review
------

* I keep having trouble being led by TDD, especially when it comes to Unit Tests (I have not managed to finish all of them in the way I wanted to). I tried to implement the one line of code at a time without breaking old tests when refactoring or adding new code, and for a while it seemed to help, but then I got lost in my code once again and I had to separate from the optimal flow for a bit.
* I had not many difficulties with Capybara and Feature Tests though. I found myself testing a lot on the browser and changing many things in the Model. I also spent quite a few hours to get familiar with DataMapper, which is the first ORM I have come across so far.
* Regarding databases, I am happy that I understand how relations between tables work and what kind of relations there are.
* Finally, I have observed that in many occasions I struggle to access specific data in my code, or to differentiate among them, especially when dealing with hashes in objects, symbols... I feel like I rush a bit sometimes and start typing and testing the different options rather quickly instead of thinking about what I really want to do, which would save me some time definitely.


Technologies used
------

* Capybara
* CSS
* DataMapper (ORM)
* HTML
* PostgreSQL
* RSpec
* Ruby
* Sinatra


Installation Instructions
------
To install all the dependencies needed for the project, please install **bundler** by running ```gem install bundler``` in the terminal. Then, simply run ```bundle``` to install the gems included in **Gemfile**

In order to set up the databases needed for this project, please run the following commands:
```rake
rake setup
rake setup_test_db
```

If you want to clear the databases, simply run ```rake clear_db```

Finally, simply type one of the following commands in your terminal to navigate around the app:
* ```rackup```
* ```ruby app.rb```

How to run the tests
------

* To run the tests, simply type ```rspec``` in your terminal. Please make sure you run ```rake setup``` before using RSpec as you need to create the databases for the project.

Screenshot
------

![Chitter](/docs/Chitter.png?raw=true)

Chitter Challenge
=================

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
```