ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect to('/users/signup')
  end

  run! if app_file == $0

end
