require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository' 

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  get '/' do
    repo = PeepRepository.new
    # repo2 = UserRepository.new
    @peeps = repo.all
    # @users = repo2.all
    return erb(:home)
  end


end

