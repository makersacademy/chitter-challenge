ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable  :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password:params[:password], username: params[:username], name: params[:name])
    @user.save
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/index'
  end



  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
