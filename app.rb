require 'sinatra'
require 'sinatra/base'
# require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get "/" do
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
    erb(:"users/new")
  end

  post "/users" do
    User.create(params[:name], params[:username], params[:email], params[:password])
    redirect("/")
  end


end
