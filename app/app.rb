ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require_relative 'models/user'
require 'pry'
require 'bcrypt'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
      user = User.create( email: params[:email],
                          password: params[:password],
                          name: params[:name],
                          username: params[:username])
      user.save
      session[:user_id] = user.id
      session[:name] = user.name
      redirect to ('/')
  end

  get '/' do
    @name = session[:name]
    erb :'index'
  end

end
