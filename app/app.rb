ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/user' do
    erb :'user/new'
  end

  post '/user' do
    user = User.create(user_name: params[:user_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
