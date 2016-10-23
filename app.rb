ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'app/data_mapper_setup'


class Chitter < Sinatra::Base

  set :root, 'app'

  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/peeps' do
    erb :peeps
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
