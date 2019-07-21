require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/chitter'
require './lib/database_connection_setup'
require 'uri'
require 'sinatra/flash'

class ChitterManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/message/index')
    else
      flash[:notice] = 'Incorrect email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

 post '/users' do
  user = User.create(email: params['email'], password: params['password'])
  session[:user_id] = user.id
  redirect '/message/index'
  end

  get '/message/index' do
    @user = User.find(id: session[:user_id])
    @chitter = Chitter.open
    erb :message_index
  end

  get '/message/new' do
    erb :message_new
  end

  post '/message_create' do
    post_time = Time.now.strftime("%d/%m/%Y %H:%M")
    Chitter.create(params[:nickname], params[:message], post_time)
    redirect '/message/index'
  end
end
