ENV["RACK_ENV"] ||= "development"

require './models/user'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/users/new' do
    User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password])
    redirect to ('/welcome')
  end

  get '/welcome' do
    "Welcome to Chitter!"
  end
end
