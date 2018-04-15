require 'sinatra/base'
require_relative './lib/user.rb'
require_relative './lib/message.rb'

class Chitter < Sinatra::Base
  set :sessions, true

  get '/' do
    erb :index
  end

  get '/messages' do
    messages = Message.all
    p "Session id is #{session[:id]}"
    erb :messages, locals: { messages: messages, logged_in: !(session[:id].nil?) }
  end

  get '/messages/new' do
    erb :new
  end

  post '/messages/new' do
    Message.create params
    redirect '/messages'
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users/new' do
    session[:id] = User.create params
    redirect '/messages'
  end

  run! if app_file == $0
end
