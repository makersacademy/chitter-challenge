require 'sinatra/base'
require './lib/posting_msg'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    "Bienvenidos a Chitter"
  end

  get '/chat' do
    @chat = Chat.all
    erb :chat
  end

  post '/chat' do
    Chat.add(nickname: params[:nickname], msg: params[:msg])
    redirect '/chat'
  end

  run! if app_file == $0
end
