# Introduction
Welcome to the code review for the Chitter Challenge!  Again, don't worry - you are not expected to have all the answers. The following is a code-review scaffold for Chitter Challenge that you can follow if you want to.  These are common issues to look out for in this challenge - but you may decide to take your own route.

If you don't feel comfortable giving technical feedback at this stage, try going through this guide with your reviewee and review the code together.

Please use this form to tick off where your reviewee has successfully has successfully incorporated these guidelines!  This form helps us get an overall picture of how the whole cohort is doing - it's not an assessment of an individual student.

# Step 0: Checkout and Run tests

Please checkout your reviewee's code and run their tests. Read the code and try and use the app through the web interface.  You can also experiment with the engine in IRB. How easy is it to understand the structure of their code? How readable is their code? Did you need to make any cognitive leaps to 'get it'?

# Step 0.5?  How far did they get?

* stage 1
* stage 2
* stage 3?

general comments here if you want to skip the following????

# Step 1: Structure and supporting files

## Installation Instructions in README

Particularly now that we have a database involved, it becomes even more important to ensure that correct installation instructions are included in your readme so that other developers (and yourself in the future) know how to get set up with the application:

```
TODO example
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

## Read Over Your Pull Request Before Submitting

The final process should be reading the created pull request and making changes that are seen before sending it to us, as otherwise we waste time going over indentation, dead code in comments, and unnecessary files ++++

For example if you've been using the launchy gem to `save_and_open_page` then you'll have a load of `capybara-<TIMESTAMP>.html` files in your root directory that you don't want committed to git.  Try updating .gitignore like so:

```
capybara-*.html
```

## Ensure Rakefile has appropriate tasks +

For migration and upgrade

## Gemfile should use test groups

ensure test related stuff in test group, e.g. capybara etc.

TODO - actually does this work with sinatra based on RACK_ENV or is it Rails only?

## Ensure spec_helper configured correctly

Pull in a single app file that pulls in all the other dependencies required by the app.  Don't pull in the models etc. separately or you risk having the tests pass when the app might be missing a dependency.

## Factory Girl

What's our position on this?  Do we encourage it's use?  Should we prefer doubles?  Only use it for feature tests?

## Set up database cleaner correctly

We should have a set up like this:

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

## Ensure separate data_mapper setup

All data_mapper setup should be in a separate file and make sure that we're properly adapting to the RACK_ENV environment variable, and ready for Heroku to override with a production db URL:

* Good
```
env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
```

In particular you want to avoid database security tokens in data_mapper setup

* Not good
```ruby
DataMapper.setup(:default, ENV['DATABASE_URL'] ||= 'postgres://qsr
  cwyyergqzvs:dQB7uYe3NCJ7-p_-7iMpTP_SzH@ec2-54-163-228-109.comput
  e-1.amazonaws.com:5432/d7khun32k78jic')
```

Also avoid directly setting the DATABASE_URL like so:

```ruby
ENV['DATABASE_URL'] = 'postgres://localhost/chitter_test'
DataMapper.setup(:default, ENV['DATABASE_URL'])
```

# Step 2: Tests and \*\_spec.rb files  

## \*\_spec.rb files (unit tests)

### RSpec features scenarios

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


### location of feature/acceptance and unit tests

Ensure that all your acceptance tests are in a separate folder called `features`.  This can be in your `spec` folder or on the root; up to you.

If a test is in the feature folder it should be testing the entire stack, i.e. it should interact with the app via a web page, and then test the results of that action in the web page that gets returned.  It's acceptable to manipulate the database directly to set things up, but note their are risks associated here, i.e. that you will get your database in a state that it couldn't get into via the web interface, and thus when the tests pass it may not reflect precisely the user experience of using the site.

Conversely if you are testing your models, with or without database interactions, then these tests should NOT be in your feature folder and should be in the `spec` folder, or in `spec/models`

### need unit tests for datamapper

I think we should encourage the use of a [shoulda](https://github.com/thoughtbot/shoulda-matchers) style syntax for datamapper:

https://github.com/greyblake/dm-rspec

But I realise that this might not be popular - but I think it's an important part of following the acceptance test, unit test cycle ...

Maybe this should be part of moving to something like:

* https://github.com/jeremyevans/sequel
* https://github.com/kematzy/minitest-sequel
* https://github.com/openhood/rspec_sequel_matchers



### Appropriate use of Spec Helpers (and factory girl?)

```ruby
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
module Helpers

  def sign_in(user)
    visit('/sessions/new')
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
  end
```

https://gist.github.com/ptolemybarnes/2dfda607b85d01e113b0 <-- turn into a pill?


## Ensure asset routes are set correctly

Do we like http://recipes.sinatrarb.com/p/asset_management/sinatra_assetpack ?

Or should we just be telling them to set the public folder correctly

```ruby
set :public_folder, Proc.new { File.join(root, 'static') }
```

and for Heroku:

* http://abernardes.github.io/2014/10/24/static-assets-with-rack.html
* http://stackoverflow.com/a/5509152/316729

add the following to config.ru

```ruby
use Rack::Static, :urls => ['/stylesheets', '/javascripts'], :root => 'public'
```

# Step 3: Application code and \*.rb files

TODO are we expecting full password reset functionality?

## Controllers

### Prefer Sinatra::Application + (what do we prefer?)

TODO research this

### Be clear about how to use flash.now

Have to register Sinatra Flash before using. Have to use

```
flash.next[:notice]
```

and not

```
flash.now[:notice]
```

in order to see the message after the redirect.

### Fefactor long controller methods

This overly long controller method with business logic spread spread out throughout the method is not ideal.

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

It could be refactored like so:

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
```

Note the much shorter method and the business logic all pulled into the User model.

### Split routes into a controller file/many controller files +

Rather than

```ruby
class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

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
require 'controllers/peep_controller'

class Chitter < Sinatra::Base
  include PeepController
end

# controllers/peep_controller.rb
module PeepController
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
```


## Models

### Not encapsulating business logic in the model

see 'refactor long controller methods' above where business logic is pulled from controller into User model

## Views

### Correct semantics for form mark up

Specifically use a for attribute in labels as per (mozilla's guide)[https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/How_to_structure_an_HTML_form]:

```html
<form action='/peeps' method='post'>
Message
  <label for='message'>
    <input type='text' name='message' required>
  </label>
  <button type='submit'>Create Peep</button>
</form>
```

### avoid divs ?

TODO check with SamM

Should we be avoiding excessive use of divs?  What's the best rule of thumb here?

### Appropriate use of partials and other HTML conventions

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


## View Helpers

Avoid the following in your app file:

```ruby
class Chitter < Sinatra::Base
  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
end
```

Prefer that pulled out to a helpers file like so

```ruby
require_relative 'helpers'

class Chitter < Sinatra::Base
  include Helpers
end

# app/helpers.rb
module Helpers
  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
end
```
