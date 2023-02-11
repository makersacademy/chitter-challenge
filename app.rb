require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/maker_repository'
require_relative 'lib/peep'
require_relative 'lib/maker'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository' #code copied - may need functionality check
    also_reload 'lib/maker_repository' #code copied - may require functionality check
  end


  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
      
    return erb(:peeps_all)
end



end

