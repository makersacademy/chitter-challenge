require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all

    user_repo = UserRepository.new
    @peeps.each { |peep| peep.user = user_repo.find(peep.user_id) }

    erb(:index)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  get '/new-peep' do
    erb(:new_peep)
  end
end
