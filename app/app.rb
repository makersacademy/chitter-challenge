ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative 'data_mapper_setup'

class Chittr < Sinatra::Base
  enable :sessions

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
    )
    redirect to '/'
  end

end
