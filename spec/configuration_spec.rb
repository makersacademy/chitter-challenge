require "rspec/expectations"

# Bundler.require(:testing)

RSpec.configure do |config|

    DatabaseCleaner.strategy = :truncation
    
    config.after(:all) do 
        DatabaseCleaner.clean
    end
end 

# https://medium.com/@amliving/my-rails-rspec-set-up-6451269847f9