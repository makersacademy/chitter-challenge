require 'sinatra'
require 'sinatra/flash'
require_relative 'db_connection_setup'
require_relative './lib/user'
require_relative './lib/message'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb(:index)
  end

  get '/users/new' do
    erb(:'/users/new')
  end

  post '/users' do
    p params
    user = User.create(params[:email], params[:password], params[:name], params[:username])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:error] = 'Email or Username exists.'
      redirect('/user/new')
    end
  end

  get '/sessions/new' do
    erb(:'/sessions/new')
  end

  post '/sessions' do
    user = User.sign_in(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:error] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  get '/sessions/destroy' do
    session.clear
    flash[:msg] = "You have signed out."
    redirect('/')
  end

  post '/messages' do
    p params
    message = Message.add(params[:content], params[:user_id])
    redirect('/')
  end

  run! if app_file == $0
end
