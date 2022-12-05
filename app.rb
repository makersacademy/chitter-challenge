require 'sinatra/base'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/post_repository'
  end

  get '/' do
    return erb(:sign_up)
  end

  get '/users' do
    repo = UserRepository.new
    @users = repo.all

    erb(:all_users)
  end

  post '/users' do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = params[:username]
    new_user.email = params[:email]
    repo.create(new_user)
    return nil
  end

  get '/users/:id' do
    repo = UserRepository.new
    @users = repo.find(params[:id])
    return erb(:posts)
  end
end

