# Paul's Chitter Challenge

[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

*[Exercise instructions](INSTRUCTIONS.md)*  

## Installation

1. Clone the repo
2. `bundle install`
3. Set up your databases and user. E.g. run `psql`, and enter these commands:
    1. `CREATE USER chitter WITH ENCRYPTED PASSWORD 'your_password';`
    2. `CREATE DATABASE chitter;`
    3. `CREATE DATABASE chitter_test;`
    4. `GRANT ALL PRIVILEGES ON DATABASE chitter TO chitter;`
    5. `GRANT ALL PRIVILEGES ON DATABASE chitter_test TO chitter;`
4. Copy `.env-example` to `.env` and enter the details of the databases and user you just created.
    - `.env` is included in `.gitignore` in case you want to keep your database credentials secret
5. Start the server with `rackup`
6. Go to `localhost:9292` in your browser
7. Peep away to your heart's content

## Tests

1. Run the tests with `rspec` in the project root

## Some notes as I'm going along...

[A nice blogpost](http://launchware.com/articles/acceptance-testing-asserting-sort-order) on testing that content appears in a particular order with Capybara/RSpec

I turned off lazy loading for `Peep.content` because it wasn't loading at all in `view_peeps.erb`... Surely this shouldn't be necessary though. Why wasn't it loading?

DataMapper is throwing a warning in my RSpec output, like this:
```
> /Users/student/.rvm/gems/ruby-2.5.0/gems/data_objects-0.10.17/lib/data_objects/pooling.rb:149: warning: constant ::Fixnum is deprecated
```
... slightly annoying :-/

If you don't set up your database like it says in the instructions then DataMapper will just use your default database. Probably not desirable.

Would it be better to use Rake to set up the database(s)? Does that even make sense?

Now that all the model stuff is handled by DataMapper, it's not covered by unit tests. Is that right?? Should I write some anyway, even though it's all being handled by a dependency?

My feature test for signing up is not very detailed - all it checks is that the user's name is displayed on screen. Would it be appropriate to check that the right details have been set up in the database, or is that too unit-testy?

Is it really necessary to create my own `Self.authenticate` method? Can't DataMapper do that for me?

The feature tests for logging in are not that strong. They only check for a welcome or error message. We should check whether the user is actually logged in.

Would be better to have more details validation messages when a user enters invalid details on the sign-up form. At the moment you get the same message if you don't enter any of the fields or if the user details already exist.

Should do some validation on the length of a peep.

Might be good to get them to enter their password twice when signing up.
