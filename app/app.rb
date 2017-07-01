ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative 'data_mapper_config'

class Chitter < Sinatra::Base

  get '/' do
    "Hello"
  end

end
