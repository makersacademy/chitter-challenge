# Notes on the build

1. There is an ongoing issue with the database cleaner causing Travis CI checks to fail. Despite this, locally tests are running fine and Coveralls report suggests high test coverage (see below)

![Screenshot](http://imgur.com/wPlVS9l)

2. There is a gemfile conflict preventing tests passing when using 'sinatra-partial'. An additional branch 'refactor' incorporates refactor of the controller and views using partials.

# Setup

1. Clone the repo by running the following code in your relevant folder:

        git clone "https://github.com/wirsindpapst/chitter-challenge.git"


2. Enter the chitter-challenge folder created and install relevant gems by running 'bundle' (or 'gem install bundler' and then 'bundle' if this is not already installed)
3. Set up a database by running the following in the terminal:
    * psql postgres
    * CREATE DATABASE chitter_development
    * \q
4. Setup the database scheme by running 'rake db:auto_migrate'
5. The app should now be accessible when navigating to 'localhost:4567' in any browser


# Usage

1. If you are a new user, click 'Register' and enter the relevant details
2. If you are an existing users, click 'Sign in' and enter your registration email and password
3. Upon completion, you will be taken to the main PeepDeck. From here you will be able to see all existing peeps, and add a peep by filling out the from and clicking the 'PEEP' button
4. When you are finished, click 'Sign out'
