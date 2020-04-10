# Seting up Sinatra

1. Add gem in gemfile
2. Update app.rb to require sinatra

```
# in gemfile

  gem 'capybara'


# in spec/spec_helper.rb

  require 'sinatra'


# in app.rb

  require 'sinatra/base'

  class Chitter < Sinatra::Base

  end



```