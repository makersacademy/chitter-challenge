ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/user/signin' do
    erb :signin
  end

  get '/user/signup' do
    erb :signup
  end

  get '/peeps' do
    if user_logged_in?
      @username = session[:user_username]
      erb :peeps
    else
      flash[:error] = 'Please log in first'
      redirect '/user/signin' 
    end
  end

  post '/user/signin' do
    @real_user = User.first(username: params[:username])
    if valid_user?
      start_user_session(@real_user)
      redirect '/peeps'  
    else
      flash[:error] = 'Invalid username or psw, please try again or sign up'
      redirect '/user/signin'
    end
  end

  post '/user/signup' do
    user = create_new_user(params)
    start_user_session(user)
    redirect '/peeps'  
  end

  post '/user/logout' do
    session[:user_username] = nil
    redirect '/'  
  end

  def create_new_user(user_data)
    User.create(name:     user_data[:name],
                surname:  user_data[:surname],
                email:    user_data[:email],
                password: user_data[:password],
                username: user_data[:username]
               ) 
  end

  def start_user_session(user)
    session[:user_username] = user.username
  end

  def valid_user?
    username_exists? &&
    valid_password?
  end

  def username_exists?
    @real_user
  end

  def valid_password?
    BCrypt::Password.new(@real_user.password_digest) == params[:password]
  end

  def user_logged_in?
    session[:user_username]
  end

end
