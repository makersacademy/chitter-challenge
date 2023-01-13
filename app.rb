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
    also_reload 'lib/user_repository'
  end

  get '/posts' do
    repo = PostRepository.new
    @posts = repo.all

    return erb(:posts)
  end

  get '/users' do
    repo = UserRepository.new
    @users = repo.all

    return erb(:users)
  end

  get '/posts/new' do
    return erb(:new_post)
  end

  post '/posts' do
    repo = PostRepository.new
    new_post = Post.new
    new_post.content = params[:content]
    new_post.date = params[:date]
    new_post.time = params[:time]
    new_post.user_id = params[:user_id]
    repo.create(new_post)
  end
end