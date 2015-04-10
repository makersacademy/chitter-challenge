require 'sinatra/base'
require 'data_mapper'
require_relative 'models/data_mapper_setup'
DataMapper.auto_upgrade!
class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    @user = User.first(id: session[:id])
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    email = params[:email]
    username = params[:username]
    @user = User.new(email: email,
                     username: username)
    @user.save
    session[:id] = @user.id
    redirect '/'
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
