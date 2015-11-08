ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable 'sessions'
  set :secret_session, 'secrets'

  get '/' do
    erb :homepage
  end

  get '/signup' do
    @user = User.new
    erb :sign_up
  end

  post '/signup' do
    @user = User.create(name: params[:name], username: params[:username], email:
    params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/peeps' do
    erb :peeps
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :homepage
    end
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  run! if app_file == $0
end
