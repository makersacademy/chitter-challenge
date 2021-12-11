require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/messages' do
    session[:order] = params[:order]
    @messages = Message.all(session[:order])
    @user = User.find(session[:user_id])

    erb :messages
  end

  get '/register' do
    erb :register
  end

  get '/log-out' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/replies' do
    @messages = Message.all(session[:order])
    @message_id = params[:message_id]
    @replies = [ ]
    erb :reply
  end

  get '/replies/new' do
    @messages = Message.all(session[:order])
    @message_id = params[:message_id]
    erb :reply
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user.nil?
      flash[:warning] = 'Invalid username or password.'
      redirect '/'
    end
    session[:user_id] = user.id
    redirect '/messages'
  end

  post '/messages' do
    Message.create(text: params[:text], user_id: session[:user_id])
    redirect '/messages'
  end

  post '/users' do
    user = User.create(username: params[:username], password: params[:password])
    if user.nil?
      flash[:warning] = 'Username already exists.'
      redirect '/'
    end
    session[:user_id] = user.id
    redirect '/messages'
  end

  run! if app_file == $0
end
