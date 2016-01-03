source 'https://rubygems.org'
ruby '2.2.3'

group :production, :development do
  gem 'sinatra-base', '~> 1.4'
  gem 'bcrypt', '~> 3.1', '>= 3.1.10'
  gem 'data_mapper', '~> 1.2'
  gem 'dm-postgres-adapter', '~> 1.2'
  gem 'sinatra-flash', '~> 0.3.0'
  gem 'dm-validations', '~> 1.2'
  gem 'dm-types', '~> 1.2', '>= 1.2.2'
  gem 'sinatra-partial', '~> 0.4.0'
end

group :test do
  gem 'rake', '~> 10.4', '>= 10.4.2'
  gem 'capybara'
  gem 'rspec'
  gem 'cucumber'
  gem 'coveralls', require: false
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
end
