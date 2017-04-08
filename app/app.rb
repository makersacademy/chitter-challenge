ENV['RACK_ENV']||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::flash

  # User sign up
  get '/users/new' do
    erb :'users/new'
  end

  # Store user details
  post 'users' do
    User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to :'/peeps'
  end

  # View peeps
  get '/peeps' do
    erb :'peeps'
  end


end
