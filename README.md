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


Notes:

STEP 1: SETUP
1) Lib- done
2) Config.ru-done
3) Spec with Features-done
4) App.rb-done
5) Views folder -done
6) Gemfile with all the necessary gems and run bundle install

STEP 2: USER STORY 1
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

STEP 3: USER STORY 2
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
  <% @peeps.each do |peep| %>
  <div id="message">
    <li><%= peep.message %></li>
    </div>
  <% end %>
</ul>
3) Implementation of reverse order- peeps.rb
-added ORDER by id DESC
