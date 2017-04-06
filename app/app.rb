ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set    :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @user = User.first
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.all
    erb :'users/new'
  end

  post '/users' do
    email = params[:email]
    password = params[:password]
    name = params[:name]
    user_name = params[:user_name]
    User.create(email: email, password: password, name: name, user_name: user_name)
    redirect '/peeps', 303
  end

  run! if app_file == $0

end
