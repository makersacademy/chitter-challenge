ENV["RACK_ENV"] = "development"

require_relative 'models/link'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :'links/index'
  end
end
