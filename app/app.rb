ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require_relative 'models/message'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:'index')
  end

  get '/messages' do
    @messages = Message.all
    erb(:'messages/index')
  end

  get '/messages/new' do
    erb(:'messages/new')
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(email: params[:email],
                    password: params[:password],
       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/messages')
  end


  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  run! if app_file == $0
end
