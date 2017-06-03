ENV['RACK_ENV'] ||= "development"

# require_relative 'datamapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Testing infrastructure working!"
  end

end
