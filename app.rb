require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :session
  

  get '/' do
    @current_user = session[:current_user]
    erb(:index)
  end

  get '/signup' do
    erb(:sign_up)
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
    Message.create(user_message: params[:message])
    redirect '/messages'
  end

  run! if app_file ==$0
end