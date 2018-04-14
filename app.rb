require 'sinatra/base'
require_relative './lib/message.rb'

class Chitter < Sinatra::Base
  set :sessions, true

  get '/' do
    erb :index
  end

  get '/messages' do
    messages = Message.all
    p messages
    erb :messages, locals: { messages: messages }
  end

  run! if app_file == $0
end
