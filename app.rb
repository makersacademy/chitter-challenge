require 'sinatra/base'
require 'sinatra/flash'
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
    @page = erb(:index)
    erb(:template)
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

    if params[:content].length > 0
      Peep.create(
        content: params[:content],
        user_id: session[:user].id
      )
    else
      flash[:notice] = 'You just tried to submit an empty post!'
    end
    redirect '/'
  end

  # Delete a peep
  post '/peeps/:id/delete' do
    Peep.delete(id: params[:peep_id])
    redirect '/'
  end

  run! if app_file == $0

end
