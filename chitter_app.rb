require 'sinatra/base'
require './lib/message'
require './lib/user'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    p ENV['ENVIRONMENT']
    redirect '/messages'
  end

  get '/messages' do
    @messages = Message.all
    p ENV['ENVIRONMENT']

    erb :index
  end

  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages' do
    Message.create(session[:user_id], message: params['message'],
      date: params['date'])

    p "Form data submitted to the /messages route!"

    redirect '/messages'
  end

  get '/register/new' do
    erb :"register/new"
  end

  post '/register/confirm' do
    user = User.create(first_name: params['first_name'],
      last_name: params['last_name'], date: params['date'])

    # we store the newly registered user's id in a session object so we can
    # parse it to the post '/messages' route
    session[:user_id] = user.id

    p "Form data submitted to the /register route!"
    erb :"register/confirm"
  end
end
