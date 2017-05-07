ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/testroute' do
    erb :index
  end

  get '/users/list' do
    @users = User.all
    erb :'users/list'
  end

  get '/signup' do
    erb :'signup/new'
  end

end
