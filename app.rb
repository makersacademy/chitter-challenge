require './database_connection_setup'
require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    "Hello World"
  end

end
