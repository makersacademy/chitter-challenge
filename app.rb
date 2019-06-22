require 'sinatra/base'
require './lib/message'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @current_user = session[:current_user]
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    session[:current_user] = User.create(
      name: params[:name],
      username: params[:username],
      password: params[:password],
      email: params[:email]
    )
    redirect '/'
  end

  get '/messages' do
    @messages = Message.all
    erb(:view_messages)
  end

  get '/messages/new' do
    erb(:new_message)
  end

  post '/messages' do
    @current_user = session[:current_user]
    Message.create(user_message: params[:message], username: @current_user.username )
    redirect '/messages'
  end

  run! if app_file ==$0

end
