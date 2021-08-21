require 'dotenv/load'
require 'sinatra'

ENV['RACK_ENV'] = 'test'

configure :development do
  set :database, {
    adapter: 'postgresql', encoding: 'unicode',
    database: ENV['DB_TEST'], pool: 2, username: ENV['DB_USER_TEST'],
    password: ENV['DB_PASSWORD_TEST']
  }
end

configure :production do
  set :database, {
    adapter: 'postgresql', encoding: 'unicode', database: ENV['DB_PRODUCTION'],
    pool: 2, username: ENV['DB_USER_PRODUCTION'],
    password: ENV['DB_PASSWORD_PRODUCTION']
  }
end

class Chitter < Sinatra::Base
  enable :sessions
  set :method_override, true

  get '/' do
    'Hello World!'
  end

  run! if app_file == $0
end
