require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user.rb'

# Chitter class
class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users' do
    user = User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password])
    case user
    when User::USERNAME_ALREADY_IN_USE
      flash[:notice] = 'Username already in use!'
      redirect('/users/new')
    when User::EMAIL_ALREADY_IN_USE
      flash[:notice] = 'Email already in use!'
      redirect('/users/new')
    else
      session[:username] = user.username
      redirect('/')
    end
  end

  run! if app_file == $PROGRAM_NAME
end
