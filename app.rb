require 'sinatra/base'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/sign_up' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/welcome'
  end

  post '/log_in' do
    @user = User.find_user(username: params[:existing_username])
    session[:user_id] = @user.id
    redirect '/welcome'
  end

  get '/welcome' do
    @user = User.find(id: session[:user_id])
    @users = User.all
    erb :welcome
  end

  get '/user/:id' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.where(user_id: session[:user_id])
    erb :user
  end

  post '/peep' do
    @user = User.find(id: session[:user_id])
    Peep.create(user_id: session[:user_id], peep: params[:peep])
    redirect '/user/:id'
  end

  run! if app_file == $0
end
