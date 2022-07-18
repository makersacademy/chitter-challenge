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
    @users = UserRepository.new
    email = params[:email]
    username = params[:username]

    if @users.find_username(username) == nil && @users.find_email(email) == nil
      @user = User.new
      @user.email = email
      @user.username = username
      @user.name = params[:name]
      @user.password = params[:password]
      @users.create(@user)
      return erb(:signup_confirmation)
    else
      return erb(:signup_error)
    end
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    @users = UserRepository.new
    @posts = PostRepository.new
    username = params[:username]
    password = params[:password]

    @user = @users.find_username(username)
    if @user == nil
      return erb(:login_error)
    end

    if @user.password != password
      return erb(:login_error)
    end
    return erb(:user_account)
  end

  get '/:username' do
    repo = UserRepository.find_username(params[:username])
    return erb(:user_account)
  end

  post '/new_post' do
    @users = UserRepository.new
    @posts = PostRepository.new

    user_id = params[:user_id].to_i
    @user = @users.find(user_id)

    post = Post.new
    post.message = params[:message]
    post.timestamp = params[:timestamp]
    post.user_id = user_id
    @posts.create(post)

    return erb(:user_account)
  end
end
