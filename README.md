<h1><b>Chitr - a Twitter clone!</b></h1>
Makers Academy week 03 weekend challenge (Chitter Challenge)<br>
Rufus Raghunath<br>
Feb 2016<br>
Travis CI: [![Build Status](https://travis-ci.org/rufusraghunath/chitter-challenge.svg?branch=master)](https://travis-ci.org/rufusraghunath/chitter-challenge)<br>
Coveralls: [![Coverage Status](https://coveralls.io/repos/github/rufusraghunath/chitter-challenge/badge.svg?branch=master)](https://coveralls.io/github/rufusraghunath/chitter-challenge?branch=master)
<br>
<a href="https://chitr-chatter.herokuapp.com">Deployed to Heroku 14/02/16</a>
---

<b>BASIC TASK:</b><br>
Create a web app that allows users to post short messages (called ‘peeps’) and view them in reverse chronological order — like a slimmer version of Twitter.

<b>BONUS FEATURES IMPLEMENTED:</b><br>
- pretty styling
- max peep length of 140 chars

<b>TO DO:</b><br>
- commenting on other’s Peeps

<b>TECHNOLOGIES USED:</b><br>
- Ruby 2.2.3
- Sinatra
- HTML/CSS
- Bootstrap
- jQuery
- Rspec-Sinatra, Capybara, Coveralls (for testing)

<b>ACKNOWLEDGEMENTS:</b><br>
- background image taken from <a href="https://mindsquirrel.files.wordpress.com/2013/08/1239080_595835303792436_526432645_o.jpg">Mindsquirrel</a>.
- favicon adapted from http://resultsbusinesscoach.com/wp-content/uploads/2014/08/acorn.jpg

<b>HOW TO USE:</b><br>
- clone repo
- run ```bundle``` to install dependencies
- run ```rake db:auto_migrate``` to set up database
- from the ```chitter-challenge``` root directory in the command line, start Sinatra using ```ruby app.rb``` or ```rackup```
- visit the corresponding ```localhost``` in your browser

![Screenshot](/app/public/images/screenshots/visit-home.png)

Once users start to submit peeps, they will be shown here. Click on ‘sign up’ to create an account. Fill in your desired username, real name, email address, and password.

![Screenshot](/app/public/images/screenshots/sign-up.png)

You are now all set to send your first peep. Enter your peep into the message field (50 chars max) and hit ‘Peep!’.

![Screenshot](/app/public/images/screenshots/list-peeps.png)

Your peep will now be displayed for all to see. Click ‘sign out’ to exit your account and your will be redirected to the home page, with your peep still visible. Once others start contributing their messages, peeps will all be listed together in reverse chronological order. That way, you can always see the newest messages first!

![Screenshot](/app/public/images/screenshots/sign-out.png)