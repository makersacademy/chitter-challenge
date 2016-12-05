#Chitter Challenge

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
===========
A web app named 'Chitter' created to the following specification:
* New users can sign up
* Users can log in
* Users can log out
* Users can make a peep - but only if logged in
* Users can view peeps whether they are logged in or not
* Users can see the time a peep was created
* Peeps are displayed in reverse chronological order

Additional comments:
--------------------
* Users cannot sign up if they are attempting to sign up with an email that is already registered
* Users must fill in all fields of the sign up form
* Users must provide matching password and password confirmations

How to Use
==========
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle` to install all of the gems needed to run the web app
4. Start up the app on a local server by entering command `ruby app/app.rb`
5. Go to your preferred web browser (I like Chrome) and navigate to localhost:4567
6. Play with the app!

Notes
=====
Several difficulties were encountered when creating this app, which I would like to list here so that they can be addressed in the future.

Databases
---------
I am currently unsure whether people who fork this repo will need to use psql to create the databases necessary for it to run. I believe that this task should be accomplished using the Rakefile, but need to research this further. Until this has been determined, should anyone be required to create the neccessary databses for this web app, this can be done as follows:

1. Open a Terminal
2. Enter `psql`
3. Enter `CREATE DATABASE chitter_test;`
4. Enter `CREATE DATABASE chitter_development`
5. Enter `\q` to exit

Errors
------
I have included errors in my code, which are displayed when a user does not complete the sign up form correctly. At the moment these errors are displayed in a list at the top of the page. I would like to learn how to display each error next to the form field that it applies to (e.g. invalid email error would appear next to the email input).

CSS
---
I have not yet experimented with CSS much, and would like to learn some basics so that my web apps can be less fugly.

Time stamps
-----------
Although I have implemented a feature whereby each peep will be displayed with a timestamp, I have been unable to include any appropriate testing for this. I am also displeased with the format of the timestamp as I believe it isn't very user-friendly. I would like to look into the `timecop` gem so that I can correctly test my timestamps, and look into formatting so that I can make the view more user-friendly.

Reply to Peeps
--------------
I would like to add an extra feature, whereby users can reply to a peep that has been written previously.


Best Practice
-------------
This challenge was my most difficult yet, and, although I have ended up with a product that covers the required specification, I am unsure whether I achieved this using best practices. I would like to spend some time looking at the exemplar video and code provided by Maker's Academy for this particular challenge so that I can see how to better structure my work in the future.

Examples
========

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

This repo works with [Coveralls](https://coveralls.io/) to calculate test coverage statistics on each pull request.

Travis CI status badge [![Build Status](https://travis-ci.org/kwilson541/chitter-challenge.svg?branch=master)](https://travis-ci.org/kwilson541/chitter-challenge)
