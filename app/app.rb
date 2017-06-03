require 'sinatra/base'
require_relative 'datamapper_config'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/messages' do
    @messages = Message.all(:order => [:created_at.desc])
    @user = session[:user]
    erb :messages
  end

  get '/messages/new' do
    erb :new_message
  end

  post '/messages/new' do
    Message.create(message: params[:message])
    session[:user] = params[:user_name]
    redirect '/messages'
  end

end
