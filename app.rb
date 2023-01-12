# file: app.rb
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repo'
require_relative 'lib/user_repo'

DatabaseConnection.connect

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repo'
    also_reload 'lib/user_repo'
  end

  get '/' do
    @posts = PostRepo.new
    return erb(:index)
  end

  post '/delete_post/:id' do
    @posts = PostRepo.new
    @posts.delete(params[:id])
    return erb(:index)
  end

  post '/delete_user/:id' do
    @users = UserRepo.new
    @users.delete(params[:id])
    @posts = PostRepo.new
    return erb(:index)
  end
end
