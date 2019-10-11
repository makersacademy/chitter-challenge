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
    session[:user] = user
    redirect '/'
  end

  run! if app_file == $0

end
