# My web application design recipe

## Project setup

```bash
rvm get stable
rvm use ruby --latest --install --default
gem install bundler
bundle init
bundle add rspec
rspec --init
mkdir lib

# Database local setup
bundle add pg
touch lib/database_connection.rb

# Add the sinatra library, the webrick gem, and rack-test
bundle add sinatra sinatra-contrib webrick rack-test

# Create the main application file
touch app.rb

# Create the app_spec.rb integration tests file
mkdir spec/integration
touch spec/integration/app_spec.rb

# Create the config.ru file
touch config.ru
```
### DatabaseConnection class

```ruby
  # file: lib/database_connection.rb
  require 'pg'
  # This class is a thin "wrapper" around the
  # PG library. We'll use it in our project to interact
  # with the database using SQL.
  class DatabaseConnection
    # This method connects to PostgreSQL using the 
    # PG gem. We connect to 127.0.0.1, and select
    # the database name given in argument.
    def self.connect(database_name)
      @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
    end
    # This method executes an SQL query 
    # on the database, providing some optional parameters
    # (you will learn a bit later about when to provide these parameters).
    def self.exec_params(query, params)
      if @connection.nil?
        raise 'DatabaseConnection.exec_params: Cannot run a SQL query as the connection to'\
        'the database was never opened. Did you make sure to call first the method '\
        '`DatabaseConnection.connect` in your app.rb file (or in your tests spec_helper.rb)?'
      end
      @connection.exec_params(query, params)
    end
  end
```
### Add connect method to the spec/helper.rb

```ruby
  # file: spec/spec_helper.rb

  require 'database_connection'

  # Make sure this connects to your test database
  # (its name should end with '_test')
  DatabaseConnection.connect('your_database_name_test')
```

## 1. Design and create the Table

### Extract nouns from the user stories or specification

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

```
(nouns)

email, password, username, 
content, user_id, title, tags, date
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Users                 | Messages            |
| --------------------- | ------------------  |
| Email                 | Title, Content, 
| Password              | Tags, Date
| Username              | User_id

1. Name of the first table (always plural): `users` 

    Column names: `username`, `password`, `email`

2. Name of the second table (always plural): `messages` 

    Column names: `title`, `content`, `date`, `tags`, `user_id`

## 3. Decide the column types.

```
Table: users
id: SERIAL
email: text
password: text
username: text

Table: messages
id: SERIAL
title: text
content: text
date: date
tags: text
user_id: int

```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one ITEMS have many ORDERS? (Yes)
2. Can one ORDERS have many ITEMS? (No)

You'll then be able to say that:

1. **[USERS] has many [MESSAGES]**
2. And on the other side, **[MESSAGES] belongs to [USERS]**
3. In that case, the foreign key is in the table [MESSAGES]

Replace the relevant bits in this example with your own:

## 4. Write the SQL.

```sql
-- file: seeds_chitter_challenge.sql
-- Replace the table name, columm names and types.
-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  username text
);

-- Then the table with the foreign key first.
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  date date,
  tags text,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user_id foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
1 createdb chitter_challenge
2 createdb chitter_challenge_test
```

```bash
psql -h 127.0.0.1 chitter_challenge < seeds_chitter_challenge.sql
psql -h 127.0.0.1 chitter_challenge_test < seeds_chitter_challenge.sql
```

## Make test Database for spec file

Test Database Name: seeds_chitter_challenge_test.sql

```sql

--# table names: 'users'
TRUNCATE TABLE users RESTART IDENTITY CASCADE; 

--cannot truncate a table referenced in a foreign key constraint-- Solution is to as (CASCADE)

INSERT INTO users (email, passwordabc, username) VALUES ('chris_@hotmail.com', '1234567890', 'toppy');
INSERT INTO users (email, password, username) VALUES ('sunny_@gmail.com', '0987654321abc', 'sunny');

-- table names: 'messages'
TRUNCATE TABLE messages RESTART IDENTITY; 

INSERT INTO messages (
    title, 
    content, 
    date,
    tag, 
    user_id
    ) 
VALUES (
    'paired programming', 
    'learning to pair program',
    '08-Jan-1999',
    'sunny',
    1
    );

INSERT INTO messages (
    title, 
    content, 
    date,
    tag, 
    user_id
    ) 
VALUES (
    'TDD learning', 
    'methods to writing a program',
    '08-Jan-2023',
    'chris',
    2
    );
```
## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end
```
```ruby
Table name: messages

# Model class
# (in lib/message.rb)
class Message
end

# Repository class
# (in lib/message_repository.rb)
class MessageRepository
end
```
## 4. Implement the Model class

```ruby
Table name: users

# Model class
# (in lib/user.rb)
class User
  attr_accessor :id, :email, :password, :username
end

Table name: messages

# Model class
# (in lib/message.rb)
class Message
  attr_accessor :id, :title, :content, :date, :tags, :user_id
end
```

## 5. Define the Repository Class interface

#REPEAT BASE ON TABLES MAIN PROGRAM WANTS TO EQUIRY DATA!!!

number of tables 2 (users) & (messages)

```ruby
Table name: user
# Repository class
# (in lib/user_repository.rb)
class UserRepository
  def all
    sql = 'SELECT id, email, password, username FROM users;'
    result = DatabaseConnection.exec_params(sql,[])
  end

  def find(id)
    sql = 'SELECT id, email, password, username FROM WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
  end

  def create(user)
    sql = 'INSERT INTO users (email, password, username) VALUES ($1, $2, $3);'
    params = [use.email, user.password, user.username]
    result = DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE (id = $1);'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
  end

  def update(update)
    sql = 'UPDATE user SET (username = $1) WHERE (id = $2);'
    params = [update.username, update.id]
    result = DatabaseConnection.exec_pramas(sql, params)
  end
end
```

## 6. Write Test Examples 

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

REPEAT BASE ON TABLES MAIN PROGRAM WANTS TO EQUIRY DATA!!!

number of tables 2 (users) & (messages)


```ruby
# (in spec/user_repository_spec.rb)
# (in spec/message_repository_spec.rb)

# 1 def all
repo = UserRepository.new
user = repo.all

user.length # => 2
user[0].id # => 1
user[0].email # => chris_@hotmail.com 
user[0].password # => 1234567890abc
user[0].username # => toppy

# 2 def create
repo = UserRepository.new

new_user = User.new
new_user.email = 'andy_@gamil.com'
new_user.password = '1111abcde' 
new_user.username = 'andy'

repo.create(item)
added_user = repo.all

added_user.last.email # => andy_@gmail.com
added_user.last.username # => 'andy'

item
```
## 7. Reload the SQL seeds before each test run

# REPEAT BASE ON TABLES MAIN PROGRAM WANTS TO EQUIRY DATA!!!

number of tables 2 (items) & (orders)

```ruby

# file: spec/user_repository_spec.rb

def reset_order_table
    seed_sql = File.read('spec/seeds_chitter_challenge_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
end
  
describe OrderRepository do
    before(:each) do 
        reset_order_table
    end
end
  # (your tests will go here).
end
```

## Setup app.rb file.

```ruby
require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
end
```

## Setup config.ru

```ru
# file: config.ru
require './app'
run Application
```

## Starting the server.

```bash rackup ```

viewable in the web browser at the following address ```bash http://localhost:9292 ```

## Sinatra application

Here is an example of a minimal Sinatra application, configuring a single route:

```ruby
# file: app.rb
require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  get '/' do
    # The code here is executed when a request is received and we need to 
    # send a response. 

    # We can return a string which will be used as the response content.
    # Unless specified, the response status code will be 200 (OK).
    return 'Some response data'
  end
end
```

## "route" or "route block".

The Ruby block between the do and end associated with a method and path is called a "route" or "route block". The code in this block is executed only is the received request matches the method and path.

```ruby
# Let's look at an example where Flask receives this request:
# GET /

# There are a number of routes. We'll look through each one in turn and see if
# it matches.

class Application < Sinatra::Base 
  # ...

  post '/' do
    # This route is not executed (the method doesn't match).
  end

  get '/hello' do
    # This route is not executed (the path doesn't match).    
  end

  get '/' do
    # This route matches! The code inside the block will be executed now.
  end

  get '/' do
    # This route matches too, but will not be executed.
    # Only the first one matching (above) is.
  end
end
```

## Demo GET & POST request

```ruby

# http://localhost:9292/hello?name=chris

  get '/hello' do
    name = params[:name] # The value is 'David'
  
    # Do something with `name`...
    return "Hello #{name}"
  end

# http://localhost:9292/submit

  post '/submit' do
    name = params[:name] # The value is 'David'
    message = params[:message]
    # Do something with `name`...
    return "Hello #{name} you just sent the message #{message}"
  end
```

## RSpec writen exaples

-- Request:

GET /names?name=Chris

-- Expected response:

Response for 404 Not Found
body = Hello Chris

## Test-Drive a GET & POST request.

We can create integration tests for our routes using RSpec. Here's an example:

```ruby
# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Some response data")
    end
  end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", name: "Dana", some_other_param: 12)

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Dana")
    end
  end
end
```