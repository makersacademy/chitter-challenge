# Chitter 0.1

This website is my implementation of a twitter-like website. It is the weekend challenge of week 4 at the coding bootcamp Makers Academy.

You can find a live-preview online at: https://chittr-here.herokuapp.com

## Documentation

The website has has the following features implemented:

*User can sign up*
* required fields are: First name, last name, username, password and password confirmation
* email address has to be in a valid format and unique
* username must be unique
* password must match password confirmation
* password is encrypted using BCrypt gem

*User can sign in*
* user can sign in with their email address and password
* if details are incorrect, they will see a notice

*User can sign out*
* user can sign out
* they see a confirmation after logging out

*User can post peeps*
* when user is signed in they can post peeps

*Display of peeps*
* sorted newest to oldest
* have a timestamp & the name of the author

## Requirements
*Note: all of the following commands are meant to be typed in your command line/terminal/zsh..*

Database: Postgresql, which can be installed by using homebrew's `brew install postgres`. For instructions on installing homebrew, click here: [http://brew.sh/](http://brew.sh/).

This website runs on Ruby (`brew install ruby`) and the web framework Sinatra(`gem install sinatra`).

You will also need to have [bundler](http://bundler.io/) installed: `gem install bundler`, and then run it before running the programme by typing: `bundle`.

## Running it
After everything is set up, you can run the tests by entering `rspec` in you terminal. The test frameworks are Rspec (unit tests) and Capybara (feature tests).

To run the website locally, type `rackup` in your terminal window and go to http://localhost:9292 your browser and you can try out all the features.

### Author

Annemarie Kohler
