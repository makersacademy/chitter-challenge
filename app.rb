require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/peep'
require_relative 'lib/user'

# DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  # get '/' do
  #   repo = PeepRepository.new
  #   peeps_list = repo.all_with_username
  #   @peeps = peeps_list.map{ |peep| [peep.username, peep.time, peep.body, peep.tags]}
  #   return erb(:index)
  # end

  get '/' do
    repo = PeepRepository.new
    peeps = repo.all
    # @peep_info = peeps.map{ |peep| [peep.time, peep.body, peep.tags]}
    return erb(:index)
  end
end
