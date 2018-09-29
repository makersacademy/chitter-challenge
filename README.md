Chitter
=======

A small Twitter clone that will allow the users to post messages to a public stream.

User stories:
-------

```
As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As an administrator
So that my users' sensitive information is secure
I want to encrypt user passwords.

As a user
So that I can interact with other site users
I want to be able to comment on other peeps.

```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Users sign up to chitter with their email, password, name and a username.
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Technologies used:
-------

* App written using Ruby and Sinatra.
* Testing done by RSpec and Capybara.
* Database used is PostgreSQL.
* Linting by rubocop.

Next steps:
-------

* Add more styling to the pages
* Add topic hash tags
* Refactor the way comments are found for each peep to be more efficient.

Testing screenshots:
-------

100% testing coverage and clean lint tester.  
![Alt text](/https://github.com/andrewwood2/chitter-challenge/blob/master/screenshots/Testing_results1.png "Testing results 1")  
![Alt text](/https://github.com/andrewwood2/chitter-challenge/blob/master/screenshots/Testing_results2.png "Testing results 2")   

App screenshots:
-------

![Alt text](/https://github.com/andrewwood2/chitter-challenge/blob/master/screenshots/Feed_signed_out.png "Feed signed out")
![Alt text](/https://github.com/andrewwood2/chitter-challenge/blob/master/screenshots/Register_page.png "Register page")
![Alt text](/https://github.com/andrewwood2/chitter-challenge/blob/master/screenshots/Feed_signed_in.png "Feed signed in")
