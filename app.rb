require 'sinatra/base'
require './database_connection_setup'
require 'sinatra/flash'

current_dir = Dir.pwd
Dir["#{current_dir}/lib/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @logged_in = session[:logged_in]
    @posts = Post.all
    @user = User
    erb :posts
  end

  post '/add_post' do
    Post.add(params[:body], session[:logged_in_user].id)
    flash[:success] = "Post Created"
    redirect('/')
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    if User.user_exists?(params[:username])
      flash[:error] = "Username already taken"
      redirect('/sign_up')
    elsif User.email_exists?(params[:email])
      flash[:error] = "Email already taken"
      redirect('/sign_up')
    else
      User.add(params[:name], params[:username], params[:email], params[:password])
      session[:logged_in_user] = User.find_by_username(params[:username])
      session[:logged_in] = true
      redirect('/')
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if LoginController.log_in(params[:username], params[:password])
      session[:logged_in_user] = User.find_by_username(params[:username])
      session[:logged_in] = true
      redirect('/')
    else
      flash[:error] = "Invalid Credentails"
      redirect('/login')
    end
  end

  get '/logout' do
    session[:logged_in] = LoginController.log_out
    session[:logged_in_user] = nil
    flash[:success] = "Logged out"
    redirect('/')
  end

end
