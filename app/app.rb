require 'sinatra/base'
require 'tilt/erb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/home' do
    erb :home
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                       email: params[:email],
                       password: params[:password])
    sessions[:user_id] = user.id
    redirect '/home'
  end




  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end