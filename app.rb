require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  run! if app_file == $0
end