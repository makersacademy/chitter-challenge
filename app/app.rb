ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative 'data_mapper_setup'

class Chittr < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  get '/' do
    erb :'/peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    session[:user_id] = @user.id
    redirect to '/'
  end

end
