require 'sinatra'
require 'sinatra/base'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get "/" do
    erb(:index)
  end

end
