require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/sign_up' do
    erb :'users/sign_up'
  end

  post '/users' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect to('/')
  end

end
