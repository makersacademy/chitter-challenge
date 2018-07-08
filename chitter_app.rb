require 'sinatra/base'
require './lib/message'
require './lib/user'


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
    Message.create(message: params['message'], date: params['date'])
    p "Form data submitted to the /messages route!"

    redirect '/messages'
  end

  get '/register/new' do
    p params
    erb :"register/new"
  end

  post '/register/confirm' do
    User.create(first_name: params['first_name'], last_name: params['last_name'], date: params['date'])

    p params
    p "Form data submitted to the /register route!"
    erb :"register/confirm"
  end
end
