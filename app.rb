require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user_repository'
require_relative './lib/post_repository'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/board' do
    @users = UserRepository.new
    @posts = PostRepository.new

    return erb(:board)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.username = params[:username]
    @user.password = params[:password]
    @users = UserRepository.new
    @users.create(@user)

    return erb(:signup_confirmation)
  end
end
