ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'tilt/erb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  get '/user/new' do
    erb(:sign_up_form)
  end

  post '/user/new' do
    user = User.create(name: params[:name],
             email: params[:email],
             username: params[:username],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/user/logged_in'
  end

  get '/user/login' do
    erb(:login_form)
  end

  get '/user/logged_in' do
    @name = current_user.name if current_user
    @welcome = "Welcome, #{@name}" if @name
    erb(:logged_in)
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
