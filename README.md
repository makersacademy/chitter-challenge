Chitter
=================

As part of consolidating our learning for the week Makers Academy set us the weekend challenge of creating a Twitter clone called 'Chitter.'

The user stories led us to create the following app features:
* A user can sign up
* A user can sign in and sign out
* A user an post a message (a Peep)
* All peeps had to be displayed in reverse chronological order
* All peeps should have the time it was 'peeped'

Technologies:
* Chitter is a modular Sinatra application.
* It uses DataMapper for interactions with the database (provided by Postgres both locally and on Heroku)
* BCrypt is used for authentication.
* Styling is through Bootstrap, HTML and CSS
* Tested thoroughly with RSpec and Capybara.

To use Chitter please:

```
Clone the repo
```
```
$ bundle install
```
 ```
$ rackup
```
Then open the browser of your choice and go to:
```
http://localhost:9292
```


Alternatively this app has been deployed to Heroku and can be used at [chitterbyjoe.herokuapp.com](http://chitterbyjoe.herokuapp.com). This app has been built mobile first in mind but can also be viewed via your favourite browser.
