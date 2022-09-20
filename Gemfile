source "https://rubygems.org"

ruby "3.0.2"

group :test do
  gem "rspec"
  gem "simplecov", require: false
  gem "simplecov-console", require: false
end

group :development, :test do
  gem "rubocop", "1.20"
end

gem "sinatra", "~> 2.2"
gem "sinatra-contrib", "~> 2.2"
gem "webrick", "~> 1.7"
gem "rack-test", "~> 2.0"

gem "sinatra-activerecord", "~> 2.0"
gem "sqlite3", "~> 1.5"
gem "rake", "~> 13.0"

gem "pg", "~> 1.4"

gem "bcrypt"

gem "database_cleaner"

gem "spring-commands-rspec", group: :development
