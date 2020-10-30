require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/test' do
    'Testing Chitter App'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    new_user = User.create(email: params[:email], name: params[:name],
      username: params[:username], password: params[:password])
    session[:user_id] = new_user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    existing_user = User.authenticate(email: params[:email], password: params[:password])
    if existing_user
      session[:user_id] = existing_user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check email or password'
      redirect '/sessions/new'
    end
  end

  run! if app_file == $0
end
