require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # need to show peeps on the homepage
    repo = PeepRepository.new
    @peeps = repo.all

    return erb(:homepage)
  end

  get '/register' do
    return erb(:register)

  end

end
