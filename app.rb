require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'
require 'date'


DatabaseConnection.connect
DatabaseConnection.exec(File.read('./seeds/database_setup.sql'))

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end 

  enable :sessions

  def check_logged_in
    if session[:user_id] == nil
      redirect '/'
    end
  end 

  def set_session(username, user_id)
    session[:username] = username
    session[:user_id] = user_id
  end 

  get '/' do
    return erb(:index)
  end 

  get '/message_board' do
    p session[:user_id]
    check_logged_in
    repo = PostRepository.new
    @username = session[:username]
    @sorted_posts = repo.all_sorted
    return erb(:message_board)
  end 

  get '/signup' do
    return erb(:signup)
  end 

  get '/login' do
    return erb(:login_new)
  end 

  post '/login' do
    username = params[:username]
    password = params[:password]
    repo = UserRepository.new
    id = repo.login(username, password)
    @invalid_entry = false
    if id != nil
      session[:user_id] = id
      session[:username] = username
      redirect '/message_board'
    else
      @invalid_entry = true
      return erb(:login)
    end

  end

  post '/logout' do
    session[:user_id] = nil
    session[:username] = nil
    @loggedout = true
    return erb(:login)
  end 

  post '/signup' do
    repo = UserRepository.new
    user = User.new
    email = params[:email]
    username = params[:username]
    password = params[:password]
    id = repo.sign_up(email, username, password)
    @username_exists = false
    if id != nil
      set_session(username,id)
      redirect '/message_board'
    else
      @username_exists = true
      return erb(:signup)
    end 
  end 

  post "/post_message" do
    repo = PostRepository.new
    date = DateTime.now.strftime("%Y-%m-%d")
    post = Post.new
    post.new_post(date, params[:title], params[:message], session[:user_id], session[:username])
    repo.create_post(post)
    redirect '/message_board'
  end
  
end 

