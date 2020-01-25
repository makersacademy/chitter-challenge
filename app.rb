require 'sinatra/base'
require_relative './lib/peeps'
require './lib/users'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = Users.find(session[:user_id])
    erb :'index'
  end

  get '/peeps' do
    @peeps = Peeps.all.sort_by { |a| -a.id.to_i }
    erb :'peeps/peeps'
  end

  post '/peeps-add' do
    @user = Users.find(session[:user_id])
    Peeps.create(message: params[:peep], user_id: @user.id)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new_peep'
  end

  get '/users/new' do
    erb :'/users/new_user'
  end

  post '/user-add' do
    user = Users.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'/users/user_sign_in'
  end

  post '/sessions' do
    user = Users.authenticate(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
