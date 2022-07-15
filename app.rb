require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
DatabaseConnection.connect('chitter_db')

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end


  get '/check' do
    return erb(:index)
  end
end
