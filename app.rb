require 'sinatra/base'
require './lib/user'

class ChitterManager < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/chitters' do
    @user = session[:user]
    erb :'chitters/index'
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user] = @user
    redirect '/chitters'
  end

  run! if app_file == $0
end
