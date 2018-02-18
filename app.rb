require 'sinatra'
require 'sinatra/base'
# require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get "/" do
    # Fetch the user from the database, using an ID stores in the sessions
    # @user = User.find(session[:user_id])
    @peeps = Peep.all
    @users = User.all
    erb(:index)
  end

  post "/peeps/new" do
    @peeps = Peep.all
    @user = User.all
    Peep.create(params['peep'])
    # User.create(name: params['name'], username: params['username'], password: params['password'], email: params['email'])
    erb(:index)
    redirect("/")
  end

  get "/users/new" do
    # see the form
    erb(:register)
  end

  post "/users" do
    # Users are created here and then directed to get "/"
    # To persist info across a redirect, we need to user the session
    user = User.create(params[:name], params[:username], params[:email], params[:password])
    # session[:user_id] = user.id
    redirect("/")
  end


end
