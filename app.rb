require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'pg'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @peeps = Peep.all
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      name: params['name'],
      username: params['username'],
      email: params['email'],
      password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
