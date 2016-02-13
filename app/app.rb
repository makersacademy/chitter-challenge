ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    user = User.create(name: params[:name], email: params[:email],
      username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end