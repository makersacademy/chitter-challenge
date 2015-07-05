require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/user/register' do
    erb :'user/register'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                username: params[:username])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/sessions/new' do
    erb :'user/login'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'user/login'
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'messages/index'
  end

  get '/peeps/new' do
    erb :'messages/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], created_at: DateTime.now, user_id: session[:user_id])
    redirect '/peeps'
  end

  helpers do

    def current_user
      id ||= session[:user_id]
      User.first(id: id)
    end

  end


end