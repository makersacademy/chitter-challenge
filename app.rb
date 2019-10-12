require 'sinatra/base'
require 'data_mapper'
require 'pg'

# require './datamapper_setup'

# Models
require './lib/db_connection'
require './lib/user'

# Helpers
require './database_connection'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @user = session[:user]
    erb(:index)
  end

  post '/users/new' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user] = user # User signed in automatically after registration
    redirect '/'
  end

  post '/users/session' do
    user = User.authenticate(
      email: params[:email],
      password: params[:password]
    )
    session[:user] = user # This should not coincide with registration scenario
    redirect '/'
  end

  run! if app_file == $0

end
