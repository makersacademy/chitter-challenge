require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'database_connection_setup'
require './lib/user'


class ChitterApp < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end


