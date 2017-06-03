require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/messages' do
    @user = session[:user]
    @message = session[:message]
    erb :messages
  end

  get '/messages/new' do
    erb :new_message
  end

  post '/messages/new' do
    session[:user] = params[:user_name]
    session[:message] = params[:message]
    redirect '/messages'
  end

end
