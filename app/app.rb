require 'sinatra/base'
#require_relative '../lib/<model>'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

end
