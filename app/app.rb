ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/user'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/peeps'
  end

  # get '/peeps/new' do
  #
  # end

  # post '/peeps' do
  #
  # end

  # get '/users' do
  #
  # end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                      name: params[:name],
                      email_address: params[:email_address],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect ('/peeps')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
