require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'pg'
require 'bcrypt'

# require './datamapper_setup'

# Models
require './lib/db_connection'
require './lib/user'

# Helpers
require './database_connection'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

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

  post '/users/session' do

    user = User.authenticate(
      email: params[:email],
      password: params[:password]
    )
    if user
      session[:user] = user
    else
      flash[:notice] = 'Please check your email or password.'
    end
    redirect '/'
  end

  run! if app_file == $0

end
