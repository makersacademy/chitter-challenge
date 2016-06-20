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
    @username = session[:user_username]
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/newpeep' do
    login_required unless user_logged_in?
    erb :newpeep
  end

  post '/peeps/newpeep' do
    login_required unless user_logged_in?
    new_peep(params[:content])
    redirect '/peeps' 
  end

  post '/user/signin' do
    login_error unless valid_user?(params)
    user = User.first(username: params[:username]) 
    start_user_session(user)
    redirect '/peeps'  
  end

  post '/user/signup' do
    user = initialize_new_user(params)
    signup_error(user) if existing_user?(params)
    user.save 
    start_user_session(user)
    redirect '/peeps'  
  end

  post '/user/logout' do
      session[:user_username] = nil
      redirect '/peeps'  
  end


  def initialize_new_user(user_data)
    User.new( name:     user_data[:name],
              surname:  user_data[:surname],
              email:    user_data[:email],
              password: user_data[:password],
              username: user_data[:username]
            ) 
  end

  def new_peep(content)
    user = User.first(username: session[:user_username])
    peep = Peep.create(content: content, date: Time.now, user_id: user.id)
  end

  def start_user_session(user)
    session[:user_username] = user.username
  end
  
  def user_logged_in?
    session[:user_username]
  end

  def login_required
    flash[:error] = 'Please log in first'
    redirect '/user/signin' 
  end

  def login_error
    flash[:error] = 'Invalid username or psw, please try again or sign up'
    redirect '/user/signin'
  end

  def signup_error(user)
    user.save
    flash[:error] = user.errors.full_messages
    redirect '/user/signup'
  end

  def valid_user?(user_data)
    User.validate(user_data)
  end

  def existing_user?(user_data)
    User.first(username: user_data[:username])
  end
end
