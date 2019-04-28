require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :session
  enable :sessions

  get '/' do
    'Chitter'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps/index'
    else
      'Incorrect email or password'
      redirect '/sessions/new'
    end
  end

  get '/peeps/index' do
  @user = User.find(id: session[:user_id])
  @peeps = Peep.all
  erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(content: params[:content])
    redirect '/peeps/index'
  end

  run! if app_file == $0
end
