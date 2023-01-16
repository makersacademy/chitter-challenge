require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/account_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # # This allows the app code to refresh
  # # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/account_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    return erb(:index)
  end

  get '/peeps' do 
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all

    account_repo = AccountRepository.new



    return erb(:get_peeps)
  end
end