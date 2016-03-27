ENV['RACK_ENV']||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  include DataMapper::Resource
  enable :sessions

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get ('/users/new') do
    erb(:'users/new')
  end

  post ('/users') do
    user = User.create(username: params[:username],
                       email: params[:email])
    redirect to('/home')
  end

  get ('/home') do
    erb(:home)
  end


end
