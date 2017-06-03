require 'sinatra/base'
require_relative 'datamapper_config'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/messages' do
    @messages = Message.all
    @user = session[:user]
    erb :messages
  end

  get '/messages/new' do
    erb :new_message
  end

  post '/messages/new' do
    message = Message.create(message: params[:message])
    session[:user] = params[:user_name]
    redirect '/messages'
  end

end
