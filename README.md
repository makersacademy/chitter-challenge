
Chitter
=================

Chitter is a social platform, that uses the basic logic behind twitter.

Getting starting:
-------

First you must clone the repo. This will create the folder chitter-challenge in your pwd.

```
$ git clone https://github.com/acookson91/chitter-challenge.git
$ cd chitter-challenge

```

Now you need to install the gems required to run this program.

```
$ bundle install

```

if your going to be running this locally you will need to create a new database in psql.

```
$ psql

CREATE DATABASE chitter_development

(if you want to run rspec test also create chitter_test)

```



Testing:
-------

To test the program you must first have a chitter_test database. To run rspec in the chitter-challenge folder

```
$ rspec

```

To run the program locally you must use rackup, which sets the app up on http://localhost:9292/ (port 9292).

```
$ rackup

```


How to use Chitter:
-------

Below is the homepage. Here your able to view previous chits.

![Home page](http://i.imgur.com/lnyY3wx.png)

Use the signup button to reach the following page.

![Sign up](http://i.imgur.com/mFXIkcd.png)

Once you signup you will be taken to the welcome page. Where you have a choose to write and new tweet or sign out.

![Welcome](http://i.imgur.com/fFH0USu.png)

Once you click new chit, you will be able to input your chit.

![New Chit](http://i.imgur.com/MpPDjKY.png)
