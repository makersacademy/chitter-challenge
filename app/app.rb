 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/feed' do
    erb :feed
  end

  get '/create_account' do
    erb :create_account
  end

  post '/new_account' do
    user = User.create(name: params[:name],
    email: params[:email],
    handle: params[:handle],
    password: params[:password])
    session[:user_id] = user.id
    redirect to('/confirm_account')
  end

  get '/confirm_account' do
    erb :confirm_account
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
