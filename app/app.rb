ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users' do
    p params
    @users = User.all
    erb :'users/list'
  end

  post '/users' do
    User.create(name: params[:name], username: params[:username], email: params[:email])
    redirect '/users'
  end

  get '/users/new' do
    erb :'users/new'
  end

end
