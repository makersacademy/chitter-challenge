require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    if session[:user_id] != nil
      redirect '/feed'
    else
      return erb(:index)
    end
  end
  
  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email = params[:email]
    submitted_password = params[:password]
    repo = UserRepository.new
    user = repo.find_by_email(email)
    if submitted_password == user.password
      session[:user_id] = user.id
      session[:name] = user.name
      session[:username] = user.username
      @login_success = true
      redirect '/feed'
    else 
      redirect '/feed'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/feed'
  end
  
  get '/feed' do
    repo = PostRepository.new
    posts = repo.all
    @feed = posts.sort_by { |post| [post.date, post.time] }.reverse
    return erb(:feed)
  end

  post '/feed' do
    repo = PostRepository.new
    time = Time.now
    @post = Post.new
    @post.content = params[:content]
    @post.user_id = session[:user_id] ||= params[:user_id]
    @post.date = time.strftime("%Y/%m/%d")
    @post.time = time.strftime("%k:%M:%S")
    repo.create(@post)
    redirect '/feed'
  end

  get '/users/new' do
    return erb(:new_user)
  end

  get '/users/:id' do
    repo = UserRepository.new
    @user = repo.find_posts(params[:id])
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
    repo.create(@user)
  end

end



