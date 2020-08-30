require "sinatra/base"
require 'sinatra/activerecord'
require './db_connection_setup'
require "./lib/chitter"
require './lib/user'

class App < Sinatra::Base

  get "/" do 
    "Home"
  end

  get "/chitter" do 
    @posts = params[:Display] == "old" ? Chitter.all : Chitter.reverse_all
    erb :create
  end

  post "/chitter/create" do
    Chitter.create(params[:text])
    redirect "/chitter" 
  end

  get "/user/sign_up" do 
    erb :sign_up
  end

  post "/user/new" do 
    User.create(params[:name], params[:email], params[:password])
    erb :user_sign_up_status
  end
  
end