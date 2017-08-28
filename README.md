Chitter Challenge!
==================

Build a Twitter clone in a weekend, what could go wrong?

How to use
----------

Just copy the instructions below, or check it out on [Heroku](https://chitter-sg.herokuapp.com/peeps)
````
$ git clone https://github.com/stephengeller/chitter_challenge
$ bundle
$ createdb peep_db_development
$ rackup
````

Examples:
![Here are some example images of the app](http://imgur.com/a/Jcu2c)


Technologies used
----------------

  - Web development: Sinatra, DataMapper, Shotgun, Rackup
  - Testing: Capybara, RSpec, Launchy, SimpleCov, Rubocop

Challenges
----------
This app was very tricky to work, mainly due to the number of new skills needing to be combined at once. Combining DataMapper, Sinatra, MVC principles, HTML and others proved very difficult to do, and led to many hours of head-scratching trying to fix errors.

Successes
---------
There were many successes in this project, such as:
  - Getting each 'peep' to successfully be stored in the database
  - Setting up a website using Sinatra and using 'sessions' to connect variables between paths
  - TDDing everything using Capybara / Launchy
  - Using some basic HTML to style pages
  - Only being able to peep if you are logged in


Still to be implemented
-------------------
  - Integrating sign-ins as well as sign-ups
  - Using CSS instead of the more basic HTML
  - Using BCrypt to protect passwords
  - Better formatting of the DateTime per peep

