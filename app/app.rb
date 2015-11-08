ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable 'sessions'
  set :secret_session, 'secrets'

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :sign_up
  end

  post '/signup' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
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
