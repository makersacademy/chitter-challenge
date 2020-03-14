require "sinatra/activerecord"
require './spec/setup_database_test'

class ChitterManager < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  configure :development do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'chitter'}
  end

  configure :test do
    set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'chitter_test'}
  end

  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end
