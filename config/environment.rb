require 'bundler'
Bundler.require

require 'sinatra'

configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode', 
    database: 'chitter_development', 
    # pool: 2, 
    # username: 'your_username', 
    # password: 'your_password'
  }

  set :show_exceptions, true
end

configure :production do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode', 
    database: 'chitter_production', 
    # pool: 2, 
    # username: 'your_username', 
    # password: 'your_password'
  }
end
