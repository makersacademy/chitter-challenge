require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
  end

  get '/' do
    repo = PostRepository.new
    @posts = repo.all.sort_by!(&:time).reverse!

    return erb(:index)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do 
    @username = params[:username]
    repo = UserRepository.new
    new_user = User.new
    new_user.name = params[:name]
    new_user.email = params[:email]
    new_user.password = params[:password]
    new_user.username = @username
    repo.create(new_user)
  
    return erb(:signup_complete)
  end
end
