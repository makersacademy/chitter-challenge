require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/messages' do
    @messages = Message.all
    erb :messages
  end

  get '/messages-by-oldest' do
    @messages = Message.all.reverse
    erb :messages_by_oldest
  end

  post '/messages' do
    Message.create(text: params[:text])
    redirect '/messages'
  end

  post '/sign-up' do
    User.create(username: params[:username], password: params[:password])
    redirect '/messages'
  end

  run! if app_file == $0
end