ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/dm_start'


class Chitter < Sinatra::Base
  get "/" do
    erb(:homepage)
  end
end
