require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get '/messages' do
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb :messages
  end

  get '/messages-by-oldest' do
    @user = User.find(session[:user_id])
    @messages = Message.all.reverse
    erb :messages_by_oldest
  end

  get '/register' do
    erb :register
  end

  get '/log-out' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/sessions' do
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE username = $1",
      [params[:username]]
    )
    user = User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])

    session[:user_id] = user.id
    redirect('/messages')
  end

  post '/messages' do
    Message.create(text: params[:text], user_id: session[:user_id])
    redirect '/messages'
  end

  post '/users' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  run! if app_file == $0
end
