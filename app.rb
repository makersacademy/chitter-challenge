require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    @peep = Peep.all
    erb :"peeps/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(email: params['email'], password: params['password'], name: params['name'], username: params['username'])
    session[:user_id] = @user.id
    redirect '/'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    time = DateTime.now
    Peep.create(params['message'], time)
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])
    session[:id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
