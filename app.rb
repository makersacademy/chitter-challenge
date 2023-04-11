require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    user_repo = UserRepository.new
    peep_repo = PeepRepository.new
    peeps = peep_repo.all

    @complete_peep_info = []

    peeps.each do |peep|
      user = user_repo.find(peep.user_id)
      peep_info = {peep: peep, name: user.name, username: user.username}
      @complete_peep_info << peep_info
    end

    return erb(:index)
  end

  get '/login' do
    return erb(:login)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = UserRepository.new
    new_user = User.new

    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    repo.create(new_user)

    return erb(:signup_success)
  end
end
