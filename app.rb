require_relative 'lib/database_connection'
require_relative "lib/PostsRepository"
require_relative 'lib/UsersRepository'
require 'sinatra/reloader'
require 'sinatra'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
    enable :sessions
  end

  get '/' do 
    return erb(:home_page)
  end 

  get '/stream' do
    repo = PostsRepository.new
     @posts = repo.all
    if session[:user_name] == nil
      @users = []
      repo.all.reverse.each{|post|
      @users << PostsRepository.new.find_user_by_post(post)}
      return erb(:stream)
    else
      return erb(:stream_user_active)
    end
  end

  get '/post' do
    @time = Time.now.asctime
    return erb(:new_post)
  end

  post '/post/added' do 
    repo = PostsRepository.new
    post = Post.new
    @content = params[:content]
    post.content = params[:content]
    post.date_created = params[:date_created]
    post.user_id = nil
    post.posted_by = session[:user_username]
    @posted_by = session[:user_username]
    repo.create(post)
    return erb(:added_post)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do 
    repo = UsersRepository.new
    email = params[:email]
    password = params[:password]
    if repo.find_by_email(email) != false
      user = repo.find_by_email(email)
    else
      @incorrect_field = "Email"
      return erb(:login_error)
    end 
    if repo.sign_in(email, password)
      @username = user.username
      session[:user_username] = user.username
      return erb(:login_success)
    else 
      @incorrect_field = "Password"
      return erb(:login_error)
    end 
  end 

  
  get "/new_user" do 
    return erb(:new_user)
  end

  post "/new_user/added" do
    repo = UsersRepository.new
    user = User.new
    user.username = params['user_name']
    user.email = params['email']
    user.password = params['password']
    repo.create(user)
    @username = user.username
    return erb(:user_added)
  end 

  get "/log-out" do
    return erb(:logout)
  end

  get "/log-out/completed" do
    session.delete(:user_username)
    return erb(:logout_success)
  end 

end
