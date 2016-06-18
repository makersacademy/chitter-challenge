require 'sinatra/base'
require_relative  './models/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :'/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'/new_user'
  end

  post '/users/new' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    if @user.save
      session[:user_id] = @user.id
    redirect '/users'
    else
      redirect '/users/new'
    end
  end


  get '/users' do
    erb :'start_chitter'
  end

  post '/signin' do
    redirect '/users'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
