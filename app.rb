require 'sinatra/base'
require '././lib/message'
require '././lib/user'
require '././lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :method_override
  enable :sessions

  get '/' do
    @messages = Message.all
    @user = session[:user]
    erb :index
  end

  get '/registration' do
    erb :registration
  end

  post '/registered' do
    session[:user] = User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect '/'
  end

  get '/message' do
    erb :message
  end

  post '/message' do
    Message.create(message: params[:message], time: Time.now)
    redirect '/'
  end

  run! if app_file == $0
end
