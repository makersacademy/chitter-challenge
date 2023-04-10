require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
# require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    # also_reload 'lib/user_repository'
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:homepage)
  end

end
