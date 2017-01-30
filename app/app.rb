ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride


  get '/' do
    'Hello Chitter! please go to signup'
  end

  get '/signup' do
    erb :signup_page
  end

  post '/users' do
    @user = User.create(user_email: params[:user_email], password: params[:password], password_confirmation: params[:password_confirmation], user_full_name: params[:user_full_name], user_name: params[:user_name])
    if @user.save
        # session[:user_id] = user.id
        session[:id] = @user.id
        redirect to('/welcome')
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :signup_page
      end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/welcome' do
    erb :welcome_page
  end



  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_email], params[:password])
    if user
      session[:id] = user.id
      redirect to('/welcome')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/welcome'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
