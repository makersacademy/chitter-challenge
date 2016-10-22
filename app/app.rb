ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'index'
  end

  get '/users/sign_up' do
    erb :'users/sign_up'
  end

  post '/users' do
    user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                user_name: params[:user_name])
    session[:user_id] = user.id
    redirect('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
