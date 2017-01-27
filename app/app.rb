ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email],
              password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/peeps'  do
    erb :peeps
  end

  run! if app_file == $0
  # run! if app_file == $0
end
