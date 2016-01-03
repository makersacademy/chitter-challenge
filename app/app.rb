require 'sinatra/base'
require 'data_mapper'
require_relative '../data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                name: params[:name],
                user_name: params[:user_name])
    session[:user_id] = user.id
    redirect to('/welcome')
  end

  get '/welcome' do
    erb :home
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
