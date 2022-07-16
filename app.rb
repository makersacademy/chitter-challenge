require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = UserRepository.new
    # First page: give the form to sign in
    return erb(:index)
  end
  
end