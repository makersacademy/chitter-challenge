Chitter Challenge
=================

```
 :                      :
  ::                    ::
  ::`.     .-""-.     .'::
  : `.`-._ : '>': _.-'.' :
  :`. `=._`'.  .''_.=' .':
   : `=._ `- '' -' _.-'.:
    :`=._`=.    .='_.=':
     `.._`.      .'_..'
       `-.:      :.-'
          :      :
          `:.__.:'
           :    :
          -'=  -'=
```

Description
-----------
This is the Week 4 weekend challenge from Makers Academy. The challenge was to design a web app names Chitter to the following specification:
* New users can sign up
* Users can log in
* Users can log out
* Users can make a "peep" (a short message stating what is on their mind) - but only if logged in
* Users can view peeps whether they are logged in or not
* Users can see the time a peep was created
* Peeps are displayed in reverse chronological order

Project includes a Peep and User class.

###Extra Features
* Users cannot sign up if they are attempting to sign up with an email that is already registered
* Users must fill in all fields of the sign up form
* Users must provide matching password and password confirmations

Technologies
------------
* Code is written in Ruby
* Testing done using RSpec and Capybara
* Sinatra Framework (DSL) used to create web application using Ruby
* DataMapper (ORM) used to manipulate databases
* Database Cleaner used to clean test database before/after each test
* BCrypt used to encrypt user passwords before storing them in the database
* Coveralls used to assess test coverage
* Travis CI used to check build status (badge displayed below)

Heroku
------
This app has been deployed to Heroku. You may play with it [here](https://sleepy-everglades-54950.herokuapp.com/). If you would like to play with the code on your own computer, you may follow the instructions `How to Install` and `How to Use` below.

How to Install
--------------
1. Fork this repo
2. Clone your forked repo to your local machine
3. Run the command `gem install bundle` (if you don't have bundle already)
4. When the installation completes, run `bundle` to install the gems needed to run the program

How to Use
----------
1. Start up the game on a local server by entering command `ruby app.rb`
   ```[16:06:30] KimWilson:rps-challenge git:(master) $ ruby app.rb
   [2016-12-20 16:06:34] INFO  WEBrick 1.3.1
   [2016-12-20 16:06:34] INFO  ruby 2.2.3 (2015-08-18) [x86_64-darwin14]
   == Sinatra (v1.4.7) has taken the stage on 4567 for development with backup from WEBrick
   [2016-12-20 16:06:34] INFO  WEBrick::HTTPServer#start: pid=99059 port=4567
   ```
2. Go to your preferred web browser (I like Chrome) and navigate to localhost:4567
3. Play with the app!

Optional: If you wish to run the tests for this project, enter `rspec` into your command line. If you wish to view the test coverage, enter `coveralls report` into your command line.

Notes
-----

###Databases
In order to use this app on your own computer, you will first need to create the necessary databases on your computer. This can be done as follows:

1. Open a Terminal
2. Enter `psql`
3. Enter `CREATE DATABASE chitter_test;`
4. Enter `CREATE DATABASE chitter_development`
5. Enter `\q` to exit

###Errors
I have included errors in my code, which are displayed when a user does not complete the sign up form correctly. At the moment these errors are displayed in a list at the top of the page. I would like to learn how to display each error next to the form field that it applies to (e.g. invalid email error would appear next to the email input).

###CSS
I have not yet experimented with CSS much, and would like to learn some basics so that my web apps can be less fugly.

###Time stamps
Although I have implemented a feature whereby each peep will be displayed with a timestamp, I have been unable to include any appropriate testing for this. I am also displeased with the format of the timestamp as I believe it isn't very user-friendly. I would like to look into the `timecop` gem so that I can correctly test my timestamps, and look into formatting so that I can make the view more user-friendly.

###Reply to Peeps
I would like to add an extra feature, whereby users can reply to a peep that has been written previously.

Examples
--------

The Chitter homepage, with sign up and sign in buttons:

<kbd>![alt text](http://i.imgur.com/q8Q5W3o.png)</kbd>

Signing up for a Chitter account:

<kbd>![alt text](http://i.imgur.com/ivtrdBR.png)</kbd>

Making a new peep:

<kbd>![alt text](http://i.imgur.com/vJEQZLf.png)</kbd>

New peep is displayed on the homepage:

<kbd>![alt text](http://i.imgur.com/YSDOEdX.png)</kbd>

Logged out, can still view peeps:

<kbd>![alt text](http://i.imgur.com/VGgnlMt.png)</kbd>

***

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Travis CI status badge [![Build Status](https://travis-ci.org/kwilson541/chitter-challenge.svg?branch=master)](https://travis-ci.org/kwilson541/chitter-challenge)
