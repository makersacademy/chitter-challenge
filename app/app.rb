ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users' do
    User.create(user_name: params[:user_name],
              email: params[:email])
    redirect to('/users/signup')
  end

  run! if app_file == $0

end
