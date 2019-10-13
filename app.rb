require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'pg'
require 'bcrypt'

# require './datamapper_setup'

# Models
require './lib/db_connection'
require './lib/user'
require './lib/peep'

# Helpers
require './database_connection'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  set :public_folder, File.dirname(__FILE__) + "/static"

  register Sinatra::Flash

  # Index Page
  get '/' do
    @user = session[:user]
    @feed = Peep.all
    erb(:index)
  end

  # Sign Up
  post '/users/new' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    if user == 'Email exists'
      flash[:notice] = 'An account already exists with this email address. Please use another.'
    elsif user == 'Username exists'
      flash[:notice] = 'An account already exists with this username. Please choose another.'
    else
      session[:user] = user
    end
    redirect '/'
  end

  # Sign In
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

  # Sign Out
  post '/users/:id/session/destroy' do
    session.clear
    flash[:notice] = "You have successfully signed out."
    redirect '/'
  end

  # Post a new peep
  post '/peeps/new' do
    Peep.create(
      content: params[:content],
      user_id: session[:user].id
    )
    redirect '/'
  end

  run! if app_file == $0

end
