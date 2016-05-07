ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :'/session/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:user_name],
                             params[:email],
                             params[:password])
    session[:user_id] = user.id
    redirect '/index'
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/sessions/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
