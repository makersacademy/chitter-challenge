ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative 'data_mapper_setup'

class Chittr < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'/peeps/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    redirect to '/'
  end

end
