require 'sinatra/base'
require 'data_mapper'
require './lib/models'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.get(session[:user_id])
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      name: params['name'],
      username: params['username'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
