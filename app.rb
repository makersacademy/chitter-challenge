require 'sinatra/base'
require './lib/peep.rb'
require "./lib/select_database.rb"
require "./lib/user.rb"

class Chitter < Sinatra::Base
  enable :sessions

  get "/" do
    @peeps = Peep.all
    @user = User.find(session[:user_id])
    erb :index
  end

  post "/peep/new" do
    Peep.add(params[:new_peep])
    redirect "/"
  end

  get "/users/new" do 
    erb :"users/new"
  end

  post "/users" do
    user = User.create(email: params["email"], username: params["username"], name: params["name"], password: params["password"])
    session[:user_id] = user.id
    redirect("/")
  end
end
