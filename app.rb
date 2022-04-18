require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
#require 'sinatra/activerecord'

#set :database_file, '/config/database.yml'

class Chitter < Sinatra::Base
  #register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end




