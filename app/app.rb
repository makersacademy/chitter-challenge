ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter  < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :user
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       name: params[:name],
                       user_name: params[:user_name] )
    session[:user_id] = user.id
    redirect '/messages/index'
  end

  get '/messages/index'do
    erb :index
  end

  # start the server if ruby file executed directly
run! if app_file == $0

end
