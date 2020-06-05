require_relative 'database_connection_setup'
require 'sinatra'

class ChitterWebApp < Sinatra::Base

  get '/' do
    erb(:login)
  end

end
