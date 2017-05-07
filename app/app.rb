ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/index'
  end

  get '/index' do
    erb :'index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to '/index'
  end

  helpers do
    def current_user(email)
      "#{email}"
    end
  end

  get '/:email' do
    current_user(params['email'])
  end

end
