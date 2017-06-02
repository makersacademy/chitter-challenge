ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
# require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
end
