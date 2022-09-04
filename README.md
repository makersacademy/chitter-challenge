Chitter Challenge
=================

This project was completed as part of the "Web Applications" week in the Makers bootcamp.

This challenge was completed using:
* Ruby - code base
* RSpec - for testing various parts as part of TDD
* PostgreSQL - for creating the databases and SQL for interacting with the database
* Sinatra - web application framework for Ruby
* HTML/CSS - for webpage design
* Heroku - For hosting a live version of the app for testing and showing off!

<img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"> <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white"> <img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white">

All tests are passing: ![Travis test build passing](https://app.travis-ci.com/nickwlong/chitter-challenge.svg?branch=testbranch)

It met the following user stories:
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

To begin my planning, I worked through the user stories to gain an idea of what data I would need to store, access and manipulate. Upon the creation of the database structure I created repository classes for the data tables. Following this, I drafted the page and route layout for the web app using Miro:

![Showing a copy of the mindmap I used to design the page/route layout](https://i.imgur.com/hvihIX3.png)

https://miro.com/app/board/uXjVPahABmE=/?share_link_id=790302134076

The most complicated stage was meeting the 'advanced' user story, emailing a tagged user to notify them of a new post. However, after working through some barriers I managed to create a functioning system. Though I did not get around to finding how to test this method. NB: This method is currently inactive to prevent 

Demonstration of an email sent to a tagged user after posting a peep:
![Shows an email from Chitter including the post contents](https://i.imgur.com/jfPPY85.png)

I had not used CSS to create a working web app like this before, so I spent much of my final day exploring various techniques in CSS. 

My final task which I will come back to if I have time:
* Implement a way to see the peeps from everyone without logging in


## How to install the web-app:

Create a directory and run the following code from that location:

```
$ git clone https://github.com/nickwlong/chitter-challenge
$ gem install bundler
$ bundle
```
Install postresql if you have not already using `brew install postgresql` and create the database `chitter_test` using `psql -h 127.0.0.1 chitter-test /spec/chitter_seeds.sql` followed by `psql -h 127.0.0.1 chitter-test /spec/chitter_test_seeds.sql`

Run the code ```rackup``` in your terminal to run a local server and access the web-app via http://localhost:9292

When you access the webapp you can login using the username "ted453" and password "qwerty123" or create your own fake username/password. 
