# Introduction

Welcome to the code review for the Chitter Challenge!  Again, don't worry - you are not expected to have all the answers. The following is a code-review scaffold for Chitter Challenge that you can follow if you want to.  These are common issues to look out for in this challenge - but you may decide to take your own route.  

Either way we'd very much appreciate you submitting the form, even if it's just to say that you didn't use it :-)

Please use this [form](http://goo.gl/forms/0tgr6Q9Xh8) to tick off where your reviewee has successfully incorporated these guidelines!  This form helps us get an overall picture of how the whole cohort is doing - it's not an assessment of an individual student.

# Step 0: Checkout and Run tests

Please checkout your reviewee's code and run their tests. Read the code and try and use the app through the web interface.  You can also experiment with the engine in IRB. How easy is it to understand the structure of their code? How readable is their code? Did you need to make any cognitive leaps to 'get it'?

# Step 1:  How far did they get?

* Features
  * [ ] Sign up
  * [ ] Log in
  * [ ] Log out
  * [ ] Peeping
  * [ ] Listing Peeps
  * [ ] Display time of peep

* Bonus Features
  * [ ] Replying to peeps
  * [ ] CSS styling

The relevance of the subsequent steps may depend on how far the reviewee got with their challenge.

# Step 2: Structure and Supporting files

## Installation Instructions should be in README

Particularly now that we have a database involved, it becomes even more important to ensure that correct installation instructions are included in your readme so that other developers (and yourself in the future) know how to get set up with the application, e.g.

```
$ git clone https://github.com/tansaku/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

And as we saw in previous weeks you'll want to have screenshots of how the app works, or perhaps even a link to the deployed version on heroku?

For more info on embedding images in a README: https://guides.github.com/features/mastering-markdown/

e.g.:
```
![Screenshot](https://path_to_your_image)
```

You will need to host your images somewhere, e.g.:
* http://imgur.com/
* http://dropbox.com/

## Unnecessary Components should be Removed

Always leave a space to check over your pull request before submission.  Please try to check for simple issues like:

* dead code in comments
* unnecessary files
* indentation

For example if you've been using the [launchy gem](https://github.com/copiousfreetime/launchy) to `save_and_open_page` then you'll have a load of `capybara-<TIMESTAMP>.html` files in your root directory that you don't want committed to git.  Try updating `.gitignore` like so:


```
capybara-*.html
```

and if you already have unwanted files committed to git then delete them from git:

```
$ git rm capybara-*.html
```

then commit and push.  Please also ensure you follow the Ruby style guide regarding indentation and layout:

https://github.com/bbatsov/ruby-style-guide

## Ensure Rakefile has Appropriate Tasks

For migration and upgrade

```ruby
require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end
```

Clearly these tasks can be run directly from an irb console, but the Rakefile makes it simpler to run common tasks as part of deployment to Heroku and Continuous Integration (C.I.) and other situations where your code runs remotely.

## Gemfile should Use Test Groups

Ensure that all test related gems are in test group, e.g. capybara etc.

```ruby
source 'https://rubygems.org'

ruby '2.4.0'

gem 'sinatra'
gem 'sinatra-flash'
gem 'bcrypt'
gem 'data_mapper'
gem 'dm-postgres-adapter'

group :test do
  gem 'rspec'
  gem 'cucumber'
  gem 'rubocop-rspec'
  gem 'rubocop'
  gem 'coveralls', require: false
  gem 'rspec-sinatra'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
end
```

See http://bundler.io/groups.html for more details

## Ensure spec_helper.rb is Configured Correctly

Make sure that your spec_helper pulls in a single app file that requires all the other dependencies required by the app.  Don't pull in the models etc. separately in the spec helper or you risk having the tests pass when the app might be missing a dependency.

Also watch out for spec helpers vs sinatra helpers. They are two very different things.  Don't pull your Sinatra helpers into your RSpec config:

```
RSpec.configure do |config|

  config.include Capybara::DSL # good
  config.include FactoryGirl::Syntax::Methods # sure
  config.include TestHelpers # good
  config.include ChitterHelpers # nooooooooooo

end
```

## Set up Database Cleaner Correctly

Set up like so:

```ruby
  config.before(:suite) do # <-- before entire test run
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do # <-- create a "save point" before each test
    DatabaseCleaner.start
  end

  config.after(:each) do # <-- after each individual test roll back to "save point"
    DatabaseCleaner.clean
  end
```

then we are doing a thorough clean of the entire database before we startup (with a truncation, which does a quick remove of all rows), and then we are doing a slightly more complex transaction on each individual test where we roll back just the things that happened in that particular test ...

related links:

* https://github.com/DatabaseCleaner/database_cleaner#how-to-use
* http://stackoverflow.com/a/10906127/316729

## Ensure Separate DataMapper setup file

All DataMapper setup should be in a separate file and make sure that we're properly adapting to the RACK_ENV environment variable, and ready for Heroku to override with a production db URL:

* Good
```
env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
```

In particular you want to avoid database security tokens in data_mapper setup

* Not good
```ruby
DataMapper.setup(:default, ENV['DATABASE_URL'] ||= 'postgres://qsr
  cwyasdfvs:dQB7uYe3NCJ7-p_123e-_-P_SzH@ec2-54-163-228-109.comput
  e-1.amazonaws.com:5432/d7khun32k78jic')
```

Also avoid directly setting the DATABASE_URL like so:

```ruby
ENV['DATABASE_URL'] = 'postgres://localhost/chitter_test'
DataMapper.setup(:default, ENV['DATABASE_URL'])
```
## Ensure Asset Routes are Set Correctly

Set the public folder correctly like so

```ruby
set :public_folder, Proc.new { File.join(root, 'static') }
```

To make sure that your web page will be able to load static assets such as CSS, Images, etc.

# Step 3: Tests and \*\_spec.rb files  

## Avoid RSpec Feature Scenarios organized like Unit Tests

Ensure your feature tests look like feature tests, not unit tests.  Unit tests should have only one expect per it block.  Feature test scenarios can have more than one expect; and should have in order to improve comprehensibility and to avoid excessive running times, but don't go crazy.

* good

```ruby
scenario 'Can create peeps after sign up'  do
  sign_up_and_create_peep('Test text')
  expect(current_path).to eq '/peeps'
  expect(page.status_code).to eq 200

  within 'ul#peeps' do
    expect(page).to have_content('Test text')
  end
end
```

* not so good

```ruby
scenario 'Current path is correct after signing up and peeping'  do
  sign_up_and_create_peep('Test text')
  expect(current_path).to eq '/peeps'
end

scenario 'Status code is correct after signing up and peeping'  do
  sign_up_and_create_peep('Test text')
  expect(page.status_code).to eq 200
end

scenario 'Peep is shown after signing up and peeping'  do
  sign_up_and_create_peep('Test text')
  within 'ul#peeps' do
    expect(page).to have_content('Test text')
  end
end
```


## Ensure Correct Location of Feature/Acceptance and Unit Tests

All your acceptance tests should be in a separate folder called `features`.  This can be in your `spec` folder or on the root; up to you.  It depends if you want the convenience of running units and features together or the convenience of being able to run them separately (helpful if feature tests run very slowly).

If a test is in the feature folder it should be testing the entire stack, i.e. it should interact with the app via a web page, and then test the results of that action in the web page that gets returned.  It's acceptable to manipulate the database directly to set things up, but note their are risks associated here, i.e. that you will get your database in a state that it couldn't get into via the web interface, then when the tests pass it may not reflect precisely the user experience of using the site.

Conversely if you are testing your models, with or without database interactions, then these tests should NOT be in your feature folder and should be in the `spec` folder, or in `spec/models`

## Use Spec 'Helpers' Appropriately

Extract Spec 'Helpers' into a module and include like so:

```ruby
require_relative 'helpers'

feature "User sign up" do
  include Helpers
  let(:user) { user = build(:user) }

  scenario 'with correct credentials' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content("Welcome, #{user.email}")
  end
end
```

```ruby
# spec/helpers.rb
module Helpers

  def sign_in(user)
    visit('/sessions/new')
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
  end
```

See https://github.com/makersacademy/course/blob/master/pills/spec_helper_methods.md

# Step 4: Application code and \*.rb files

## Controllers

### Prefer Modular over Classic Style

* http://www.sinatrarb.com/intro.html#Modular%20vs.%20Classic%20Style

### Use flash.now and flash.next Correctly

Note that you have to register Sinatra Flash before you can use it.

Also be careful of the difference between `next` and `now` methods.  Use

```
flash.next[:notice]
```
to see the message after a redirect, and

```
flash.now[:notice]
```

to only see it immediately.

### Refactor Long Controller Methods

This overly long controller method with business logic spread spread out throughout the method is not ideal:

```ruby
post '/password_reset' do
  user = User.first(email: params[:email])
  if user
    user.reset_password
    user.save
    flash[:info] = 'Check your emails'
    redirect('/')
  else
    flash[:info] = 'No such account on record'
    redirect('/password_reset')
  end
end
```

It could be refactored by adding a class method to User called `User.reset_password` and pulls the business logic into the User object like so:

```ruby
post '/password_reset' do
  if User.reset_password(email: params[:email])
    flash[:info] = 'Check your emails'
    redirect('/')
  else
    flash[:info] = 'No such account on record'
    redirect('/password_reset')
  end
end

# models/user.rb
class User

  def self.reset_password(email:)
    user = User.first(email: params[:email])
    return false unless user
    user.generate_password_token
    user.save
  end

  ...
end
```

Note the much shorter method and the business logic all pulled into the User model.

### Split Routes into Separate Controller files

Rather than:

```ruby
# app.rb
class Chitter < Sinatra::Application
  set :public_folder, Proc.new { File.join(root, 'static') }

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
```

prefer

```ruby
# app.rb
require 'controllers/application_controller'
require 'controllers/peep_controller'

# controllers/application_controller.rb
class Chitter < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, 'static') }
end

# controllers/peep_controller.rb
class PeepController < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end

# and other controllers for other collections of routes
```

## Views

### Correct Semantics for Form MarkUp

Specifically use a for attribute in labels as per [mozilla's guide](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/How_to_structure_an_HTML_form):

```html
<form action='/peeps' method='post'>
Message
  <label for='message'>
    <input type='text' name='message' required>
  </label>
  <button type='submit'>Create Peep</button>
</form>
```

but please follow the HTML styles described in https://developer.mozilla.org/en-US/docs/Web/Guide/HTML in general.

Related Resources:

* https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/My_first_HTML_form

### Prefer other Semantic HTML Elements to Divs Where Possible

It's tempting to wrap everything HTML5 in a div.  However we should try to make use of other semantic HTML elements where possible.  Try using this [flowchart](http://html5doctor.com/downloads/h5d-sectioning-flowchart.png).  This flowchart should help us choose item 2 from the following list

* 1. Pure Div

```html
<div class='peep'>
</div>
```

* 2. Article (HTML5 recommended)

```html
<article class='peep'>
</article>
```

* 3. Creating your own HTML5 element (avoid unless really required)

```html
<peep>
</peep>
```

Related links:

* http://html5doctor.com/lets-talk-about-semantics/
* http://learn.shayhowe.com/advanced-html-css/semantics-accessibility/ ?
* http://www.w3schools.com/html/html5_semantic_elements.asp


### Use Partials with Standard HTML Conventions

Let's take a look at a mixed bag example that does partials but also breaks some conventions:

```html
<link rel="stylesheet" type="text/css" href="../../../public/style.css" />

<%= erb :'/partials/favicon'%>

<head>
  <title>Welcome to Chitter</title>
</head>

<body>
  <div class="flash_header">
    <%= erb :'/partials/flash_messages' %>
  </div>
</body>
<%= yield %>
```

```html
<!-- '/partials/favicon.erb -->
<link rel="icon" href="public/favicon.ico" type="image/x-icon" />
```

```html
<!-- '/partials/flash_messages.erb -->
<% if flash[:peep_confirmation] %>
  <%= flash[:peep_confirmation] %>
<% end %>

<% if flash[:no_peepy] %>
  <%= flash[:no_peepy] %>
<% end %>

<% if flash[:password_reset_sent] %>
  <%= flash[:password_reset_sent] %>
<% end %>

...
```

a partial for the favicon in the above code seems excessive.  The style sheet ref shouldn't be relative if the public root is being set correctly, and notice that the yield is outside the html body element, and the top level html settings are missing.  Extracting flash_messages to partial okay, but how often will that actually be re-used?  It's justified here because the the flash messages partial is so long, but that's partly because the partial itself is unDRY - it should use flash[:error] and flash[:notice] rather than a separate symbol for every kind of message.


## Use View Helpers

Avoid the following in your app file:

```ruby
class Chitter < Sinatra::Base
  helpers do
    def current_user
      @user ||=  User.get(session[:user_id])
    end
  end
end
```

Prefer that pulled out to a view helpers file like so

```ruby
require_relative 'helpers'

class Chitter < Sinatra::Base
  helpers Helpers
end

# app/helpers.rb
module Helpers
  def current_user
    @user ||=  User.get(session[:user_id])
  end
end
```
