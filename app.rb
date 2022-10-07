require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all.reverse!
    return erb(:index)
  end

end
