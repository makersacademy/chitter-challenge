require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = UserRepository.new
    # First page: give the form to sign in
    return erb(:index)
  end
  
  post '/signup' do
    repo = UserRepository.new
    new_user = User.new
    new_user.id = params[:id]
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo.create(new_user)
    return erb(:post_signup)
  end
end
    