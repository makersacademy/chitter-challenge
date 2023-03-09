require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peeps_repository'
require_relative 'lib/users_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peeps_repository'
    also_reload 'lib/users_repository'
  end

  get '/peeps' do
    repo = PeepsRepository.new
    @peep = repo.all
    return erb(:index)
  end

  get '/peeps/:id' do
    repo = PeepsRepository.new
    user_repo = UsersRepository.new
    @peep = repo.find(params[:id])
    @user = user_repo.find(@peep.user_id)
    return erb(:peep)
  end
end