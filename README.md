# Paul's Chitter Challenge

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

I turned off lazy loading for `Peep.content` because it wasn't loading at all in `view_peeps.erb`... surely this shouldn't be necessary though. Why wasn't it loading?

DataMapper is throwing loads of warnings in my RSpec output, like this:
```
> /Users/student/.rvm/gems/ruby-2.5.0/gems/dm-validations-1.0.2/lib/dm-validations.rb:33: warning: already initialized constant ActiveSupport::OrderedHash
> /Users/student/.rvm/gems/ruby-2.5.0/gems/dm-serializer-1.0.2/lib/dm-serializer/common.rb:6: warning: previous definition of OrderedHash was here
> DataObjects::URI.new with arguments is deprecated, use a Hash of URI components (/Users/student/.rvm/gems/ruby-2.5.0/gems/dm-do-adapter-1.0.2/lib/dm-do-adapter/adapter.rb:215:in `new')
> /Users/student/.rvm/gems/ruby-2.5.0/gems/data_objects-0.10.17/lib/data_objects/pooling.rb:149: warning: constant ::Fixnum is deprecated
```
... Annoying :-/

If you don't set up your database like it says in the instructions then DataMapper will just use your default database. Probably not desirable.

Would it be better to use Rake to set up the database(s)? Does that even make sense?

Now that all the model stuff is handled by DataMapper, it's not covered by unit tests. Is that right??

Couldn't get DataMapper's BCryptHash type to work. It gave me this error when I tried to use it:
```
/Users/student/.rvm/gems/ruby-2.5.0/gems/dm-types-1.0.2/lib/dm-types/bcrypt_hash.rb:2:in `require': cannot load such file -- bcrypt (LoadError)
```
