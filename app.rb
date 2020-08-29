require "sinatra/base"
require 'sinatra/activerecord'
require './db_connection_setup'
require "./lib/chitter"

class App < Sinatra::Base

  get "/" do 
    "Home"
  end

  get "/chitter" do 
    @posts = Chitter.all
    erb :create
  end

  post "/chitter/create" do
    Chitter.create(params[:text])
    redirect "/chitter" 
  end
  
end