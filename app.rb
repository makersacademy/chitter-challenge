ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/user.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/chitter')
  end

  get '/chitter' do
    erb :chitter
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
