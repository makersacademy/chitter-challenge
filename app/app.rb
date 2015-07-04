require 'sinatra/base'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :sessions_secret, 'super secret'
  
  get '/' do 
    'Chitter-Challenge'
    erb :'index'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],email: params[:email],username: params[:username],password: params[:password])
    # ,password: params[:password])
    @user.save
    redirect to('/main')
  end

  get '/main' do
    erb :'main'
  end
 
  # start the server if ruby file executed directly
  run! if app_file == $0


 end
