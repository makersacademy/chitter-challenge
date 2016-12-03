ENV['RACK_ENV'] ||= 'development'

require 'pry'
require 'sinatra/base'
require_relative './models/user.rb'
require 'data_mapper'
# require_relative './models/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Chitter!'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    user = User.create(name: params[:name],
             user_name: params[:user_name],
             email: params[:email],
             password: params[:password],
             confirm_password: params[:confirm_password])
    # binding.pry
    session[:user_id] = user.id
    redirect '/message'
  end

  get '/message' do
    erb :messages
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
