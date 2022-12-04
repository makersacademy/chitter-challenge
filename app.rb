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

  get '/' do
    repo = PostRepository.new
    @user = UserRepository.new
    @posts = repo.all
    return erb(:index)
  end

  get '/user/:user_id' do
    repo = PostRepository.new
    user = UserRepository.new
    @posts = repo.find_by_user_id(params[:user_id])
    @user_name = user.find(@posts[0].user_id).name

    return erb(:posts)
  end

  post '/users' do 
    if invalid_users_parameters?
      status 400
      return ''
    end
    repo = UserRepository.new
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]
    new_user.name = params[:name]
    new_user.username = params[:username]

    repo.create(new_user)

    return ''
  end

  get '/users/new' do
    return erb(:new_user)
  end

  post '/posts' do 
    if invalid_posts_parameters?
      status 400
      return ''
    end
    repo = PostRepository.new
    new_post = Post.new
    new_post.title = params[:title]
    new_post.content = params[:content]
    new_post.create_at = params[:create_at]
    new_post.user_id = params[:user_id]

    repo.create(new_post)

    return ''
  end

  get '/posts/new' do
    return erb(:new_post)
  end

  private 

  def invalid_users_parameters?
    return params[:name] == nil || params[:email] == nil || params[:username] == nil || params[:password] == nil
  end

  def invalid_posts_parameters?
    return params[:title] == nil || params[:content] == nil || params[:create_at] == nil || params[:user_id] == nil
  end

end