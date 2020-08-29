require "sinatra/base"
require 'sinatra/activerecord'
require './db_connection_setup'

class App < Sinatra::Base

  get "/" do 
    "Home"
  end

  get "/chitter" do 
    erb :create
  end
  
end