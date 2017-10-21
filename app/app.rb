ENV["RACK_ENV"] ||= "development"

require 'data_mapper'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'bonjour'
  end

  get '/users/new' do
    erb :"/users/new"
  end

  post '/users' do
    user = User.create(
      :name => params[:name],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
    session[:current_user_id] = user.id
    redirect '/users/welcome'
  end

  get '/users/welcome' do
    erb :"users/welcome"
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:current_user_id])
   end
end

end

include DataMapperSetup
data_mapper_setup
