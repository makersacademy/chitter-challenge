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
    Peeps.create(message: params[:peep])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new_peep'
  end

  get '/users/new' do
    Users.create(username: params[:username], email: params[:email], password: params[:password])
    erb :'/users/new_user'
  end

  post '/user-add' do
    user = Users.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
