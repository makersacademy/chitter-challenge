ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/chitter'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do 
    erb :'chits/new'
  end

  post '/chits' do
  Chit.create(chitter_post: params[:chitter_post], user: params[:user])
  redirect to('/chits')
  end

  get '/users/new' do
  erb :'users/new'
  end

  post '/users' do
  user = User.create(email: params[:email],
                     password: params[:password])
  session[:user_id] = user.id
  redirect to('/chits')
  end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  run! if app_file == $0

end