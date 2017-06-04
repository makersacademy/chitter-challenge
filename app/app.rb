require 'sinatra/base'
require './app/datamapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/messages' do
    @messages = Message.all.reverse
    erb :index
  end

  get '/messages/new' do
    erb :post_message
  end

  post '/messages' do
    message = Message.create(content: params[:content], time: Time.now)
    message.save
    redirect '/messages'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/messages/new'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end


end
