require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  
end