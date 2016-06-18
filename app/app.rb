ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect to('/')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
