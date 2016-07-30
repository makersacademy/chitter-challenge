ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'models/user'
require_relative 'data_mapper_setup'



class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super-secret'

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    erb(:new)
  end

  post '/users' do
    user = User.create(email: params[:email],
                name: params[:name],
                user_name: params[:user_name],
                password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
