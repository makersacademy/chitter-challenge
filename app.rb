require 'sinatra/base'
require './lib/chat.rb'

class Chitter < Sinatra::Base
  get '/' do
    "Hello Chitter"
  end

  get '/messages' do

    @messages = Chat.all
    erb :'/messages/index'

  end

  run! if app_file == $0
end