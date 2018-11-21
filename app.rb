require 'sinatra/base'
require './lib/peep'
require_relative './database_connection_setup'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  # register Sinatra::Flash
  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  post '/peeps' do
    @peeps = Peep.create(
      message: params[:message],
      created_at: Time.now
    )
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  get '/' do
    "Timeline"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :"chitter/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      name: params['name'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/users/new' do
    user = User.create(
      name: params['name'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
