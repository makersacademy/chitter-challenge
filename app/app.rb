ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class Chitter < Sinatra::Base

  require_relative 'data_mapper_setup'

  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
    erb :'users/new'
  end

  get '/' do
    erb :'/peeps/index'
  end

  post '/users' do
    user = User.create( name: params[:name],
                        email: params[:email],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
