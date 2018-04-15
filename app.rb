require 'sinatra/base'
require_relative './lib/message.rb'

class Chitter < Sinatra::Base
  set :sessions, true

  get '/' do
    erb :index
  end

  get '/messages' do
    messages = Message.all
    erb :messages, locals: { messages: messages }
  end

  get '/messages/new' do
    erb :new
  end

  post '/messages/new' do
    Message.create params
    redirect '/messages'
  end

  run! if app_file == $0
end
