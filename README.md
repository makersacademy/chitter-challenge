Chitter Challenge
=================

Challenge:
----------

To write a little Twitter clone (aka Chitter) that will allow the users to post messages to a public stream.

Features:
-------

```

User Story 1 (US1)
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

User Story 2 (US2)
As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

User Story 3 (US3)
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

User Story 4 (US4)
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

User Story 5 (US5)
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

User Story 6 (US6)
As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```


Installation and use
----------------------

#### Local mode :
1. Fork this repo
2. Copy the URL of the forked repo
3. Open terminal ( or equivalent ) and move to the desired directory, in which you want to create a clone of Chitter
4. Clone the forked repo : ```$ git clone URL```
5. Run bundle to install relevant gems : ```$ bundle install```
6. Run the program with this command : ```$ rackup```
7. Check the port number in the terminal output. In the example below, it is *port=4567*
8. Open a preferred browser and type ```localhost:port number``` into the URL bar. ( e.g. ```localhost:4567``` if port number is 4567 )
9. The browser should display the sign-up page

Example of terminal output upon running ```$ rackup``` :
```
$ ruby app/chitter.rb
[2016-03-28 11:51:17] INFO  WEBrick 1.3.1
[2016-03-28 11:51:17] INFO  ruby 2.2.3 (2015-08-18) [x86_64-darwin14]
[2016-03-28 11:51:17] INFO  WEBrick::HTTPServer#start: pid=65398 port=929
```

#### Remote mode :
The site is live here temporarily

https://shielded-lowlands-92800.herokuapp.com/

How to use
----------


Technologies
------------

Written in Ruby

Using the web framework Sinatra

Developed using Behaviour Driven Development using  
*  rspec
*  rspec-sinatra
*  capybara

Database used is postgreSQL

Use of datamapper to link database with web app

Online host is Heroku

Future Features
-------
* Max character length of each peep is 140 to feel like twitter

* Add CSS and images to improve user experience

* Ability to add to comments to each peeps to improve user interaction

* Refactor controllers (skinny controllers and separate features) and tests to improve readability and ease of future expansion




Author
------

Hanif Fakira
