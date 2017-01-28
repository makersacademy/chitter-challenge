ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/login'
  end

  get '/login' do
    erb :'login/signup'
  end

  post '/user' do
  user = User.create(email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect to('/welcome')
end

  get '/welcome' do
    erb :'login/welcome'
  end

  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  # start the server if ruby file executed directly
run! if app_file == $0
end
