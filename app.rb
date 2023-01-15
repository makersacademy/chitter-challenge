require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

$logged_in = false
$logged_in_user = 1

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end

  get '/menu' do
    return erb(:menu)
  end

  get '/posts' do
    repo = PostRepository.new
    @user_repo = UserRepository.new
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
    new_post.user_id = $logged_in_user
    repo.create(new_post)
    return erb(:menu)
  end

  get '/users/new' do
    return erb(:new_user)
  end

  get '/users/login' do
    return erb(:login)
  end

  post '/users' do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo.create(new_user)
    return erb(:menu)
  end

  post '/users/login' do
    repo = UserRepository.new
    @user = User.new
    @username = params[:username]
    @password = params[:password]
    @user = repo.password(@username)
    @id = @user.id

    return erb(:logged_in)
  end

  get '/users/logout' do
    return erb(:log_out)
  end
end