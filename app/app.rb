require 'sinatra/base'
require 'pry'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end
end
