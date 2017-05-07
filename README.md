#Chitter Challenge

A (very) basic Twitter clone.

## Usage:

### Option 1: Use the app on Heroku
Just visit the app [here](http://chitter-17.herokuapp.com/chitter-newsfeed).

### Option 2: Deploy locally
Ruby Code:
1. `git clone git@github.com:adc17/chitter-challenge.git`.
2. `cd path/to/dir` then `bundle install`.

PostgreSQL:
1. Install PostgreSQL (instructions [here](https://www.postgresql.org/download/)).
2. Initialize database: `cd path/to/chitter-challenge/dir` then `rake db:migrate`.

Run on a local server:
1. `cd path/to/dir` then `rackup -p 4567`.
2. Visit `localhost:4567` in your browser.

## Challenges:

1. DataMapper Setup: I spent a long time troubleshooting a confusing `include?` error related to DataMapper. I eventually realized that when I extract my DataMapper configuration to a separate file, every file containing a class with `include DataMapper::Resource` must be referenced in the DataMapper config. I also got an error about an undefined method `/`, which may have been because I didn't add a `config.ru` file right away. I'll do better on setting up my ORM next time.
2. Knowing when to test DataMapper methods. I may have gone overboard this week; I need to get clearer on when unit tests are necessary with an ORM.
3. Knowing when database upgrades and migrations are necessary. My basic understanding is if database classes change, action is necessary. But when is a `migrate` necessary over an `upgrade`? And are there occasions when manual adjustments are necessary using `psql`, e.g. `NOT NULL` requirements at db level? Are `NOT NULL` requirements at db level preserved if `migrate` or `upgrade` are run at a later date? I plan to learn more about this.
4. Bundle: It still feels a bit mysterious, and I need to understand the ins and outs of its various commands better, especially `bundle exec …` and `bundle update`.
5. 'Putsing' to an `.erb` file. I've used scare-quotes as I don't think `puts` does this. I tried in vain to create a method that prints strings as a side-effect, and to then print those strings to a view. I'd like to find a way of doing this for future challenges.


## Strengths:

1. I kept it simple this weekend. It may just have been a simple challenge, especially considering its similarity to the week's Bookmark Manager Challenge re: user account functionality, but still, a plus for sure. I did all my modelling with two small classes and a one-method mixin, and I'm happy with that.
2. Not losing focus due to debugging nightmares. When it takes several hours to resolve infuriating and cryptic-looking error messages, my concentration can definitely go. I managed to stay focussed in spite of that during this challenge. That's definitely something to build on moving forwards.


## Technologies:

* Web framework: [Sinatra](http://www.sinatrarb.com/)
* Password Encryption: [BCrypt](https://github.com/codahale/bcrypt-ruby)
* ORM: [DataMapper](http://datamapper.org/)
* Database: [PostgreSQL](https://www.postgresql.org/)
* Feature testing: [Capybara](https://github.com/teamcapybara/capybara)
* Unit Testing: [RSpec](http://rspec.info/)
* Other technologies of note: [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner), [Sinatra::Flash](https://github.com/SFEley/sinatra-flash), [Sinatra Partial](https://github.com/yb66/Sinatra-Partial).

## Tests

1. Initialize testing database: `cd path/to/chitter-challenge/dir` then `rake db:migrate RACK_ENV="test"`.
2. Run `rspec`.

## Other notes

Created as my fourth weekend challenge during the [Makers Academy](http://www.makersacademy.com) Bootcamp.