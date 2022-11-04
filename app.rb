require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end

  get '/feed' do
    repo = PostRepository.new
    posts = repo.all
    @feed = posts.sort_by { |post| [post.date, post.time] }.reverse
    return erb(:feed)
  end

  get '/feed/new' do
    return erb(:new_post)
  end

  post '/feed' do
    repo = PostRepository.new
    time = Time.now
    @post = Post.new
    @post.content = params[:content]
    @post.user_id = session[:user_id]
    @post.date = time.strftime("%Y/%m/%d")
    @post.time = time.strftime("%k:%M:%S")
    repo.create(@post)
    p session[:user_id]
    p @post.user_id
    redirect '/feed'
  end

  get '/users/new' do
    return erb(:new_user)
  end

  get '/users/:id' do
    repo = UserRepository.new
    @user = repo.find(params[:id])
    @user_feed = @user.posts.sort_by { |post| [post.date, post.time] }.reverse
    return erb(:user)
  end

  post '/users' do
    repo = UserRepository.new
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    @user.email = params[:email]
    @user.name = params[:name]
    session[:user_id] = @user.id
    repo.create(@user)
    redirect '/feed'
  end

end