Chitter Challenge
=================

<div align="left">
  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/EvSivtsova/chitter-challenge">
</div>
<div>
  <img src="https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white"/> 
  <img src="https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white"/>
  <img src="https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white"/>
  <img src="https://img.shields.io/badge/RSpec-blue?style=for-the-badge&logo=Rspec&logoColor=white" alt="Rspec"/>
  <img src="https://img.shields.io/badge/Test_coverage:_99.27-blue?style=for-the-badge&logo=Rspec&logoColor=white" alt="Rspec"/> 
</div><br>

This is a Makers' Academy challenge with the following requirements:

------------

## Features

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

```
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## Code Design

I followed MVC model when working on this chalenge. I designed the Models first:

1. User and User Repository Classes - handle user creation and executes searches in the users database
2. Peep and Peep Repository Classes - have reponsibility for the creation of posts or peeps and searches through the peeps database. 

I test-driven the classes in line with user stories provided. 

Afterwards I test-driven the Application class, which functions as a controller, and the views as such connecting the frontend and the backend. To make sure that users are the only ones posting under their names, I implemented the sessions and validated input when signing up and loggin in.

The result is a simple six page app that allows the users see other's short post and post themselves.

## TechBit

Technologies used:

* Ruby(3.0.2)
* RVM(1.29.12)
* Sinatra(2.2)
* Rack (1.3)

Testing:
* Rspec(3.11)
* Simplecov(Test Coverage)
* Rubocop(1.20)

Clone the repository and run bundle install to install the dependencies within the folder:

```
git clone https://github.com/EvSivtsova/chitter-challenge.git
cd chitter-challenge
bundle install
```

To run the app in the browser:

```
createdb chitter_database
psql -h 127.0.0.1 chitter_database < spec/seeds/chitter_database_test.sql
rackup
```

Go to `http://localhost:9292` to play with the app.

<div>
  <img src="https://github.com/EvSivtsova/chitter-challenge/blob/main/screenshots/index-page.png" width=400px/>
  <img src="https://github.com/EvSivtsova/chitter-challenge/blob/main/screenshots/signup-page.png" width=400px/>
</div>

Please view screenshots of other pages [here](https://github.com/EvSivtsova/chitter-challenge/tree/main/screenshots).

To run the tests:

```
createdb chitter_database_test
rspec
rubocop
```
<img src="https://github.com/EvSivtsova/chitter-challenge/blob/main/outputs/chitter-challenge-test-coverage.png" width=500px/>




