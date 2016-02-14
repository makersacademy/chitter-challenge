ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/models/user.rb'
require './app/helpers.rb'

class Chitter < Sinatra::Base
  enable :sessions
  # set :session_secret, 'super secret'

  get '/' do
    @user = User.first(id: session[:user_id])
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signupinfo' do
    @user = User.new(email: params[:email],
                       password: params[:password],
                       name: params[:name],
                       username: params[:username])
    session[:user_id] = @user.id
    @user.save
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  run! if app_file == $0
end
