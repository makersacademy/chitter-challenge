require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/users/new')
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
