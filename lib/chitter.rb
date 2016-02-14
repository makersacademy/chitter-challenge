ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'tilt/erb'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/user/new' do
    @user = User.new
    erb(:sign_up_form)
  end

  post '/users' do
    @user = User.create(name: params[:name],
             email: params[:email],
             username: params[:username],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:sign_up_form)
    end
  end

  get '/user/login' do
    erb(:login_form)
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
