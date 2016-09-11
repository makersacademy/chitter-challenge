# PrestoPronto

Welcome to PrestoPronto. This is a twitter imitation built on the Sinatra framework as part of the Makers Academy Course. Sinatra-Bootstrap was used for styling, PostgreSQL for the database, DataMapper as the ORM and BCrypt for password administration.

## Install Instructions

The app is deployed at http://www.prestopronto.herokuapp.com.

To install to a local machine:
$ git clone https://github.com/tansaku/chitter_challenge
$ bundle
$ rake db:setup
$ rake db:auto_migrate
$ rspec
$ rackup

## Usage Instructions

Once deployed you can visit the homepage at localhost:9292   

![Screenshot](https://dl.dropboxusercontent.com/u/19916786/home.png)

Where you will be able to sign up:

![Screenshot](https://dl.dropboxusercontent.com/u/19916786/sign_up.png)

Once you have signed up you can see existing peeps:

![Screenshot](https://dl.dropboxusercontent.com/u/19916786/peeps.png)

Make your own peeps:

![Screenshot](https://dl.dropboxusercontent.com/u/19916786/make_peep.png)

And reply to others:

![Screenshot](https://dl.dropboxusercontent.com/u/19916786/comment.png)
