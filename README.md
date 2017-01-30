Chitter Challenge
=================

* Clone this repo to your local machine
* In a terminal, navigate to the repo directory and run the command: bundle
* Using postgres, create a database called chitter_test. This is used for running rspec and capybara test
* Using postgres, create a database called chitter_development. This is used for adding data using the browser
* Start the server with the command: rackup
* In a web browser, navigate to: http://localhost:9292
* You can view "Peeps" (posts) and comments on the homepage without logging in
* Click the "Sign up" button and enter some details to sign up
* Once signed up, you will be automatically logged in
* Once logged in, you will be able to post, or comment on a post
* To sign out, click the "Sign out" button
* If you return and want to log in again, click the "Sign in" button and enter your credentials

* The app can also be viewed at: https://robs-chitter.herokuapp.com/

```
$ git clone https://github.com/treborb/chitter-challenge.git
$ cd chitter-challenge
$ gem install bundler
$ bundle
$ psql
$ CREATE DATABASE chitter_test;
$ CREATE DATABASE chitter_development;
$ \q
$ rackup
In the web browser: http://localhost:9292
```

## Screenshot

![Alt text](/app/public/img/screenshot.png?raw=true "Screenshot")
