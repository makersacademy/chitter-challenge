require 'bcrypt'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/message'
require './lib/user'
require'./lib/database_connection'
require './database_setup_script'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions, :method_override

  before do 
    @user = User.find(session[:user_id])
  end

  get '/' do
    erb(:home)
  end

  get '/messages' do
    @messages = Message.all
    erb(:messages)
  end

  post '/messages/:id' do
    Message.create(text: params[:message], user_id: params[:id])
    redirect '/messages'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  post '/sessions' do
    user = User.authentication(username: params[:username], password: params[:password])

    if user 
      session[:user_id] = user.id
      redirect('/messages')
    else
      flash[:notice] = 'Please check your details.'
      redirect '/'
    end
  end

  post '/sessions/destroy' do
    session[:user_id] = nil
    flash[:notice] = 'You have logged out.'
  end

  run! if app_file == $0

end
