ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper' #Add in
require_relative 'models/user'
require_relative 'data_mapper_setup'
class Chitter < Sinatra::Base

  get '/' do
    erb(:'/index')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect to('/')
  end

end
