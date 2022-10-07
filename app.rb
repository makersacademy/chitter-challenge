require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/maker_repository'

DatabaseConnection.connect

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/maker_repository'
  end

  get '/' do
    peep_repo = PeepRepository.new
    @maker_repo = MakerRepository.new
    @peeps = peep_repo.all.reverse!
   
    return erb(:index)
  end

end
