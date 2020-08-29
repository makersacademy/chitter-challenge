require "sinatra/base"
require 'sinatra/activerecord'

class App < Sinatra::Base

  get "/" do 
    "Home"
  end
  
end