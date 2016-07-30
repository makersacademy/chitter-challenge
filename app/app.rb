ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    "Hello world"
  end

  get '/users/new' do
    erb(:new)
  end

  post '/users' do
    User.create(email: params[:email],
                name: params[:name],
                user_name: params[:user_name],
                password: params[:password])
    'Welcome to Chitter!'
  end
end
