ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    current_user
    erb :index
  end

  get '/sign_up' do
    erb :'/users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/sign_up'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end
end
