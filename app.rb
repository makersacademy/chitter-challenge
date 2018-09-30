require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base

  get '/' do
      @messages = Messages.all
      erb :'messages/index'
  end

  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages' do
    Messages.create(messages: params['messages'])
    redirect '/'
end

  run! if app_file == $0
end
