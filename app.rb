ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/message' do
    message = Message.create(content: params[:content])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.authenticate(params[:email], params[:password])
    if user
      redirect '/'
    else  
      user = User.create(email: params[:email], password: params[:password])
      if user
        session[:user_id] = user.id
        redirect '/profile'
      else
        redirect '/'
      end
    end
  end

  run! if app_file == $0
end