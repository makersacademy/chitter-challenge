require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user.rb'
require_relative './lib/message.rb'

class Chitter < Sinatra::Base
  set :sessions, true
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/messages' do
    messages = Message.all.map { |m| [m, User.find_by_id(m.user_id).username] }
    current_user = session[:id] ? User.find_by_id(session[:id]) : nil
    erb :messages, locals: { messages: messages, current_user: current_user }
  end

  get '/messages/new' do
    erb :new
  end

  post '/messages/new' do
    Message.create((params['user_id'] = session[:id]) && params)
    redirect '/messages'
  end

  get '/users/new' do
    erb :new_user
  end

  post '/sessions/delete' do
    flash[:message] = "You have successfully logged out."
    session.delete(:id)
    redirect '/messages'
  end

  post '/users/new' do
    session[:id] = User.create params
    redirect '/messages'
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions/new' do
    @user = User.find_by_username params['username']
    if @user && @user.password == params['password']
      session[:id] = @user.id
    else
      flash[:message] = 'Username or password incorrect'
    end
    redirect '/messages'
  end

  run! if app_file == $0
end
