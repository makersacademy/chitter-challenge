require 'sinatra/base'
require './lib/message'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb(:sign_up)
  end

  post '/storage_users' do
    User.create(email: params[:your_email], password: params[:your_password])
    redirect '/create'
  end

  get '/create' do
    mail = User.find
    @e_mail = mail.join("")
    erb(:create_message)
  end

  post '/storage_message' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  get '/messages' do
    @tweets = Message.display
    erb(:list_of_messages)
  end

end
