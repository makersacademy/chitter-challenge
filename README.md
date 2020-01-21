Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
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

Technical Approach:
-----

This week you integrated a database into Bookmark Manager using the `PG` gem and `SQL` queries. You can continue to use this approach when building Chitter Challenge.

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the CSS to make it look good.

Good luck and let the chitter begin!

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!


## Notes:

# STEP 1: SETUP
1) Lib- done
2) Config.ru-done
3) Spec with Features-done
4) App.rb-done
5) Views folder -done
6) Gemfile with all the necessary gems and run bundle install

# STEP 2: USER STORY 1
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
1) PSQL create database and table
CREATE DATABASE chitter;
\c chitter
CREATE TABLE peep(id SERIAL PRIMARY KEY, message VARCHAR(150));

CREATE DATABASE chitter_test
\c chitter
CREATE TABLE peep(id SERIAL PRIMARY KEY, message VARCHAR(150));
Added this to db/migrations
2) CREATE TRUNCATE file
in spec folder- setup_test_database to truncate peep table when connected
to test databases + add to spec helper
3) Feature test
feature 'Posting peep' do
  scenario 'A user can post a peep to Chitter' do
    visit '/peep/new'
    fill_in('message',with: 'Test')
    click_button('Submit')

    expect(page).to have_content 'Test'
  end
end
Error: unable to find field message
4) Add route to app.rb
get '/peep/new' do
  erb :"peep/new"
end
Error: unable to find field message
5) Edit erb peep/new
<form>
  <input type="text" name="message" />
  <input type="submit" value="Submit" />
</form>
6) Make erb peep/new a post since adding data
<form action="/peep" method="post">
  <input type="text" name="message" />
  <input type="submit" value="Submit" />
</form>
7) Add post route to app.rb
post '/peep' do
  message = params['message'] (the message that the user entered)
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peep (messages) VALUES('#{message}')") (insert it into our database- id will be assigned automatically)
  redirect '/peep'
end

get '/peep' do
end
FEATURE TEST PASSES
8) REFRACTORING: APP.rb
-currently we connect to the database via app.rb which goes against MVC
-so we will try to do this through the model instead by making a class method
post '/peep' do
  Peep.create(message: params[:message]
  redirect '/peep'
end
9) Spec test for .create
describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create(message: 'Test')

    expect(peep.message).to eq 'Test'
  end
end
10) Implementation of create & .all as need it for get
def self.create(message:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
    connection.exec("INSERT INTO peep (message) VALUES('#{message}') RETURNING id,message;")
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec("SELECT * from peep")
      result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'])
  end


  11) Update to app. route to include Peep.all and erb: index
  get '/peeps' do
    peeps = Peeps.all
    erb :'peeps/index'
  end

  12) Refractoring adding database_helper
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: "Test")
      persisted_data = persisted_data(id: peep.id)

      expect(peep.message).to eq "Test"
      expect(peep.id).to eq persisted_data['id']
    end
  end
  13) Adding another test for .find
  describe '.all' do
    it 'returns all peeps' do
      Peeps.create(message: "Another Test")
      Peeps.create(message: "Different Test")
      peeps = Peeps.all

    expect(peeps.length).to eq 2
    expect(peeps.first.message). to eq "Another Test"
  end
end
end
14) Refractoring Peeps.rb as currently it connects to the database and manipulates data int he database
-so will extract a Database setup object
-first write spec for it
require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection to the database'
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')

    DatabaseConnection.setup('chitter_test')
  end
end
15) Implementation Database_connection.rb
require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    PG.connect(dbname: dbname)
  end
end
16) will now write database_connection_setup at the root so that database connection is set up right at the beginning
require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end
-require it in app.rb so that it is run when application boots
17) replace in Peep.rb PG connect with DatabaseConnection.query
18) Added spec tests for .query and .connection
19) Implemented code for .query and .connection in database_connection.rb

# STEP 3: USER STORY 2
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
1) Feature test
feature 'See peeps' do
  scenario 'A user can see peeps they posted in reverse order' do
    visit '/peeps/new'
    fill_in('message',with: 'Latest peep')
    click_button('Submit')

    expect(first('#message')).to have_content "Latest peep"
  end
end
2) Implementation- adding id #message to peeps/index.erb
<ul>
  <% peeps.each do |peep| %>
  <div id="message">
    <li><%= peep.message %></li>
    </div>
  <% end %>
</ul>
3) Implementation of reverse order- peeps.rb
-added ORDER by id DESC

# STEP 4: USER STORY 3
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
1) Alter table in PSQL and added to db/migrations
ALTER TABLE peep ADD COLUMN time TIMESTAMP; (for both test and development environments)
3) Irb trying to see how to enter time:
Peeps.new(id: result[0]['id'], message: result[0]['message'],time: result[0]['time'])
 => #<Peeps:0x00007fbd0098e170 @id="73", @message="Hello", @time="2020-01-21 11:15:58">  
 4) Changing Peeps.rb to enter Time.now
 #{Time.now}
 5) Feature test
 feature 'See time of peep creation' do
   scenario 'A user can see the time at which peep was created' do
     visit '/peeps/new'
     fill_in('message',with: '11:38am Peep')
     click_button('Submit')

     expect(first('#message')).to have_content "11:38"
   end
 end
6) Editing index.erb to include Time
<li><%= peep.time %></li>

# STEP 5: USER STORY 4
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
1) PSQL & db/migrations
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(100) UNIQUE, password VARCHAR(100),name VARCHAR(100), username VARCHAR(50) UNIQUE);
2) Update Setup_test_Database to truncate users table as well
connection.exec("TRUNCATE peep, users;")
3) Feature test
feature 'Sign up' do
  scenario 'A user can sign up to Chitter' do
    visit '/users/new'
    fill_in('email',with: 'example@example.com')
    fill_in('password',with: 'example123')
    fill_in('name',with: 'Example Surname')
    fill_in('username',with: 'exampleusername')
    click_button('Submit')

    expect(page).to have_content "Welcome, Example Surname"
  end
end
4) app.rb to implement get route
get '/users/new' do
  erb: 'users/new'
end
5) erb: new
<form action="/users" method="post">
  <input type="email" name="email" />
  <input type="password" name="password" />
  <input type="text" name="name" />
  <input type="text" name="username" />
  <input type="submit" value="Submit" />
</form>
6) app.rb to implement post route
post '/users' do
  User.create(email: params[:email],password: params[:password], name: params[:name], username: params[:username])
  redirect '/peeps'
end
7)user_spec test
require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')

      expect(peep.email).to eq "example@example.com"
      expect(peep.password).to eq "example123"
      expect(peep.name).to eq "Example Surname"
      expect(peep.username).to eq "Example Username"
    end
  end
8) implementation of User class
class User
  def self.create(email:,password:,name:,username:)
    result = DatabaseConnection.query("INSERT into users (email,password,name,username)
    VALUES ('#{email}', '#{password}','#{name}','#{username}') RETURNING email, password, name, username;")
    User.new(email: result[0]['email'],password: result[0]['password'],name: result[0]['name'],username: result[0]['username'])
  end

  attr_reader :email, :password, :name, :username
  def initialize(email:,password:,name:,username:)
    email = email
    password = password
    name = name
    username = username
  end
end
9) editing index to include welcoming the user
<% if user %>
<h1> Welcome, <%= user.name %> </h1>
<% end %>
10) But to use instance variable user need to create instance variable user in get /peep do
so will create a method called .find which finds the user given an id and use session to pass
over id from post to get
-spec test for .find
describe '.find' do
it 'finds a user' do
  user = User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')
  found_user = User.find(id: user.id )

  expect(found_user.id).to eq user.id
  expect(found_user.name).to eq user.name
end
end
11) Implementing .find in User.rb
def self.find(id:)
  return nil unless id
  result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
  User.new(
    id: result[0]['id'],
    email: result[0]['email'],
    password: result[0]['password'],
    name: result[0]['name'],
    username: result[0]['username'])
end
12) Adding a guard clause
added return nil unless id (in .find since tests were failing)
13) Refactoring to secure the password
added 'bcrypt' to gem
14) Update user_spec to include bcrypt
describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')

    expect(user.email).to eq "example@example.com"
    expect(user.password).to eq "example123"
    expect(user.name).to eq "Example Surname"
    expect(user.username).to eq "exampleusername"
  end

  it 'hides the password using bcrypt' do
    expect(BCrypt::Password).to receive(:create).with('example123')
    User.create(email: 'example@example.com',password: 'example123',name: 'Example Surname', username: 'exampleusername')
end
15) Update user.rb with bcrypt
def self.create(email:, password:, name:, username:)
  encrypted_password = BCrypt::Password.create(password)
  result = DatabaseConnection.query("INSERT into users (email,password,name,username)
  VALUES ('#{email}', '#{encrypted_password}','#{name}','#{username}') RETURNING id, email, password, name, username;")
  User.new(id: result[0]['id'],email: result[0]['email'],password: result[0]['password'],name: result[0]['name'],username: result[0]['username'])
end
