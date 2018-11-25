require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/create' do
    user = User.find(session[:user_id])
    Peep.create(user_name: user.user_name, time_stamp: 'NOW()',
                text: params[:text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email],
                user_name: params[:user_name], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
