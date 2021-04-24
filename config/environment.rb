require 'bundler'
Bundler.require

configure :development do
  set :database, 'postgresql:db/databse.db'
end
