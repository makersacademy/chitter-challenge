require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    return erb(:homepage)
  end

  get '/signup' do
    return erb(:create_account)
  end

  get '/peeps' do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all

    @user_repo = UserRepository.new
    
    return erb(:peepboard)
  end

  get '/new' do
    return erb(:create_peep)
  end

end
