ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup.rb'

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'

  get '/chitter' do
    @user = session[:user_id]
    if @user
    @username = User.first(:id => @user).name
    end
    erb(:chitter_main_page)
  end

  get '/chitter/signup'do
    erb(:chitter_signup)
  end
  post '/chitter/users'do
    User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password])
  end

  get '/chitter/login'do
    erb(:chitter_login)
  end

  post '/chitter/logout'do
    session[:user_id] = nil
  end

  post '/sessions'do
  user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/chitter')
    else
      erb :'chitter_login'
    end
  end

run! if app_file == $0
end
