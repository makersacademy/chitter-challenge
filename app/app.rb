ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/models/user.rb'
require './app/helpers.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signupinfo' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       name: params[:name],
                       username: params[:username])
    session[:user_id] = user.id
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  run! if app_file == $0
end
