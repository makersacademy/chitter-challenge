# Chitter Challenge

Chitter is a full stack web application that allow users to post message known as peeps, view other people peeps and also allows users to create an account and sign up.

## About:

This is a weekend challenge from week 4 of the Maker's Academy course. We were asked to create a twitter clone that allows users to post messages to a public streams.

## User Stories:

Here are the user stories provided for the challenge:

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter
```

```
As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

HARDER

```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

ADVANCED

```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Technologies

This project is created with:

- Ruby 3.0.2
- Postgresql
- Sinatra
- Rspec
- Capybara
- Rackup
- Rubocop
- Webrick 1.3.1

## Installation:

To set up this application:

1. Clone this repo:

```
https://github.com/Aisha-Yusuff/chitter-challenge
```

2. Install all the gems

```
bundle install
```

<!-- 3. Set up RSpec,

```
rspec --init
```

This will create a spec directory and spec_helper.rb file.

4. Set up Sinatra by creating app.rb file and add this to your file

```
# in app.rb

require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end
```

5. Create config.ru file to configure rackup command

```
# in config.ru

require_relative "./app"

run Chitter
```

6. Connect capybara with sinatra by adding this to your spec_helper.rb file

```
# at the top of spec/spec_helper.rb

# Set the environment to "test"
ENV['RACK_ENV'] = 'test'

# Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Tell Capybara to talk to Chitter
Capybara.app = Chitter
``` -->

## Databases:

Chitter maintains two databases, the first one is also named chitter and the second database is named chitter_test.

To create each database:

1. Download [PostgresSQL](https://www.postgresql.org/download/)
2. Create a default database

```
createdb (your username)
```

3. Run psql

```
psql -h 127.0.0.1
```

4. Then to create the databases for this application run the following psql commands:

```

CREATE DATABASE chitter
CREATE DATABASE chitter_test

```

5. Then enter each database using

```

\c (database name)

```

5. Finally run the psql commands in the db/migrations directory to create the accounts and peeps table for each database.

## Notes on functionality:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## Roadmap:

There is still more features that can be added to this application. The current application only fulfils the first four user stories.

 <!-- Here is a list of feature that need to be completed in order to fulfil the remaining user stories:

- [ ] Allow users to log in and log out
- [ ] The timestamp for when a post is created should only display time
- [ ] When a user logs in and creates a peep, the name and username should also be displayed within the peep
- [ ] Users can receive emails if they are tagged in peeps
- [ ] Add CSS linksheet to improve the design of the application -->

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

```

```
