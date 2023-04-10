require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/user'
require_relative 'lib/post'
require_relative 'helpers/helpers'

class ChitterApplication < Sinatra::Base
  enable :sessions
  helpers ApplicationHelpers

  configure :development do
    register Sinatra::Reloader
    register Sinatra::ActiveRecordExtension
  end

  before do   
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  get '/' do
    @posts = Post.includes(:children, :user)
             .joins(:user)
             .order(created_at: :desc)
             .order("children_posts.created_at": :asc)
             .all
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    username, plaintext_password = params[:username], params[:password]
    validate([username, plaintext_password], reroute="login")
    user = User.find_by(username: username)
    return redirect('/login') if user == nil
    if BCrypt::Password.new(user.password_digest) == plaintext_password
      session[:user_id] = user.id
      return redirect('/')
    else
      return redirect('/login')
    end
  end

  get '/create_post' do
    ask_for_login
    erb :create_post
  end

  post '/create_post' do
    ask_for_login
    validate([params[:content]], reroute="create_post")
    create_post(current_time=params[:created_at])
    return redirect('/')
  end

  get '/reply/:id' do
    ask_for_login
    @original_post = Post.joins(:user).find(params[:id])
    erb :create_reply
  end

  post '/reply/:id' do
    ask_for_login
    validate([params[:content]], reroute="reply/#{params[:id]}")
    create_post(params[:id])
    return redirect('/')
  end
    
  get '/register' do
    erb :register
  end

  post '/register' do
    username, password, email, real_name = params[:username], params[:password], params[:email], params[:real_name]
    validate([username, password, email, real_name], reroute="register")
    return redirect('/register') if !!User.find_by(username: username) || !!User.find_by(email: email)
    new_user = User.new
    encrypted_password = BCrypt::Password.create(password)
    new_user.username, new_user.password, new_user.email, new_user.real_name = username, encrypted_password, email, real_name
    new_user.save
    session[:user_id] = new_user.id
    return redirect('/')
  end

  get '/logout' do
    session.clear
    return redirect('/')
  end
end