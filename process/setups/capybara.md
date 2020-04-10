# Setup Capybara

1. Add Capybara to Gemfile
2. Update spec_helper to require Capybara
3. Create controller file 'app.rb'
4. Create Chitter class
5. Update spec_helper to recognises app.rb and Chitter as a Capybara app

```
# in gemfile

  gem 'capybara'


# in spec/spec_helper.rb

  require 'capybara'
  require 'capybara/rspec'

  require File.join(File.dirname(__FILE__), '..', 'app.rb')
  Capybara.app = Chitter


# in app.rb

  class Chitter

  end


```