ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
# require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
