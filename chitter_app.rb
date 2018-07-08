require 'sinatra/base'
require './lib/message'

class ChitterApp < Sinatra::Base

  get '/' do
    redirect ('/messages')
  end

  get '/messages' do
    @messages = Message.all
    p ENV['ENVIRONMENT']
    erb :index
  end

  get '/messages/new' do
    p ENV['ENVIRONMENT']
    erb :"messages/new"
  end

  post '/messages' do
    p params
    Message.create(message: params['message'])
    p "Form data submitted to the /messages route!"

    redirect '/messages'
  end
end
