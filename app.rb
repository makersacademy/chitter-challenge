require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :homepage
  end
end